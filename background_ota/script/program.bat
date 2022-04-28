::generate settings page for current image: app.hex
nrfutil settings generate --family NRF52840 --application app.hex --application-version 1 --bootloader-version 1 --bl-settings-version 2 settings.hex
::merge bootloader and settings
mergehex --merge bootloader_debug.hex settings.hex --output bl_temp.hex
::merge bootloader, app and softdevice
mergehex --merge bl_temp.hex app.hex s140_nrf52_7.2.0_softdevice.hex --output whole.hex

nrfjprog --eraseall -f NRF52
nrfjprog --program whole.hex --verify -f NRF52
nrfjprog --reset 
pause

