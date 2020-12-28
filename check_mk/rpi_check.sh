#!/bin/bash

vcgencmd=`whereis vcgencmd | awk '{print $2}'`

if [ ! -x "$vcgencmd" ];then

        echo "vcgencmd not found!"
                exit 2
fi

check="${1}"
case ${check} in

	arm_clock)
	arm_clock_hz=`$vcgencmd measure_clock arm | cut -d "=" -f2`
	let "arm_clock_mhz = $arm_clock_hz / 1000000"

	if [ $arm_clock_mhz -gt 1000 ]; then
		echo "CRIT - arm clock speed: $arm_clock_mhz MHz|arm_clock=$arm_clock_mhz;850;1000;;"
			exit 2
	elif [ $arm_clock_mhz -gt 850 ]; then
		echo "WARN - arm clock speed: $arm_clock_mhz MHz|arm_clock=$arm_clock_mhz;850;1000;;"
			exit 1
	else
		echo "OK - arm clock speed: $arm_clock_mhz MHz|arm_clock=$arm_clock_mhz;850;1000;;"
			exit 0
	fi
	;;

	core_clock)
        core_clock_hz=`$vcgencmd measure_clock core | cut -d "=" -f2`
        let "core_clock_mhz = $core_clock_hz / 1000000"

        if [ $core_clock_mhz -gt 400 ]; then
                echo "CRIT - core clock speed: $core_clock_mhz MHz|core_clock=$core_clock_mhz;300;400;;"
                        exit 2
        elif [ $core_clock_mhz -gt 300 ]; then
                echo "WARN - core clock speed: $core_clock_mhz MHz|core_clock=$core_clock_mhz;300;400;;"
                        exit 1
        else
                echo "OK - core clock speed: $core_clock_mhz MHz|core_clock=$core_clock_mhz;300;400;;"
                        exit 0
        fi
        ;;

	h264_clock)
        h264_clock_hz=`$vcgencmd measure_clock h264 | cut -d "=" -f2`
        let "h264_clock_mhz = $h264_clock_hz / 1000000"

        if [ $h264_clock_mhz -gt 400 ]; then
                echo "CRIT - h264 clock speed: $h264_clock_mhz MHz|h264_clock=$h264_clock_mhz;300;400;;"
                        exit 2
        elif [ $h264_clock_mhz -gt 300 ]; then
                echo "WARN - clock speed: $h264_clock_mhz MHz|h264_clock=$h264_clock_mhz;300;400;;"
                        exit 1
        else
                echo "OK - h264 clock speed: $h264_clock_mhz MHz|h264_clock=$h264_clock_mhz;300;400;;"
                        exit 0
        fi
        ;;

        isp_clock)
        isp_clock_hz=`$vcgencmd measure_clock isp | cut -d "=" -f2`
        let "isp_clock_mhz = $isp_clock_hz / 1000000"

        if [ $isp_clock_mhz -gt 400 ]; then
                echo "CRIT - isp clock speed: $isp_clock_mhz MHz|isp_clock=$isp_clock_mhz;300;400;;"
                        exit 2
        elif [ $isp_clock_mhz -gt 300 ]; then
                echo "WARN - isp clock speed: $isp_clock_mhz MHz|isp_clock=$isp_clock_mhz;300;400;;"
                        exit 1
        else
                echo "OK - isp clock speed: $isp_clock_mhz MHz|isp_clock=$isp_clock_mhz;300;400;;"
                        exit 0
        fi
        ;;

        v3d_clock)
        v3d_clock_hz=`$vcgencmd measure_clock v3d | cut -d "=" -f2`
        let "v3d_clock_mhz = $v3d_clock_hz / 1000000"
        #todo errorhandling if Hz is floating point ..

        if [ $v3d_clock_mhz -gt 400 ]; then
                echo "CRIT - v3d clock speed: $v3d_clock_mhz MHz|v3d_clock=$v3d_clock_mhz;300;400;;"
                        exit 2
        elif [ $v3d_clock_mhz -gt 300 ]; then
                echo "WARN - v3d clock speed: $v3d_clock_mhz MHz|v3d_clock=$v3d_clock_mhz;300;400;;"
                        exit 1
        else
                echo "OK - v3d clock speed: $v3d_clock_mhz MHz|v3d_clock=$v3d_clock_mhz;300;400;;"
                        exit 0
        fi
        ;;

	uart_clock)
        uart_clock_hz=`$vcgencmd measure_clock uart | cut -d "=" -f2`
        let "uart_clock_mhz = $uart_clock_hz / 1000000"

        echo "OK - uart clock speed: $uart_clock_mhz MHz|uart_clock=$uart_clock_mhz"
	exit 0
        ;;

        pwm_clock)
        pwm_clock_hz=`$vcgencmd measure_clock pwm | cut -d "=" -f2`
        let "pwm_clock_mhz = $pwm_clock_hz / 1000000"

        echo "OK - pwm clock speed: $pwm_clock_mhz MHz|pwm_clock=$pwm_clock_mhz"
	exit 0
        ;;

        emmc_clock)
        emmc_clock_hz=`$vcgencmd measure_clock emmc | cut -d "=" -f2`
        let "emmc_clock_mhz = $emmc_clock_hz / 1000000"

        echo "OK - emmc clock speed: $emmc_clock_mhz MHz|emmc_clock=$emmc_clock_mhz"
	exit 0
        ;;

	pixel_clock)
        pixel_clock_hz=`$vcgencmd measure_clock pixel | cut -d "=" -f2`
        let "pixel_clock_mhz = $pixel_clock_hz / 1000000"
        #todo errorhandling if Hz is floating point ..

        echo "OK - pixel clock speed: $pixel_clock_mhz MHz|pixel_clock=$pixel_clock_mhz"
	exit 0
        ;;

	vec_clock)
        vec_clock_hz=`$vcgencmd measure_clock vec | cut -d "=" -f2`
        let "vec_clock_mhz = $vec_clock_hz / 1000000"

        echo "OK - vec clock speed: $vec_clock_mhz MHz|vec_clock=$vec_clock_mhz"
	exit 0
        ;;

        dpi_clock)
        dpi_clock_hz=`$vcgencmd measure_clock dpi | cut -d "=" -f2`
        let "dpi_clock_mhz = $dpi_clock_hz / 1000000"

        echo "OK - dpi clock speed: $dpi_clock_mhz MHz|dpi_clock=$dpi_clock_mhz"
	exit 0
        ;;

        hdmi_clock)
        hdmi_clock_hz=`$vcgencmd measure_clock hdmi | cut -d "=" -f2`
        let "hdmi_clock_mhz = $hdmi_clock_hz / 1000000"

        echo "OK - hdmi clock speed: $hdmi_clock_mhz MHz|hdmi_clock=$hdmi_clock_mhz"
	exit 0
        ;;

        soc_temp)
        soc_temp=`$vcgencmd measure_temp | egrep -o [0-9\.]+`
        if [[ $soc_temp > 75 ]]; then
                echo "CRIT - soc temp: $soc_temp'C|soc_temp=$soc_temp;65;75;;"
                        exit 2
        elif [[ $soc_temp > 65 ]]; then
                echo "WARN soc temp: $soc_temp'C|soc_temp=$soc_temp;65;75;;"
                        exit 1
        else
                echo "OK - soc temp: $soc_temp'C|soc_temp=$soc_temp;65;75;;"
                        exit 0
        fi
        ;;

	core_voltage)
        core_voltage=`$vcgencmd measure_volts core | egrep -o [0-9\.]+`
        if [[ $core_voltage > 1.4000 ]]; then
                echo "CRIT - core voltage: ${core_voltage}V|core_voltage=$core_voltage;1.3000;1.4000;;"
                        exit 2
        elif [[ $core_voltage > 1.3000 ]]; then
                echo "WARN - core voltage: ${core_voltage}V|core_voltage=$core_voltage;1.3000;1.4000;;"
                        exit 1
        else
                echo "OK - core voltage: ${core_voltage}V|core_voltage=$core_voltage;1.3000;1.4000;;"
                        exit 0
        fi
        ;;

        sdram_c_voltage)
        sdram_c_voltage=`$vcgencmd measure_volts sdram_c | egrep -o [0-9\.]+`
        if [[ $sdram_c_voltage > 1.4 ]]; then
                echo "CRIT - sdram_c voltage: ${sdram_c_voltage}V|sdram_c_voltage=$sdram_c_voltage;1.3;1.4;;"
                        exit 2
        elif [[ $sdram_c_voltage > 1.3 ]]; then
                echo "WARN - sdram_c voltage: ${sdram_c_voltage}V|sdram_c_voltage=$sdram_c_voltage;1.3;1.4;;"
                        exit 1
        else
                echo "OK - sdram_c voltage: ${sdram_c_voltage}V|sdram_c_voltage=$sdram_c_voltage;1.3;1.4;;"
                        exit 0
        fi
        ;;

        sdram_i_voltage)
        sdram_i_voltage=`$vcgencmd measure_volts sdram_i | egrep -o [0-9\.]+`
        if [[ $sdram_i_voltage > 1.4 ]]; then
                echo "CRIT - sdram_i voltage: ${sdram_i_voltage}V|sdram_i_voltage=$sdram_i_voltage;1.3;1.4;;"
                        exit 2
        elif [[ $sdram_i_voltage > 1.3 ]]; then
                echo "WARN - sdram_i voltage: ${sdram_i_voltage}V|sdram_i_voltage=$sdram_i_voltage;1.3;1.4;;"
                        exit 1
        else
                echo "OK - sdram_i voltage: ${sdram_i_voltage}V|sdram_i_voltage=$sdram_i_voltage;1.3;1.4;;"
                        exit 0
        fi
        ;;

        sdram_p_voltage)
        sdram_p_voltage=`$vcgencmd measure_volts sdram_p | egrep -o [0-9\.]+`
        if [[ $sdram_p_voltage > 1.4 ]]; then
                echo "CRIT - sdram_p voltage: ${sdram_p_voltage}V|sdram_p_voltage=$sdram_p_voltage;1.3;1.4;;"
                        exit 2
        elif [[ $sdram_p_voltage > 1.3 ]]; then
                echo "WARN - sdram_p voltage: ${sdram_p_voltage}V|sdram_p_voltage=$sdram_p_voltage;1.3;1.4;;"
                        exit 1
        else
                echo "OK - sdram_p voltage: ${sdram_p_voltage}V|sdram_p_voltage=$sdram_p_voltage;1.3;1.4;;"
                        exit 0
        fi
        ;;

        arm_mem)
        arm_mem=`$vcgencmd get_mem arm | egrep -o [0-9]+`
        echo "OK - arm memory: ${arm_mem}M|arm_mem=$arm_mem"
        exit 0
        ;;

        gpu_mem)
        gpu_mem=`$vcgencmd get_mem gpu | egrep -o [0-9]+`
        echo "OK - gpu memory: ${gpu_mem}M|gpu_mem=$gpu_mem"
        exit 0
        ;;
esac
