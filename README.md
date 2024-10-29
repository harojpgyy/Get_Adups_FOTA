
![ic_launcher](https://github.com/user-attachments/assets/e937b072-da42-485f-924c-6010de98903c)
`HescOta:com.abupdate.fota_demo_iot`

Depends on the following properties
 
  * 
    ````
    ro_fota_oem（OEM code）
    ro_fota_device（Device Model）
    ro_product_locale（language)
    ro_fota_version（system version)
    ````
 You can use this adb command to get
       
       
    adb shell getprop
### Get Started
The script requires Python environment and tbm13-utils package, you can install it using pip

 ```
pip install tbm13-utils
 ```
Running scripts using Python3
```
python3 ota.py
 ```
 ![Script output when update is found](Examples.jpg)


 * According to the  `ro_fota_version ` attribute, the server provides ota.zip to upgrade from the current device version to the latest version（It may be an incremental package or a complete package）
   
* If your   `ro_fota_version `  is too old or does not exist, the server will most likely not return updates because the manufacturer has stopped supporting the device.
* To patch images, extract the OTA zip and use [imgpatchtools tools](https://github.com/erfanoabdi/imgpatchtools).
