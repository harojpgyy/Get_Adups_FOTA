#!/usr/bin/env python
import hashlib
import json
import random
import subprocess
from tbm13_utils.all import *

def get_device_property(property_name):
    """
    使用 adb shell getprop 获取设备属性值
    """
    try:
        result = subprocess.run(
            ["adb", "shell", "getprop", property_name],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            encoding="utf-8"  # 强制使用 utf-8 编码
        )
        if result.returncode == 0 and result.stdout:  # 确保 stdout 不为 None
            return result.stdout.strip()
        else:
            error(f"Error getting property {property_name}: {result.stderr.strip() if result.stderr else 'Unknown error'}")
            return None
    except FileNotFoundError:
        error("Error: adb 未安装或未配置到系统 PATH 中")
        return None

def load_properties_from_device():
    """
    从设备加载属性并返回值
    """
    properties = {
        "RO_FOTA_OEM": "ro.fota.oem",
        "RO_FOTA_DEVICE": "ro.fota.device",
        "RO_PRODUCT_LOCALE": "ro.product.locale",
        "RO_OPERATOR_OPTR": "",
        "RO_FOTA_VERSION": "ro.fota.version"
    }

    loaded_properties = {}
    for var, prop in properties.items():
        value = get_device_property(prop)
        if value:
            loaded_properties[var] = value
        else:
            error(f"Unable to retrieve {prop} from the device.")
            exit(1)  # 如果任何属性无法获取，终止程序

    return loaded_properties

def create_config(properties: dict) -> dict[str, str]:
    operator = {
        "OP01": "CMCC",
        "OP02": "CU"
    }.get(properties["RO_OPERATOR_OPTR"], "other")

    return {
        'project': '_'.join([
            properties["RO_FOTA_OEM"].replace('_', '$'),
            properties["RO_FOTA_DEVICE"].replace('_', '$'),
            properties["RO_PRODUCT_LOCALE"].replace('_', '$'),
            operator
        ]),
        'version': properties["RO_FOTA_VERSION"]
    }

def encode_data(s: str) -> str:
    data = bytes(s, 'utf8')

    useless_bytes_num = random.randint(0, 14)
    random_bytes_num = random.randint(0, 11) + 3
    random_bytes = bytes(
        [random.randint(0, 254) for _ in range(random_bytes_num)]
    )

    # Encode data with random_bytes
    data = bytes(
        [(data[i] ^ random_bytes[i % random_bytes_num]) for i in range(len(data))]
    )

    # Shift random_bytes
    shifted_bytes = bytes(
        [((random_bytes[i] >> 5) | ((random_bytes[i] << 3) % 255)) for i in range(len(random_bytes))]
    )

    # Add amount of useless bytes & random bytes
    out_bytes = [random_bytes_num | (useless_bytes_num << 4)]
    # Add useless bytes
    if useless_bytes_num > 0:
        for _ in range(useless_bytes_num):
            out_bytes.append(0)
        out_bytes[1] = 8
    # Add shifted random bytes
    for b in shifted_bytes:
        out_bytes.append(b)
    # Add encoded data
    for b in data:
        out_bytes.append(b)

    out = ''
    for b in out_bytes:
        out += f'{b:02x}'

    return out.upper()

def decode_data(key: str) -> str:
    data: bytearray = bytearray.fromhex(key)

    useless_bytes_num = data[0] >> 4
    assert 0 <= useless_bytes_num <= 14
    random_bytes_num = data[0] & 0xf
    assert 3 <= random_bytes_num <= 14
    data = data[1:]

    # Check & remove useless bytes
    if useless_bytes_num > 0:
        assert data[0] == 8
        for i in range(1, useless_bytes_num):
            assert data[i] == 0
    data = data[useless_bytes_num:]

    # Unshift & remove random bytes
    random_bytes = []
    for i in range(random_bytes_num):
        random_bytes.append(
            (255 * (data[i] & 0x7) + data[i]) >> 3
        )

        assert 0 <= random_bytes[i] <= 254
    data = data[random_bytes_num:]

    # Decode data
    for i in range(len(data)):
        data[i] = data[i] ^ random_bytes[i % random_bytes_num]

    return data.decode('utf8')

def calculate_sha_key(data: str) -> str:
    hash = hashlib.sha256()
    hash.update(bytes(data, 'utf8'))
    return hash.hexdigest()

def generate_post_data(config: dict[str, str]) -> str:
    data = ''
    for key, value in config.items():
        data += f'&{key}={value}'

    data = encode_data(data)
    return f'key={data}&shaKey={calculate_sha_key(data)}'

def main():
    properties = load_properties_from_device()  # 从设备加载属性
    config = create_config(properties)
    post_data = generate_post_data(config)

    debug(f'Config: {config}')
    debug(f'POST Data: {post_data}')

    headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Connection': 'Keep-Alive',
        'Accept-Encoding': 'gzip',
        'User-Agent': 'okhttp/2.7.5'
    }
    r = request_post('https://fota5p.adups.com/otainter-5.0/fota5/detectSchedule.do',
                     post_data, headers=headers, expected_status_codes=[200])
    if r is None:
        return
    if len(r.text) == 0:
        error('No response received. shaKey may be wrong')
        return

    json_data = json.loads(r.text)
    status = json_data.get('status')
    if status is None:
        error('Unexpected response. Post data may be malformed')
        return
    
    if status == 1000:
        success('Update found!')
    elif status == 1010:
        info('No updates found. This could mean that there are no new updates or your RO_FOTA_VERSION is outdated/wrong')
    elif status == 1104:
        error('Error 1104. RO_FOTA_OEM, RO_FOTA_DEVICE, RO_PRODUCT_LOCALE or RO_OPERATOR_OPTR may be wrong')
    else:
        warn(f'Unexpected status code {status}')

    version = json_data.get('version')
    if version is not None:
        color_print('[bold][cyan][Update Info]')
        style = '   [cyan]'
        color_print(f'{style}Version:[0] {version["versionName"]}')
        color_print(f'{style}Size:[0] {int(version["filesize"]) * pow(10, -6)} MB')
        color_print(f'{style}Download URL:[0] {version["deltaurl"]}')
        color_print(f'{style}MD5 Sum:[0] {version["md5sum"]}')

if __name__ == '__main__':
    main()
