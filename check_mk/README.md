Raspberry Pi (check_mk) checks
=====================

###INSTALL
check_mk (default):
- copy rpi_check.sh to /usr/lib/check_mk_agent/local/
- copy mrpe.cfg to /etc/check_mk/ (or edit your existing mrpe.cfg)
- reinvtory your Host(s): cmk -I HOST 
- check_mk reload or restart: cmk -O or cmk -R

###REQUIREMENTS
* vcgencmd - (default provided by most of raspberrypi related distributions (e.g. raspbian, raspbmc, openelec...)

###INSTALL
#chmod +x rpi_check.sh
#check_mk:
- copy rpi_check.sh to /usr/lib/check_mk_agent/local/
- copy mrpe.cfg to /etc/check_mk/ (or edit your existing mrpe.cfg)  
- reinvtory your Host(s): cmk -I HOST
- reload or restart check_mk: cmk -O #reload, cmk -R #restart

#check_mk samples:
![ScreenShot](/screenshots/cmk_rpi_overview.png)
![ScreenShot](/screenshots/cmk_rpi_tmp.png)

#console output:
OK - arm clock speed: 850 MHz|arm_clock=850;850;1000;;
WARN - core clock speed: 375 MHz|core_clock=375;300;400;;
OK - h264 clock speed: 225 MHz|h264_clock=225;300;400;;
OK - isp clock speed: 225 MHz|isp_clock=225;300;400;;
OK - v3d clock speed: 0 MHz|v3d_clock=0;300;400;;
OK - uart clock speed: 3 MHz|uart_clock=3
OK - pwm clock speed: 0 MHz|pwm_clock=0
OK - emmc clock speed: 250 MHz|emmc_clock=250
OK - pixel clock speed: 148 MHz|pixel_clock=148
OK - vec clock speed: 0 MHz|vec_clock=0
OK - dpi clock speed: 0 MHz|dpi_clock=0
OK - hdmi clock speed: 163 MHz|hdmi_clock=163
OK - soc temp: 50.8'C|soc_temp=50.8;65;75;;
OK - sdram_c voltage: 1.20V|sdram_c_voltage=1.20;1.3;1.4;;
OK - sdram_p voltage: 1.23V|sdram_p_voltage=1.23;1.3;1.4;;
OK - sdram_i voltage: 1.20V|sdram_i_voltage=1.20;1.3;1.4;;
OK - arm memory: 384M|arm_mem=384
OK - gpu memory: 128M|gpu_mem=128

