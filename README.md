# win32-fpga-downloader
OpenOCD Based fpga flasher!

**Support only for ft232h help with other ftdi's is welcome :) **

Instalation:

1.Download openOCD for windows: 
https://gnutoolchains.com/arm-eabi/openocd/

2.Extract to somewhere and add the bin folder to Path env vars, tutorial:
https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/

3.Donwload this repository and extract it to somewhere.

4.download Zadig -> https://zadig.akeo.ie

5.Start up the Zadig utility

6.Select Options/List All Devices, then select the FTDI devices you want to communicate with. Its names depends on your hardware, i.e. the name stored in the FTDI EEPROM.

7.With FTDI devices with multiple channels, such as FT2232 (2 channels) and FT4232 (4 channels), you must install the driver for the composite parent, not for the individual interfaces. If you install the driver for each interface, each interface will be presented as a unique FTDI device and you may have difficulties to select a specific FTDI device port once the installation is completed. To make the composite parents to appear in the device list, uncheck the Options/Ignore Hubs or Composite Parents menu item.

Be sure to select the parent device, i.e. the device name should not end with (Interface N), where N is the channel number.

for example Dual RS232-HS represents the composite parent, while Dual RS232-HS (Interface 0) represents a single channel of the FTDI device. Always select the former.

8.Select  WinUSB in the driver list.
![image](https://user-images.githubusercontent.com/58897843/118001655-51a31d80-b31d-11eb-9e0d-e7f416434f16.png)


9.Click on Replace Driver

10. See Basic Usage / Using other FFPGA Boards

Basic Usage:
1. Open cmd and cd where the w32uploader.bat and the .cfg file are located.
2. Copy the svf file path and name example: "X:\Quartus\output_files\myfile.svf".
3. run the command: w32downloader.bat <path to svf> (example: w32downloader.bat X:\Quartus\output_files\myfile.svf).
4. wait and openocd should open :)
![image](https://user-images.githubusercontent.com/58897843/118001863-7eefcb80-b31d-11eb-8778-45cd20cd9dba.png)


Using other FFPGA Boards:
1. copy the .cfg and rename it to your board's name ex: CycloneIV.cfg
2. delete the original .cfg and start edditing the new one.
3. in the field CHIPNAME change it to your board's name
4. in the field FPGA_TAPID change it to your board's jtag ID (seach online)
![image](https://user-images.githubusercontent.com/58897843/118002164-beb6b300-b31d-11eb-8e9b-15793038b0e4.png)

