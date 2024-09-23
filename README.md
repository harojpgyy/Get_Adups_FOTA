[adups](http://www.adups.com/)
### ![cropped-Adups-768x174-1](https://github.com/user-attachments/assets/c8f42da3-425f-433e-bc0f-e2f86ab7f2dc)(http://www.adups.com/)
![icon](https://github.com/user-attachments/assets/75f25f91-2b3c-4a5b-9295-8f25a922b612)


  * 
    ```python
    RO_FOTA_OEM = 'incartech3326_10.0'
    RO_FOTA_DEVICE = 'TBT8A10'
    RO_PRODUCT_LOCALE = 'es-ES'
    RO_OPERATOR_OPTR = ''
    RO_FOTA_VERSION = 'TG08RK1_20231020_20231020-1806'
    ```
    * When an update is detected, the server seems to always give the latest OTA zip. The only difference is that depending on the `RO_FOTA_VERSION` you use, it'll give the corresponding zip needed to update from that version to the latest one.
    ![Script output when update is found](Examples.jpg)
    * If the `RO_FOTA_VERSION` you use is too old, the server may return that no updates are available. This is most likely because the OEM stopped building OTA packages for that version.

* To patch images, extract the OTA zip and use [imgpatchtools tools](https://github.com/erfanoabdi/imgpatchtools).
