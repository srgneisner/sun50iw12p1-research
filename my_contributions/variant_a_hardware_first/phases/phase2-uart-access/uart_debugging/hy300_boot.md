[17:30:42.579] tio v2.7
[17:30:42.579] Press ctrl-t q to quit
[17:30:42.579] Connected
[121]HELLO! BOOT0 is starting!
[124]BOOT0 commit : de956292
[127]set pll start
[130]set pll end
[132]ldob fix
[133]ldob cal: 0x2e0f
[135]prcm cpus timer clock enable
[139]board init ok
[141][mmc]: mmc driver ver 2021-07-13 11:09
[152][mmc]: Wrong media type 0x0
[155][mmc]: ***Try SD card 2***
[159][mmc]: mmc 2 cmd 8 timeout, err 100
[163][mmc]: mmc 2 cmd 8 err 100
[167][mmc]: mmc 2 send if cond failed
[171][mmc]: mmc 2 cmd 55 timeout, err 100
[176][mmc]: mmc 2 cmd 55 err 100
[179][mmc]: mmc 2 send app cmd failed
[183][mmc]: ***Try MMC card 2***
[260][mmc]: RMCA OK!
[263][mmc]: bias 4
[270][mmc]: MMC 5.1
[272][mmc]: HSSDR52/SDR25 8 bit
[276][mmc]: 50000000 Hz
[278][mmc]: 7456 MB
[281][mmc]: ***SD/MMC 2 init OK!!!***
[296]DRAM only have internal ZQ!!
[304]DRAM BOOT DRIVE INFO: V1.18
[308]DRAM CLK = 624 MHz
[310]DRAM Type = 3 (2:DDR2,3:DDR3)
[314]DRAMC ZQ value: 0x7b7bfb
[317]DRAM ODT value: 0x40
[321]DRAM index value: 0x1 0x1
[324]DRAM SIZE = 1024 M
[354]DRAM simple test OK.
[357]dram size =1024
[365]nsi init ok 2020-7-12
[368]card no is 2
[370]sdcard 2 line count 8
[372][mmc]: mmc driver ver 2021-07-13 11:09
[383][mmc]: ***Try MMC card 2***
[490][mmc]: RMCA OK!
[493][mmc]: bias 4
[499][mmc]: MMC 5.1
[501][mmc]: HSSDR52/SDR25 8 bit
[504][mmc]: 50000000 Hz
[507][mmc]: 7456 MB
[509][mmc]: ***SD/MMC 2 init OK!!!***
[655]Loading boot-pkg Succeed(index=0).
[659]Entry_name        = u-boot
[674]Entry_name        = monitor
[679]Entry_name        = scp
[685]Entry_name        = optee
[694]Entry_name        = dtb
[698]tunning data addr:0x4a0003e8
[702]Jump to second Boot.
NOTICE:  BL3-1: v1.0(debug):f6fd0d6
NOTICE:  BL3-1: Built : 10:11:47, 2024-05-22
NOTICE:  BL3-1 commit: 8
NOTICE:  secure os exist
E/TC:0 0 init_external_dt:1033 Device Tree missing
M/TC: OP-TEE version: a8294843 (gcc version 5.3.1 20160412 (Linaro GCC 5.3-2016.05)) #1 Sat Mar  9 10:48:25 UTC 2024 arm
NOTICE:  BL3-1: Preparing for EL3 exit to normal world
NOTICE:  BL3-1: Next image address = 0x4a000000
NOTICE:  BL3-1: Next image spsr = 0x1d3

U-Boot 2018.05-00027-ge159793 (Aug 15 2025 - 10:07:31 +0000) Allwinner Technology

[00.801]CPU:   Allwinner Family
[00.804]Model: sun50iw12
[00.806]DRAM:  1 GiB
[00.811]Relocation Offset is: 35f0e000
[00.838]secure enable bit: 0
E/TC:0   fdt_getprop_u32:336 prop trace_level not found
[00.855]CPU=1392 MHz,PLL6=600 Mhz,AHB=150 Mhz, APB1=100Mhz  MBus=400Mhz
[00.861]gic: sec monitor mode
[00.875]flash init start
[00.877]workmode = 0,storage type = 2
[00.880][mmc]: mmc driver ver uboot2018:2023-05-16 11:34:00 avoid-repeat-reset-host
[00.889][mmc]: get sdc2 sdc_dis_host_caps 0x180.
[00.893][mmc]: SUNXI SDMMC Controller Version:0x50400
[01.001][mmc]: Best spd md: 2-HSDDR52/DDR50, freq: 2-50000000, Bus width: 8
[01.008]sunxi flash init ok
zztest---usb power enable
unable to find pwm led node in device tree.
[01.017]Loading Environment from SUNXI_FLASH... OK
[01.033]usb burn from boot
delay time 0
weak:otg_phy_config
[01.043]usb prepare ok
[01.846]overtime
[01.849]do_burn_from_boot usb : no usb exist
resetting USB...
[01.855]USB0:   start sunxi  USB-DRD...
config usb clk ok
sunxi USB-DRD init ok...
USB EHCI 1.00
scanning bus 0 for devices... 1 USB Device(s) found
[02.305]USB1:   start sunxi  USB1-Host...
config usb clk ok
sunxi USB1-Host init ok...
USB EHCI 1.00
scanning bus 1 for devices... 1 USB Device(s) found
[02.756]scanning usb for storage devices... 0 Storage Device(s) found
** Bad device usb 0 **
** Bad device usb 0 **
zztest---get_prj_config_from_oem
[02.787]get file(prj_config.ini) size from media_data error
10 bytes read in 1 ms (9.8 KiB/s)
zztest---prj_mode=0
zztst--mode = 0
[SCP] :wait arisc ready....
[SCP] :arisc version: [jorpotcevt-r-303rdna1dio1v-13-3.72g-16b0]
[SCP] :arisc startup ready
[SCP] :arisc startup notify message feedback
[SCP] :sunxi-arisc driver v1.10 is starting
[116]HELLO! BOOT0 is starting!
[119]BOOT0 commit : de956292
[122]set pll start
[125]set pll end
[127]ldob fix
[129]ldob cal: 0x2e0f
[131]prcm cpus timer clock enable
[135]board init ok
[137]rtc[2] value = 0xf
[139]rtc[3] value = 0xf4f48003
[143][mmc]: mmc driver ver 2021-07-13 11:09
[153][mmc]: Wrong media type 0x0
[157][mmc]: ***Try SD card 2***
[161][mmc]: mmc 2 cmd 8 timeout, err 100
[165][mmc]: mmc 2 cmd 8 err 100
[168][mmc]: mmc 2 send if cond failed
[173][mmc]: mmc 2 cmd 55 timeout, err 100
[177][mmc]: mmc 2 cmd 55 err 100
[181][mmc]: mmc 2 send app cmd failed
[185][mmc]: ***Try MMC card 2***
[261][mmc]: RMCA OK!
[263][mmc]: bias 4
[270][mmc]: MMC 5.1
[273][mmc]: HSSDR52/SDR25 8 bit
[276][mmc]: 50000000 Hz
[279][mmc]: 7456 MB
[281][mmc]: ***SD/MMC 2 init OK!!!***
[296]DRAM only have internal ZQ!!
[305]DRAM BOOT DRIVE INFO: V1.18
[308]DRAM CLK = 624 MHz
[311]DRAM Type = 3 (2:DDR2,3:DDR3)
[314]DRAMC ZQ value: 0x7b7bfb
[317]DRAM ODT value: 0x40
[321]DRAM index value: 0x1 0x1
[325]DRAM SIZE = 1024 M
[355]DRAM simple test OK.
[357]dram size =1024
[365]nsi init ok 2020-7-12
[368]card no is 2
[370]sdcard 2 line count 8
[373][mmc]: mmc driver ver 2021-07-13 11:09
[383][mmc]: ***Try MMC card 2***
[491][mmc]: RMCA OK!
[493][mmc]: bias 4
[499][mmc]: MMC 5.1
[501][mmc]: HSSDR52/SDR25 8 bit
[504][mmc]: 50000000 Hz
[507][mmc]: 7456 MB
[509][mmc]: ***SD/MMC 2 init OK!!!***
[655]Loading boot-pkg Succeed(index=0).
[660]Entry_name        = u-boot
[675]Entry_name        = monitor
[679]Entry_name        = scp
[686]Entry_name        = optee
[694]Entry_name        = dtb
[698]tunning data addr:0x4a0003e8
[702]Jump to second Boot.
NOTICE:  BL3-1: v1.0(debug):f6fd0d6
NOTICE:  BL3-1: Built : 10:11:47, 2024-05-22
NOTICE:  BL3-1 commit: 8
NOTICE:  secure os exist
E/TC:0 0 init_external_dt:1033 Device Tree missing
M/TC: OP-TEE version: a8294843 (gcc version 5.3.1 20160412 (Linaro GCC 5.3-2016.05)) #1 Sat Mar  9 10:48:25 UTC 2024 arm
NOTICE:  BL3-1: Preparing for EL3 exit to normal world
NOTICE:  BL3-1: Next image address = 0x4a000000
NOTICE:  BL3-1: Next image spsr = 0x1d3ÿ

U-Boot 2018.05-00027-ge159793 (Aug 15 2025 - 10:07:31 +0000) Allwinner Technology

[00.801]CPU:   Allwinner Family
[00.804]Model: sun50iw12
[00.806]DRAM:  1 GiB
[00.810]Relocation Offset is: 35f0e000
[00.837]secure enable bit: 0
E/TC:0   fdt_getprop_u32:336 prop trace_level not found
[00.854]CPU=1392 MHz,PLL6=600 Mhz,AHB=150 Mhz, APB1=100Mhz  MBus=400Mhz
[00.861]gic: sec monitor mode
[00.874]flash init start
[00.876]workmode = 0,storage type = 2
[00.880][mmc]: mmc driver ver uboot2018:2023-05-16 11:34:00 avoid-repeat-reset-host
[00.888][mmc]: get sdc2 sdc_dis_host_caps 0x180.
[00.893][mmc]: SUNXI SDMMC Controller Version:0x50400
[01.001][mmc]: Best spd md: 2-HSDDR52/DDR50, freq: 2-50000000, Bus width: 8
[01.007]sunxi flash init ok
zztest---usb power enable
unable to find pwm led node in device tree.
[01.017]Loading Environment from SUNXI_FLASH... OK
[01.032]usb burn from boot
delay time 0
weak:otg_phy_config
[01.042]usb prepare ok
[01.845]overtime
[01.848]do_burn_from_boot usb : no usb exist
zztest---get_prj_config_from_oem
[01.870]get file(prj_config.ini) size from media_data error
10 bytes read in 0 ms
zztest---prj_mode=0
zztst--mode = 0
Failed to get bl id property
Failed to get pwm_id property
zztest---fan power enable
zztest---fan power enable
secure storage read widevine fail
[01.925]secure storage read widevine fail with:-1
secure storage read ec_key fail
[01.932]secure storage read ec_key fail with:-1
15652 bytes read in 3 ms (5 MiB/s)
2764854 bytes read in 33 ms (79.9 MiB/s)
zztest--try to get panel_config.ini from /oem
[01.987]get file(panel_config.ini) size from media_data error
zztest--/oem/panel_config.ini is no exsists ,get panel_config.ini from Reserve0
2525 bytes read in 1 ms (2.4 MiB/s)
[02.004]LogRegData.bin version is 25-4-10-157
[02.009]Project id:0x34 version:25-1-6-3
[02.014]pwm_request: err: get reg-base err.
[02.017]pwm5 request for fastlogo fail!
1255696 bytes read in 17 ms (70.4 MiB/s)
display_bin addr: 0x7857b000 copy 0x4b100000, size: 0x132910
4743 bytes read in 2 ms (2.3 MiB/s)
display_cfg addr: 0x77f36000 copy 0x4be01000, size: 0x1287
[02.872]CWL  tse_id mips/ProjectID_0x0034.TSE
[02.877]get file(mips/database.TSE) size from media_data error
282464 bytes read in 6 ms (44.9 MiB/s)
mips/database.TSE addr: 0x786ae000 copy 0x4be41000, size: 0x44f60
[02.901]get file(mips/pq_custom.TSE) size from media_data error
15016 bytes read in 2 ms (7.2 MiB/s)
mips/pq_custom.TSE addr: 0x77f38000 copy 0x4be85f60, size: 0x3aa8
[02.921]get file(mips/projecttable.TSE) size from media_data error
1384 bytes read in 2 ms (675.8 KiB/s)
mips/projecttable.TSE addr: 0x77f3c000 copy 0x4be89a08, size: 0x568
[02.941]get file(mips/ProjectID_0x0034.TSE) size from media_data error
17304 bytes read in 3 ms (5.5 MiB/s)
mips/ProjectID_0x0034.TSE addr: 0x77f3d000 copy 0x4be89f70, size: 0x4398
[03.488]Display fastlogo finish!
List file under ULI/factory
** Unrecognized filesystem type **
[03.689]update part info
[03.901]update bootcmd
[03.906]change working_fdt 0x77ebde70 to 0x77e8de70
[03.911][mmc]: delete mmc-hs400-1_8v from dtb
[03.915][mmc]: delete mmc-hs200-1_8v from dtb
[03.923]## error: update_fdt_dram_para : FDT_ERR_NOTFOUND
[03.928]update dts
Hit any key to stop autoboot:  1  0 
zztest---add env prj_mode
zztest---get prj_mode=prj_mode=0
Android's image name: arm
[05.503]Starting kernel ...

[05.506][mmc]: mmc exit start
[05.609][mmc]: mmc 2 exit ok
[SCP] :wait arisc ready....
[SCP] :arisc version: [jorpotcevt-r-303rdna1dio1v-13-3.72g-16b0]
[SCP] :arisc startup ready
[SCP] :arisc startup notify message feedback
[SCP] :sunxi-arisc driver v1.10 is starting
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.4.99-00049-g34f0974adef4-dirty (hotack@dell-PowerEdge-R740) (arm-linux-gnueabi-gcc (Linaro GCC 5.3-2016.05) 5.3.1 20160412, GNU ld (Linaro_Binutils-2016.05) 2.25.0 Linaro 2016_02) #1006 SMP PREEMPT Mon Sep 22 09:29:12 CST 2025
[    0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7), cr=10c0383d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] OF: fdt: Machine model: sun50iw12
[    0.000000] printk: bootconsole [earlycon0] enabled
[    0.000000] OF: reserved mem: OVERLAP DETECTED!
[    0.000000] mipsloader (0x4b100000--0x4d941000) overlaps with framebuf (0x4bf41000--0x4d941000)
[    0.006478] BOOTEVENT:         6.471414: ON
[    0.086856] sunxi-msgbox-amp 3003000.msgbox: invalid resource
[    0.094860] sunxi_pwm_probe: can't get pwm  bus clk
[    0.451380] uart uart0: get regulator failed
[    0.456691] uart uart1: get regulator failed
[    0.478197] mipsloader 3061000.mipsloader: request pins failed: -19
[    0.486565] motor-control motor_ctr: failed to get property limiter-gpio
[    0.495131] Failed to read array length
[    0.505010] sunxi_key_init: get key count failed
[    0.505016] sunxi_gpadc_setup: get channel compare select failed
[    0.516895] sunxi_gpadc_setup: get channel compare low data select failed
[    0.524464] sunxi_gpadc_setup: get channel compare hig data select failed
[    0.532033] sunxi_gpadc_setup: get channel scan data failed
[    0.538247] sunxi_gpadc_setup:get channel0_compare_lowdata err!
[    0.544848] sunxi_gpadc_setup:get channel0_compare_higdata err!
[    0.551449] sunxi_gpadc_setup:get channel1_compare_lowdata err!
[    0.558050] sunxi_gpadc_setup:get channel1_compare_higdata err!
[    0.567826] sunxi_ir_startup: get ir protocol failed
[    0.627968] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 52, RTO !!
[    0.635608] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 52, RTO !!
[    0.646098] [AUDIOCODEC][sunxi_codec_parse_params][1905]:adcdrc_used:0, adchpf_used:0, dacdrc_used:0, dachpf_used:0
[    0.646098] 
[    0.659716] debugfs: Directory '2030000.codec' with parent 'regmap' already present!
[    0.660236] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 5, RTO !!
[    0.675835] debugfs: Directory '203032c.dummy_cpudai' with parent 'audiocodec' already present!
[    0.675885] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 5, RTO !!
[    0.693041] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 5, RTO !!
[    0.700584] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 5, RTO !!
[    0.708103] sunxi-mmc 4022000.sdmmc: avoid to switch power_off_notification to POWERED_ON(0x01)
[    0.717851] sunxi-mmc 4022000.sdmmc: avoid to switch power_off_notification to POWERED_ON(0x01)
[    0.727579] sunxi-mmc 4022000.sdmmc: avoid to switch power_off_notification to POWERED_ON(0x01)
[    0.737299] sunxi-mmc 4022000.sdmmc: avoid to switch power_off_notification to POWERED_ON(0x01)
[    0.769297] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0x69)
[    0.778865] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0x69)
[    0.788442] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0x69)
[    0.797995] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0x69)
[    0.807552] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0x69)
[    0.824383] [stkAccel] stk_report_accel_data/2333: No input device for accel data
[    0.835396] [stkAccel] kxt_parse_dt/1108: Unable to read kxtj3,irq-gpio
[    0.843077] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0xe)
[    0.852588] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0xe)
[    0.862096] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0xe)
[    0.871609] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0xe)
[    0.880843] [stkAccel] kxt_i2c_probe/1275: kxtj3 initialization failed
[    0.891023] incorrect key number.
[    0.962994] debugfs: Directory 'sunxi-ehci' with parent 'ehci' already present!
[    1.037394] debugfs: Directory 'sunxi-ohci' with parent 'ohci' already present!
[    1.115485] cpu cpu0: dev_pm_opp_set_rate: failed to find current OPP for freq 1392000000 (-34)
[    1.140084] sunxi-audio-card 203705c.soundowa1: use dummy codec for simple card.
[    1.148498] debugfs: Directory '2037000.owa' with parent 'sndowa1' already present!
[    1.158773] sunxi-audio-card 203207c.sounddaudio0: use dummy codec for simple card.
[    1.167456] debugfs: Directory '2032000.daudio' with parent 'snddaudio0' already present!
[    1.178063] sunxi-audio-card 203307c.sounddaudio0: use dummy codec for simple card.
[    1.186750] debugfs: Directory '2033000.daudio' with parent 'snddaudio1' already present!
[    1.202187] get_key_map_info()199 - Failed to find "oe" in dts.
[    1.208991] [ac200] get ave_regulator_name failed!
[    1.215115] [ac200] pwm enable
[    1.247298] Kernel init done
[    1.375573] init: [libfs_mgr]not access /system/bin/fsck_msdos
[    1.384325] logwrapper: executing /system/bin/fsck_msdos failed: No such file or directory
[    1.393653] logwrapper: 
[    1.399685] logwrapper: Cannot log to file /dev/fscklogs/log
[    1.406371] logwrapper: 
[    1.464217] logwrapper: executing /system/bin/newfs_msdos failed: No such file or directory
[    1.473574] logwrapper: 
[    1.482319] logwrapper: executing /system/bin/newfs_msdos failed: No such file or directory
[    1.491653] logwrapper: 
[    1.899230] init: Could not update logical partition
[    2.566068] init: Could not set 'ro.boot.dynamic_partitions' to 'true' while loading .prop filesRead-only property was already set
[    2.579223] init: Could not set 'ro.boot.dynamic_partitions_retrofit' to 'true' while loading .prop filesRead-only property was already set
[    2.745359] cgroup1: Unknown subsys name 'blkio'
[    2.750603] libprocessgroup: Failed to mount blkio cgroup: Invalid argument
[    2.760107] libprocessgroup: Failed to mount cpuset cgroup: No such device
[    2.769608] cgroup1: Unknown subsys name 'schedtune'
[    2.775224] libprocessgroup: Failed to mount schedtune cgroup: Invalid argument
[    3.124379] sunxi-rfkill soc@2900000:rfkill: get gpio chip_en failed
[    3.131592] sunxi-rfkill soc@2900000:rfkill: get gpio power_en failed
console:/ $ [    3.905772] debugfs: Directory '1800000.gpu-gpu' with parent 'vdd_sys' already present!
[    3.918473] mali 1800000.gpu: Sunxi_data->dvfs_status is false, continuing without devfreq
[    3.942253] invalid gpio:-2!
[    3.945696] invalid gpio:-2!
[    3.949579] invalid gpio:-2!
[    3.953133] platform 2000c15.pwm5: pinctrl_get failed!
[    4.000096] sunxi-pm-domain 7001000.power-management:power-controller: failed to set domain 'pd_tvcap', val=0
[    4.027856] LogRegData.bin version is 25-4-10-157
[    4.033790] Project id:0x34 version:25-1-6-3
[    4.038664] ge2d 5240000.ge2d: firmware downloaded!
[    4.265237] init: [libfs_mgr]fs_mgr_do_resize: Reszie /dev/block/by-name/userdata as '0'
[    4.371079] pMemInBuffer[0]=0xc3648800 pMemInBuffer[0]->bufStart=0x436c0000
[    4.378951] pMemInBuffer[1]=0xc3648840 pMemInBuffer[1]->bufStart=0x436e0000
[    4.386793] pMemInBuffer[2]=0xc3648880 pMemInBuffer[2]->bufStart=0x43700000
[    4.394607] pMemInBuffer[3]=0xc36488c0 pMemInBuffer[3]->bufStart=0x43720000
[    4.402425] [AudBrg_Init] --> audio bridge irq num: 38
[    4.408362] [ABP_DTV_Init] --> abp_dtv irq num: 39
[    4.413819] audiobridge alloc size: 0x160000
[    4.420575] audiobridge ion_alloc success!
[    4.425289] audiobridge ion alloc success, and phy_addr: 0x0
[    4.431613] audiobridge:247 audbrg_istream_ConfigMemMap() ISTREAM1 phy_addr=0x0 vir_addr=0xf0ec2000
[    4.441703] audiobridge:258 audbrg_istream_ConfigMemMap() ISTREAM2 phy_addr=0x10000 vir_addr=0xf0ed2000
[    4.452182] audiobridge:269 audbrg_istream_ConfigMemMap() ISTREAM3 phy_addr=0x20000 vir_addr=0xf0ee2000
[    4.462658] audiobridge:280 audbrg_istream_ConfigMemMap() ISTREAM4 phy_addr=0x30000 vir_addr=0xf0ef2000
[    4.473141] audiobridge:155 audbrg_ostream_ConfigMemMap() OSTREAM1 phy_addr=0x40000 vir_addr=0xf0f02000
[    4.483618] audiobridge:166 audbrg_ostream_ConfigMemMap() OSTREAM2 phy_addr=0x50000 vir_addr=0xf0f12000
[    4.494102] audiobridge:232 audbrg_delayline_ConfigMemMap() DELAYLINE1 phy_addr=0x60000 vir_addr=0xf0f22000
[    4.504968] audiobridge:246 audbrg_delayline_ConfigMemMap() DELAYLINE2 phy_addr=0xa0000 vir_addr=0xf0f62000
[    4.515839] audiobridge:260 audbrg_delayline_ConfigMemMap() DELAYLINE3 phy_addr=0xe0000 vir_addr=0xf0fa2000
[    4.526704] audiobridge:274 audbrg_delayline_ConfigMemMap() DELAYLINE4 phy_addr=0x120000 vir_addr=0xf0fe2000
[    5.687354] pinctrl_get for allwinner,sunxi-pwm fail
[    6.817558] init: Could not start service 'bleaudiod' as part of class 'core': Cannot find '/system/bin/bleaudiod': No such file or directory
[    7.746290] regulator-dummy: Underflow of regulator enable count
[    7.753142] regulator-dummy: Underflow of regulator enable count
[   10.232170] init: Could not start service 'iosmain' as part of class 'main': Cannot find '/system/bin/iosmain': No such file or directory
[   10.569194] init: Could not start service 'vendor_flash_recovery' as part of class 'main': Cannot find '/vendor/bin/install-recovery.sh': No such file or directory
[   10.813617] regulator-dummy: Underflow of regulator enable count
[   11.299830] init: Control message: Could not find 'android.hardware.camera.provider@2.4::ICameraProvider/legacy/0' for ctl.interface_start from pid: 2192 (/system/bin/hwservicemanager)
[   18.891884] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 52, RTO !!
[   18.899597] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 52, RTO !!
[   19.934994] aicbsp: err:<aicwf_sdio_bus_pwrctl,1260>: bus down
[   39.769311] audit: rate limit exceeded

console:/ $ [  167.217683] sunxi_pwm_enable_dual: can't parse pwm device
[  170.670642] init: Unable to set property 'ctl.interface_start' from uid:1000 gid:1000 pid:2192: Received control message after shutdown, ignoring
[  170.705473] init: Unable to set property 'ctl.interface_start' from uid:1000 gid:1000 pid:2192: Received control message after shutdown, ignoring
[  170.721643] init: Unable to set property 'ctl.interface_start' from uid:1000 gid:1000 pid:2192: Received control message after shutdown, ignoring
[  171.247944] libprocessgroup: Failed to kill process cgroup uid 0 pid 2610 in 235ms, 1 processes remain
[  171.594471] regulator-dummy: Underflow of regulator enable count
[  176.406771] sysrq: Kill All Tasks
[  176.416468] init: Unmounting /dev/block/by-name/userdata:/data opts rw,lazytime,seclabel,nosuid,nodev,noatime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,reserve_root=45199,resuid=0,resgid=1065,alloc_mode=reuse,fsync_mode=posix
[  176.795714] init: Umounted /dev/block/by-name/userdata:/data opts rw,lazytime,seclabel,nosuid,nodev,noatime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,reserve_root=45199,resuid=0,resgid=1065,alloc_mode=reuse,fsync_mode=posix
[  176.827780] init: sync() after umount...
[  176.832526] init: sync() after umount took4ms
[  176.938018] init: powerctl_shutdown_time_ms:6615:2
[  176.943539] init: Reboot ending, jumping to kernel
[  176.943608] init: remaining_shutdown_time: 300
[  176.968994] reboot_callback(): empty arg
[  176.987237] ge2d 5240000.ge2d: acquire tvdisp clock on emergency shutdown
[  177.539292] Invalid pin
[  177.542045] Invalid pin
[  177.544804] Invalid pin
[  177.547584] ge2d 5240000.ge2d: ge2d suspend
[  177.552456] [ohci2-controller]: ohci shutdown start
[  177.557972] [ohci2-controller]: ohci shutdown end
[  177.563289] [ohci1-controller]: ohci shutdown start
[  177.568794] [ohci1-controller]: ohci shutdown end
[  177.574098] sunxi_ohci_hcd_shutdown, ohci0-controller is disable, need not shutdown
[  177.582725] [ehci2-controller]: ehci shutdown start
[  177.588227] [ehci2-controller]: ehci shutdown end
[  177.593544] [ehci1-controller]: ehci shutdown start
[  177.599042] [ehci1-controller]: ehci shutdown end
[  177.604345] sunxi_ehci_hcd_shutdown, ehci0-controller is disable, need not shutdown
[  177.619511] sunxi-mmc 4022000.sdmmc: sdc set ios:clk 0Hz bm PP pm OFF vdd 0 width 1 timing LEGACY(SDR12) dt B
[  177.799501] reboot: Power down
[156]HELLO! BOOT0 is starting!
[159]BOOT0 commit : de956292
[162]set pll start
[165]set pll end
[167]ldob fix
[168]ldob cal: 0x2e0f
[171]prcm cpus timer clock enable
[174]board init ok
[176]rtc[2] value = 0x2
[179]rtc[3] value = 0xa102
[182]rtc[4] value = 0xf
[184][mmc]: mmc driver ver 2021-07-13 11:09
[195][mmc]: Wrong media type 0x0
[198][mmc]: ***Try SD card 2***
[202][mmc]: mmc 2 cmd 8 timeout, err 100
[207][mmc]: mmc 2 cmd 8 err 100
[210][mmc]: mmc 2 send if cond failed
[215][mmc]: mmc 2 cmd 55 timeout, err 100
[219][mmc]: mmc 2 cmd 55 err 100
[222][mmc]: mmc 2 send app cmd failed
[226][mmc]: ***Try MMC card 2***
[303][mmc]: RMCA OK!
[306][mmc]: bias 4
[313][mmc]: MMC 5.1
[315][mmc]: HSSDR52/SDR25 8 bit
[319][mmc]: 50000000 Hz
[321][mmc]: 7456 MB
[323][mmc]: ***SD/MMC 2 init OK!!!***
[339]DRAM only have internal ZQ!!
[347]DRAM BOOT DRIVE INFO: V1.18
[351]DRAM CLK = 624 MHz
[353]DRAM Type = 3 (2:DDR2,3:DDR3)
[357]DRAMC ZQ value: 0x7b7bfb
[360]DRAM ODT value: 0x40
[364]DRAM index value: 0x1 0x1
[367]DRAM SIZE = 1024 M
[397]DRAM simple test OK.
[400]dram size =1024
[408]nsi init ok 2020-7-12
[411]card no is 2
[413]sdcard 2 line count 8
[415][mmc]: mmc driver ver 2021-07-13 11:09
[426][mmc]: ***Try MMC card 2***
[534][mmc]: RMCA OK!
[536][mmc]: bias 4
[542][mmc]: MMC 5.1
[544][mmc]: HSSDR52/SDR25 8 bit
[547][mmc]: 50000000 Hz
[550][mmc]: 7456 MB
[552][mmc]: ***SD/MMC 2 init OK!!!***
[698]Loading boot-pkg Succeed(index=0).
[702]Entry_name        = u-boot
[717]Entry_name        = monitor
[722]Entry_name        = scp
[728]Entry_name        = optee
[737]Entry_name        = dtb
[741]tunning data addr:0x4a0003e8
[745]Jump to second Boot.
NOTICE:  BL3-1: v1.0(debug):f6fd0d6
NOTICE:  BL3-1: Built : 10:11:47, 2024-05-22
NOTICE:  BL3-1 commit: 8
NOTICE:  secure os exist
E/TC:0 0 init_external_dt:1033 Device Tree missing
M/TC: OP-TEE version: a8294843 (gcc version 5.3.1 20160412 (Linaro GCC 5.3-2016.05)) #1 Sat Mar  9 10:48:25 UTC 2024 arm
NOTICE:  BL3-1: Preparing for EL3 exit to normal world
NOTICE:  BL3-1: Next image address = 0x4a000000
NOTICE:  BL3-1: Next image spsr = 0x1d3

U-Boot 2018.05-00027-ge159793 (Aug 15 2025 - 10:07:31 +0000) Allwinner Technology

[00.844]CPU:   Allwinner Family
[00.847]Model: sun50iw12
[00.849]DRAM:  1 GiB
[00.853]Relocation Offset is: 35f0e000
[00.880]secure enable bit: 0
E/TC:0   fdt_getprop_u32:336 prop trace_level not found
[00.897]CPU=1392 MHz,PLL6=600 Mhz,AHB=150 Mhz, APB1=100Mhz  MBus=400Mhz
[00.904]gic: sec monitor mode
[00.917]flash init start
[00.919]workmode = 0,storage type = 2
[00.923][mmc]: mmc driver ver uboot2018:2023-05-16 11:34:00 avoid-repeat-reset-host
[00.932][mmc]: get sdc2 sdc_dis_host_caps 0x180.
[00.936][mmc]: SUNXI SDMMC Controller Version:0x50400
[01.044][mmc]: Best spd md: 2-HSDDR52/DDR50, freq: 2-50000000, Bus width: 8
[01.051]sunxi flash init ok
zztest---usb power enable
unable to find pwm led node in device tree.
[01.060]Loading Environment from SUNXI_FLASH... OK
[01.076]usb burn from boot
delay time 0
weak:otg_phy_config
[01.085]usb prepare ok
[01.889]overtime
[01.892]do_burn_from_boot usb : no usb exist
resetting USB...
[01.898]USB0:   start sunxi  USB-DRD...
config usb clk ok
sunxi USB-DRD init ok...
USB EHCI 1.00
scanning bus 0 for devices... 1 USB Device(s) found
[02.348]USB1:   start sunxi  USB1-Host...
config usb clk ok
sunxi USB1-Host init ok...
USB EHCI 1.00
scanning bus 1 for devices... 1 USB Device(s) found
[02.799]scanning usb for storage devices... 0 Storage Device(s) found
** Bad device usb 0 **
** Bad device usb 0 **
zztest---get_prj_config_from_oem
[02.830]get file(prj_config.ini) size from media_data error
10 bytes read in 0 ms
zztest---prj_mode=0
zztst--mode = 0
[SCP] :wait arisc ready....
[SCP] :arisc version: [jorpotcevt-r-303rdna1dio1v-13-3.72g-16b0]
[SCP] :arisc startup ready
[SCP] :arisc startup notify message feedback
[SCP] :sunxi-arisc driver v1.10 is starting
 [117]HELLO! BOOT0 is starting!
[120]BOOT0 commit : de956292
[123]set pll start
[126]set pll end
[128]ldob fix
[130]ldob cal: 0x2e0f
[132]prcm cpus timer clock enable
[136]board init ok
[138][mmc]: mmc driver ver 2021-07-13 11:09
[148][mmc]: Wrong media type 0x0
[152][mmc]: ***Try SD card 2***
[156][mmc]: mmc 2 cmd 8 timeout, err 100
[160][mmc]: mmc 2 cmd 8 err 100
[163][mmc]: mmc 2 send if cond failed
[168][mmc]: mmc 2 cmd 55 timeout, err 100
[172][mmc]: mmc 2 cmd 55 err 100
[176][mmc]: mmc 2 send app cmd failed
[180][mmc]: ***Try MMC card 2***
[257][mmc]: RMCA OK!
[259][mmc]: bias 4
[267][mmc]: MMC 5.1
[269][mmc]: HSSDR52/SDR25 8 bit
[272][mmc]: 50000000 Hz
[275][mmc]: 7456 MB
[277][mmc]: ***SD/MMC 2 init OK!!!***
[293]DRAM only have internal ZQ!!
[301]DRAM BOOT DRIVE INFO: V1.18
[304]DRAM CLK = 624 MHz
[307]DRAM Type = 3 (2:DDR2,3:DDR3)
[311]DRAMC ZQ value: 0x7b7bfb
[314]DRAM ODT value: 0x40
[318]DRAM index value: 0x1 0x1
[321]DRAM SIZE = 1024 M
[351]DRAM simple test OK.
[354]dram size =1024
[361]nsi init ok 2020-7-12
[364]card no is 2
[366]sdcard 2 line count 8
[369][mmc]: mmc driver ver 2021-07-13 11:09
[379][mmc]: ***Try MMC card 2***
[487][mmc]: RMCA OK!
[489][mmc]: bias 4
[495][mmc]: MMC 5.1
[498][mmc]: HSSDR52/SDR25 8 bit
[501][mmc]: 50000000 Hz
[503][mmc]: 7456 MB
[506][mmc]: ***SD/MMC 2 init OK!!!***
[652]Loading boot-pkg Succeed(index=0).
[656]Entry_name        = u-boot
[671]Entry_name        = monitor
[676]Entry_name        = scp
[682]Entry_name        = optee
[690]Entry_name        = dtb
[695]tunning data addr:0x4a0003e8
[698]Jump to second Boot.
NOTICE:  BL3-1: v1.0(debug):f6fd0d6
NOTICE:  BL3-1: Built : 10:11:47, 2024-05-22
NOTICE:  BL3-1 commit: 8
NOTICE:  secure os exist
E/TC:0 0 init_external_dt:1033 Device Tree missing
M/TC: OP-TEE version: a8294843 (gcc version 5.3.1 20160412 (Linaro GCC 5.3-2016.05)) #1 Sat Mar  9 10:48:25 UTC 2024 arm
NOTICE:  BL3-1: Preparing for EL3 exit to normal world
NOTICE:  BL3-1: Next image address = 0x4a000000
NOTICE:  BL3-1: Next image spsr = 0x1d3

U-Boot 2018.05-00027-ge159793 (Aug 15 2025 - 10:07:31 +0000) Allwinner Technology

[00.798]CPU:   Allwinner Family
[00.801]Model: sun50iw12
[00.803]DRAM:  1 GiB
[00.807]Relocation Offset is: 35f0e000
[00.834]secure enable bit: 0
E/TC:0   fdt_getprop_u32:336 prop trace_level not found
[00.851]CPU=1392 MHz,PLL6=600 Mhz,AHB=150 Mhz, APB1=100Mhz  MBus=400Mhz
[00.858]gic: sec monitor mode
[00.871]flash init start
[00.873]workmode = 0,storage type = 2
[00.877][mmc]: mmc driver ver uboot2018:2023-05-16 11:34:00 avoid-repeat-reset-host
[00.885][mmc]: get sdc2 sdc_dis_host_caps 0x180.
[00.890][mmc]: SUNXI SDMMC Controller Version:0x50400
[00.998][mmc]: Best spd md: 2-HSDDR52/DDR50, freq: 2-50000000, Bus width: 8
[01.005]sunxi flash init ok
zztest---usb power enable
unable to find pwm led node in device tree.
[01.014]Loading Environment from SUNXI_FLASH... OK
[01.029]usb burn from boot
delay time 0
weak:otg_phy_config
[01.039]usb prepare ok
[01.843]overtime
[01.846]do_burn_from_boot usb : no usb exist
resetting USB...
[01.852]USB0:   start sunxi  USB-DRD...
config usb clk ok
sunxi USB-DRD init ok...
USB EHCI 1.00
scanning bus 0 for devices... 1 USB Device(s) found
[02.302]USB1:   start sunxi  USB1-Host...
config usb clk ok
sunxi USB1-Host init ok...
USB EHCI 1.00
scanning bus 1 for devices... 1 USB Device(s) found
[02.753]scanning usb for storage devices... 0 Storage Device(s) found
** Bad device usb 0 **
** Bad device usb 0 **
zztest---get_prj_config_from_oem
[02.784]get file(prj_config.ini) size from media_data error
10 bytes read in 0 ms
zztest---prj_mode=0
zztst--mode = 0
[SCP] :wait arisc ready....
[SCP] :arisc version: [jorpotcevt-r-303rdna1dio1v-13-3.72g-16b0]
[SCP] :arisc startup ready
[SCP] :arisc startup notify message feedback
[SCP] :sunxi-arisc driver v1.10 is starting
[116]HELLO! BOOT0 is starting!
[119]BOOT0 commit : de956292
[122]set pll start
[125]set pll end
[127]ldob fix
[129]ldob cal: 0x2e0f
[131]prcm cpus timer clock enable
[135]board init ok
[137]rtc[0] value = 0x14ff00
[140]rtc[2] value = 0xf
[142]rtc[3] value = 0xf4f48003
[146][mmc]: mmc driver ver 2021-07-13 11:09
[156][mmc]: Wrong media type 0x0
[160][mmc]: ***Try SD card 2***
[164][mmc]: mmc 2 cmd 8 timeout, err 100
[168][mmc]: mmc 2 cmd 8 err 100
[171][mmc]: mmc 2 send if cond failed
[176][mmc]: mmc 2 cmd 55 timeout, err 100
[180][mmc]: mmc 2 cmd 55 err 100
[184][mmc]: mmc 2 send app cmd failed
[188][mmc]: ***Try MMC card 2***
[265][mmc]: RMCA OK!
[267][mmc]: bias 4
[275][mmc]: MMC 5.1
[277][mmc]: HSSDR52/SDR25 8 bit
[280][mmc]: 50000000 Hz
[283][mmc]: 7456 MB
[285][mmc]: ***SD/MMC 2 init OK!!!***
[301]DRAM only have internal ZQ!!
[309]DRAM BOOT DRIVE INFO: V1.18
[312]DRAM CLK = 624 MHz
[315]DRAM Type = 3 (2:DDR2,3:DDR3)
[319]DRAMC ZQ value: 0x7b7bfb
[322]DRAM ODT value: 0x40
[326]DRAM index value: 0x1 0x1
[329]DRAM SIZE = 1024 M
[359]DRAM simple test OK.
[362]dram size =1024
[370]nsi init ok 2020-7-12
[372]card no is 2
[374]sdcard 2 line count 8
[377][mmc]: mmc driver ver 2021-07-13 11:09
[387][mmc]: ***Try MMC card 2***
[495][mmc]: RMCA OK!
[498][mmc]: bias 4
[504][mmc]: MMC 5.1
[506][mmc]: HSSDR52/SDR25 8 bit
[509][mmc]: 50000000 Hz
[512][mmc]: 7456 MB
[514][mmc]: ***SD/MMC 2 init OK!!!***
[660]Loading boot-pkg Succeed(index=0).
[664]Entry_name        = u-boot
[679]Entry_name        = monitor
[684]Entry_name        = scp
[690]Entry_name        = optee
[698]Entry_name        = dtb
[703]tunning data addr:0x4a0003e8
[707]Jump to second Boot.
NOTICE:  BL3-1: v1.0(debug):f6fd0d6
NOTICE:  BL3-1: Built : 10:11:47, 2024-05-22
NOTICE:  BL3-1 commit: 8
NOTICE:  secure os exist
E/TC:0 0 init_external_dt:1033 Device Tree missing
M/TC: OP-TEE version: a8294843 (gcc version 5.3.1 20160412 (Linaro GCC 5.3-2016.05)) #1 Sat Mar  9 10:48:25 UTC 2024 arm
NOTICE:  BL3-1: Preparing for EL3 exit to normal world
NOTICE:  BL3-1: Next image address = 0x4a000000
NOTICE:  BL3-1: Next image spsr = 0x1d3ÿ

U-Boot 2018.05-00027-ge159793 (Aug 15 2025 - 10:07:31 +0000) Allwinner Technology

[00.805]CPU:   Allwinner Family
[00.808]Model: sun50iw12
[00.810]DRAM:  1 GiB
[00.815]Relocation Offset is: 35f0e000
[00.842]secure enable bit: 0
E/TC:0   fdt_getprop_u32:336 prop trace_level not found
[00.859]CPU=1392 MHz,PLL6=600 Mhz,AHB=150 Mhz, APB1=100Mhz  MBus=400Mhz
[00.865]gic: sec monitor mode
[00.879]flash init start
[00.881]workmode = 0,storage type = 2
[00.884][mmc]: mmc driver ver uboot2018:2023-05-16 11:34:00 avoid-repeat-reset-host
[00.893][mmc]: get sdc2 sdc_dis_host_caps 0x180.
[00.897][mmc]: SUNXI SDMMC Controller Version:0x50400
[01.005][mmc]: Best spd md: 2-HSDDR52/DDR50, freq: 2-50000000, Bus width: 8
[01.012]sunxi flash init ok
zztest---usb power enable
unable to find pwm led node in device tree.
[01.021]Loading Environment from SUNXI_FLASH... OK
[01.036]usb burn from boot
delay time 0
weak:otg_phy_config
[01.046]usb prepare ok
[01.849]overtime
[01.852]do_burn_from_boot usb : no usb exist
zztest---get_prj_config_from_oem
[01.874]get file(prj_config.ini) size from media_data error
10 bytes read in 0 ms
zztest---prj_mode=0
zztst--mode = 0
Failed to get bl id property
Failed to get pwm_id property
zztest---fan power enable
zztest---fan power enable
secure storage read widevine fail
[01.929]secure storage read widevine fail with:-1
secure storage read ec_key fail
[01.936]secure storage read ec_key fail with:-1
15652 bytes read in 3 ms (5 MiB/s)
2764854 bytes read in 33 ms (79.9 MiB/s)
rtc: ir wakeup = 0xff0014
zztest--try to get panel_config.ini from /oem
[01.993]get file(panel_config.ini) size from media_data error
zztest--/oem/panel_config.ini is no exsists ,get panel_config.ini from Reserve0
2525 bytes read in 1 ms (2.4 MiB/s)
[02.010]LogRegData.bin version is 25-4-10-157
[02.015]Project id:0x34 version:25-1-6-3
[02.020]pwm_request: err: get reg-base err.
[02.023]pwm5 request for fastlogo fail!
1255696 bytes read in 16 ms (74.8 MiB/s)
display_bin addr: 0x7857b000 copy 0x4b100000, size: 0x132910
4743 bytes read in 1 ms (4.5 MiB/s)
display_cfg addr: 0x77f36000 copy 0x4be01000, size: 0x1287
[02.878]CWL  tse_id mips/ProjectID_0x0034.TSE
[02.883]get file(mips/database.TSE) size from media_data error
282464 bytes read in 6 ms (44.9 MiB/s)
mips/database.TSE addr: 0x786ae000 copy 0x4be41000, size: 0x44f60
[02.907]get file(mips/pq_custom.TSE) size from media_data error
15016 bytes read in 2 ms (7.2 MiB/s)
mips/pq_custom.TSE addr: 0x77f38000 copy 0x4be85f60, size: 0x3aa8
[02.927]get file(mips/projecttable.TSE) size from media_data error
1384 bytes read in 2 ms (675.8 KiB/s)
mips/projecttable.TSE addr: 0x77f3c000 copy 0x4be89a08, size: 0x568
[02.947]get file(mips/ProjectID_0x0034.TSE) size from media_data error
17304 bytes read in 3 ms (5.5 MiB/s)
mips/ProjectID_0x0034.TSE addr: 0x77f3d000 copy 0x4be89f70, size: 0x4398
[03.494]Display fastlogo finish!
List file under ULI/factory
** Unrecognized filesystem type **
[03.695]update part info
[03.905]update bootcmd
[03.910]change working_fdt 0x77ebde70 to 0x77e8de70
[03.915][mmc]: delete mmc-hs400-1_8v from dtb
[03.919][mmc]: delete mmc-hs200-1_8v from dtb
[03.927]## error: update_fdt_dram_para : FDT_ERR_NOTFOUND
[03.932]update dts
Hit any key to stop autoboot:  1  0 
zztest---add env prj_mode
zztest---get prj_mode=prj_mode=0
Android's image name: arm
[05.509]Starting kernel ...

[05.511][mmc]: mmc exit start
[05.616][mmc]: mmc 2 exit ok
[SCP] :wait arisc ready....
[SCP] :arisc version: [jorpotcevt-r-303rdna1dio1v-13-3.72g-16b0]
[SCP] :arisc startup ready
[SCP] :arisc startup notify message feedback
[SCP] :sunxi-arisc driver v1.10 is starting
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.4.99-00049-g34f0974adef4-dirty (hotack@dell-PowerEdge-R740) (arm-linux-gnueabi-gcc (Linaro GCC 5.3-2016.05) 5.3.1 20160412, GNU ld (Linaro_Binutils-2016.05) 2.25.0 Linaro 2016_02) #1006 SMP PREEMPT Mon Sep 22 09:29:12 CST 2025
[    0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7), cr=10c0383d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] OF: fdt: Machine model: sun50iw12
[    0.000000] printk: bootconsole [earlycon0] enabled
[    0.000000] OF: reserved mem: OVERLAP DETECTED!
[    0.000000] mipsloader (0x4b100000--0x4d941000) overlaps with framebuf (0x4bf41000--0x4d941000)
[    0.006475] BOOTEVENT:         6.467915: ON
[    0.091140] sunxi-msgbox-amp 3003000.msgbox: invalid resource
[    0.099231] sunxi_pwm_probe: can't get pwm  bus clk
[    0.455629] uart uart0: get regulator failed
[    0.460915] uart uart1: get regulator failed
[    0.482439] mipsloader 3061000.mipsloader: request pins failed: -19
[    0.490910] motor-control motor_ctr: failed to get property limiter-gpio
[    0.499500] Failed to read array length
[    0.509292] sunxi_key_init: get key count failed
[    0.509298] sunxi_gpadc_setup: get channel compare select failed
[    0.521567] sunxi_gpadc_setup: get channel compare low data select failed
[    0.529189] sunxi_gpadc_setup: get channel compare hig data select failed
[    0.536771] sunxi_gpadc_setup: get channel scan data failed
[    0.542997] sunxi_gpadc_setup:get channel0_compare_lowdata err!
[    0.549611] sunxi_gpadc_setup:get channel0_compare_higdata err!
[    0.556223] sunxi_gpadc_setup:get channel1_compare_lowdata err!
[    0.562837] sunxi_gpadc_setup:get channel1_compare_higdata err!
[    0.572624] sunxi_ir_startup: get ir protocol failed
[    0.636176] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 52, RTO !!
[    0.643844] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 52, RTO !!
[    0.655904] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 5, RTO !!
[    0.663464] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 5, RTO !!
[    0.670901] [AUDIOCODEC][sunxi_codec_parse_params][1905]:adcdrc_used:0, adchpf_used:0, dacdrc_used:0, dachpf_used:0
[    0.670901] 
[    0.671042] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 5, RTO !!
[    0.684567] debugfs: Directory '2030000.codec' with parent 'regmap' already present!
[    0.699786] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 5, RTO !!
[    0.707240] debugfs: Directory '203032c.dummy_cpudai' with parent 'audiocodec' already present!
[    0.719037] sunxi-mmc 4022000.sdmmc: avoid to switch power_off_notification to POWERED_ON(0x01)
[    0.728814] sunxi-mmc 4022000.sdmmc: avoid to switch power_off_notification to POWERED_ON(0x01)
[    0.738543] sunxi-mmc 4022000.sdmmc: avoid to switch power_off_notification to POWERED_ON(0x01)
[    0.748285] sunxi-mmc 4022000.sdmmc: avoid to switch power_off_notification to POWERED_ON(0x01)
[    0.780597] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0x69)
[    0.790221] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0x69)
[    0.799795] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0x69)
[    0.809370] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0x69)
[    0.819125] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0x69)
[    0.837766] [stkAccel] stk_report_accel_data/2333: No input device for accel data
[    0.850525] [stkAccel] kxt_parse_dt/1108: Unable to read kxtj3,irq-gpio
[    0.858225] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0xe)
[    0.867758] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0xe)
[    0.877404] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0xe)
[    0.887047] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0xe)
[    0.896294] [stkAccel] kxt_i2c_probe/1275: kxtj3 initialization failed
[    0.906436] incorrect key number.
[    0.978708] debugfs: Directory 'sunxi-ehci' with parent 'ehci' already present!
[    1.053085] debugfs: Directory 'sunxi-ohci' with parent 'ohci' already present!
[    1.130763] cpu cpu0: dev_pm_opp_set_rate: failed to find current OPP for freq 1392000000 (-34)
[    1.155834] sunxi-audio-card 203705c.soundowa1: use dummy codec for simple card.
[    1.164279] debugfs: Directory '2037000.owa' with parent 'sndowa1' already present!
[    1.174543] sunxi-audio-card 203207c.sounddaudio0: use dummy codec for simple card.
[    1.183253] debugfs: Directory '2032000.daudio' with parent 'snddaudio0' already present!
[    1.193863] sunxi-audio-card 203307c.sounddaudio0: use dummy codec for simple card.
[    1.202577] debugfs: Directory '2033000.daudio' with parent 'snddaudio1' already present!
[    1.218214] get_key_map_info()199 - Failed to find "oe" in dts.
[    1.225046] [ac200] get ave_regulator_name failed!
[    1.230852] [ac200] pwm enable
[    1.267031] Kernel init done
[    1.395429] init: [libfs_mgr]not access /system/bin/fsck_msdos
[    1.404131] logwrapper: executing /system/bin/fsck_msdos failed: No such file or directory
[    1.413416] logwrapper: 
[    1.420273] logwrapper: Cannot log to file /dev/fscklogs/log
[    1.426991] logwrapper: 
[    1.484769] logwrapper: executing /system/bin/newfs_msdos failed: No such file or directory
[    1.494131] logwrapper: 
[    1.502815] logwrapper: executing /system/bin/newfs_msdos failed: No such file or directory
[    1.512185] logwrapper: 
[    1.917349] init: Could not update logical partition
[    2.586263] init: Could not set 'ro.boot.dynamic_partitions' to 'true' while loading .prop filesRead-only property was already set
[    2.599449] init: Could not set 'ro.boot.dynamic_partitions_retrofit' to 'true' while loading .prop filesRead-only property was already set
[    2.757996] cgroup1: Unknown subsys name 'blkio'
[    2.763255] libprocessgroup: Failed to mount blkio cgroup: Invalid argument
[    2.772647] libprocessgroup: Failed to mount cpuset cgroup: No such device
[    2.782044] cgroup1: Unknown subsys name 'schedtune'
[    2.787642] libprocessgroup: Failed to mount schedtune cgroup: Invalid argument
[    3.136540] sunxi-rfkill soc@2900000:rfkill: get gpio chip_en failed
[    3.143851] sunxi-rfkill soc@2900000:rfkill: get gpio power_en failed
console:/ $ [    3.912864] debugfs: Directory '1800000.gpu-gpu' with parent 'vdd_sys' already present!
[    3.925681] mali 1800000.gpu: Sunxi_data->dvfs_status is false, continuing without devfreq
[    3.948761] invalid gpio:-2!
[    3.957429] invalid gpio:-2!
[    3.960846] invalid gpio:-2!
[    3.964397] platform 2000c15.pwm5: pinctrl_get failed!
[    4.004744] sunxi-pm-domain 7001000.power-management:power-controller: failed to set domain 'pd_tvcap', val=0
[    4.032059] LogRegData.bin version is 25-4-10-157
[    4.037989] Project id:0x34 version:25-1-6-3
[    4.042846] ge2d 5240000.ge2d: firmware downloaded!
[    4.268719] init: [libfs_mgr]fs_mgr_do_resize: Reszie /dev/block/by-name/userdata as '0'
[    4.373120] pMemInBuffer[0]=0xc344ba00 pMemInBuffer[0]->bufStart=0x436c0000
[    4.381015] pMemInBuffer[1]=0xc344ba40 pMemInBuffer[1]->bufStart=0x436e0000
[    4.388848] pMemInBuffer[2]=0xc344ba80 pMemInBuffer[2]->bufStart=0x43700000
[    4.396674] pMemInBuffer[3]=0xc344bac0 pMemInBuffer[3]->bufStart=0x43720000
[    4.404513] [AudBrg_Init] --> audio bridge irq num: 38
[    4.410465] [ABP_DTV_Init] --> abp_dtv irq num: 39
[    4.415942] audiobridge alloc size: 0x160000
[    4.421436] audiobridge ion_alloc success!
[    4.426147] audiobridge ion alloc success, and phy_addr: 0x0
[    4.432478] audiobridge:247 audbrg_istream_ConfigMemMap() ISTREAM1 phy_addr=0x0 vir_addr=0xf0ec2000
[    4.442590] audiobridge:258 audbrg_istream_ConfigMemMap() ISTREAM2 phy_addr=0x10000 vir_addr=0xf0ed2000
[    4.453089] audiobridge:269 audbrg_istream_ConfigMemMap() ISTREAM3 phy_addr=0x20000 vir_addr=0xf0ee2000
[    4.463590] audiobridge:280 audbrg_istream_ConfigMemMap() ISTREAM4 phy_addr=0x30000 vir_addr=0xf0ef2000
[    4.474094] audiobridge:155 audbrg_ostream_ConfigMemMap() OSTREAM1 phy_addr=0x40000 vir_addr=0xf0f02000
[    4.484598] audiobridge:166 audbrg_ostream_ConfigMemMap() OSTREAM2 phy_addr=0x50000 vir_addr=0xf0f12000
[    4.495097] audiobridge:232 audbrg_delayline_ConfigMemMap() DELAYLINE1 phy_addr=0x60000 vir_addr=0xf0f22000
[    4.505990] audiobridge:246 audbrg_delayline_ConfigMemMap() DELAYLINE2 phy_addr=0xa0000 vir_addr=0xf0f62000
[    4.516883] audiobridge:260 audbrg_delayline_ConfigMemMap() DELAYLINE3 phy_addr=0xe0000 vir_addr=0xf0fa2000
[    4.527778] audiobridge:274 audbrg_delayline_ConfigMemMap() DELAYLINE4 phy_addr=0x120000 vir_addr=0xf0fe2000
[    5.688085] pinctrl_get for allwinner,sunxi-pwm fail
[    6.869394] init: Could not start service 'bleaudiod' as part of class 'core': Cannot find '/system/bin/bleaudiod': No such file or directory
[    7.847040] regulator-dummy: Underflow of regulator enable count
[    7.853882] regulator-dummy: Underflow of regulator enable count
[    9.458641] init: Could not start service 'iosmain' as part of class 'main': Cannot find '/system/bin/iosmain': No such file or directory
[   10.932899] init: Could not start service 'vendor_flash_recovery' as part of class 'main': Cannot find '/vendor/bin/install-recovery.sh': No such file or directory
[   11.045906] init: Control message: Could not find 'android.hardware.camera.provider@2.4::ICameraProvider/legacy/0' for ctl.interface_start from pid: 2192 (/system/bin/hwservicemanager)
[   19.087769] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 52, RTO !!
[   19.095679] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 52, RTO !!
[   20.142713] aicbsp: err:<aicwf_sdio_bus_pwrctl,1260>: bus down
[   28.878469] audit: rate limit exceeded
[   40.382840] audit: rate limit exceeded
[   66.404534] sunxi_pwm_enable_dual: can't parse pwm device
[   70.108889] libprocessgroup: Failed to kill process cgroup uid 0 pid 2612 in 241ms, 1 processes remain
[   70.383467] regulator-dummy: Underflow of regulator enable count
[   75.445737] sysrq: Kill All Tasks
[   75.455171] init: Unmounting /dev/block/by-name/userdata:/data opts rw,lazytime,seclabel,nosuid,nodev,noatime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,reserve_root=45199,resuid=0,resgid=1065,alloc_mode=reuse,fsync_mode=posix
[   76.263479] init: Umounted /dev/block/by-name/userdata:/data opts rw,lazytime,seclabel,nosuid,nodev,noatime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,reserve_root=45199,resuid=0,resgid=1065,alloc_mode=reuse,fsync_mode=posix
[   76.295529] init: sync() after umount...
[   76.300346] init: sync() after umount took4ms
[   76.405646] init: powerctl_shutdown_time_ms:7023:2
[   76.411151] init: Reboot ending, jumping to kernel
[   76.411281] init: remaining_shutdown_time: 299
[   76.436596] reboot_callback(): empty arg
[   76.454857] ge2d 5240000.ge2d: acquire tvdisp clock on emergency shutdown
[   77.058932] Invalid pin
[   77.061681] Invalid pin
[   77.064447] Invalid pin
[   77.067225] ge2d 5240000.ge2d: ge2d suspend
[   77.072113] [ohci2-controller]: ohci shutdown start
[   77.077625] [ohci2-controller]: ohci shutdown end
[   77.082941] [ohci1-controller]: ohci shutdown start
[   77.088442] [ohci1-controller]: ohci shutdown end
[   77.093742] sunxi_ohci_hcd_shutdown, ohci0-controller is disable, need not shutdown
[   77.102359] [ehci2-controller]: ehci shutdown start
[   77.107856] [ehci2-controller]: ehci shutdown end
[   77.113170] [ehci1-controller]: ehci shutdown start
[   77.118678] [ehci1-controller]: ehci shutdown end
[   77.123976] sunxi_ehci_hcd_shutdown, ehci0-controller is disable, need not shutdown
[   77.137595] sunxi-mmc 4022000.sdmmc: sdc set ios:clk 0Hz bm PP pm OFF vdd 0 width 1 timing LEGACY(SDR12) dt B
[   77.319209] reboot: Power down
[169]HELLO! BOOT0 is starting!
[172]BOOT0 commit : de956292
[175]set pll start
[178]set pll end
[180]ldob fix
[182]ldob cal: 0x2e0f
[184]prcm cpus timer clock enable
[188]board init ok
[190]rtc[0] value = 0x14ff00
[193]rtc[2] value = 0x2
[195]rtc[3] value = 0xa102
[198]rtc[4] value = 0xf
[201][mmc]: mmc driver ver 2021-07-13 11:09
[211][mmc]: Wrong media type 0x0
[215][mmc]: ***Try SD card 2***
[219][mmc]: mmc 2 cmd 8 timeout, err 100
[223][mmc]: mmc 2 cmd 8 err 100
[226][mmc]: mmc 2 send if cond failed
[231][mmc]: mmc 2 cmd 55 timeout, err 100
[235][mmc]: mmc 2 cmd 55 err 100
[239][mmc]: mmc 2 send app cmd failed
[243][mmc]: ***Try MMC card 2***
[339][mmc]: RMCA OK!
[341][mmc]: bias 4
[349][mmc]: MMC 5.1
[351][mmc]: HSSDR52/SDR25 8 bit
[354][mmc]: 50000000 Hz
[357][mmc]: 7456 MB
[359][mmc]: ***SD/MMC 2 init OK!!!***
[375]DRAM only have internal ZQ!!
[383]DRAM BOOT DRIVE INFO: V1.18
[386]DRAM CLK = 624 MHz
[389]DRAM Type = 3 (2:DDR2,3:DDR3)
[393]DRAMC ZQ value: 0x7b7bfb
[396]DRAM ODT value: 0x40
[400]DRAM index value: 0x1 0x1
[403]DRAM SIZE = 1024 M
[433]DRAM simple test OK.
[436]dram size =1024
[444]nsi init ok 2020-7-12
[446]card no is 2
[448]sdcard 2 line count 8
[451][mmc]: mmc driver ver 2021-07-13 11:09
[462][mmc]: ***Try MMC card 2***
[588][mmc]: RMCA OK!
[591][mmc]: bias 4
[597][mmc]: MMC 5.1
[599][mmc]: HSSDR52/SDR25 8 bit
[602][mmc]: 50000000 Hz
[604][mmc]: 7456 MB
[607][mmc]: ***SD/MMC 2 init OK!!!***
[753]Loading boot-pkg Succeed(index=0).
[757]Entry_name        = u-boot
[772]Entry_name        = monitor
[777]Entry_name        = scp
[783]Entry_name        = optee
[791]Entry_name        = dtb
[796]tunning data addr:0x4a0003e8
[800]Jump to second Boot.
NOTICE:  BL3-1: v1.0(debug):f6fd0d6
NOTICE:  BL3-1: Built : 10:11:47, 2024-05-22
NOTICE:  BL3-1 commit: 8
NOTICE:  secure os exist
E/TC:0 0 init_external_dt:1033 Device Tree missing
M/TC: OP-TEE version: a8294843 (gcc version 5.3.1 20160412 (Linaro GCC 5.3-2016.05)) #1 Sat Mar  9 10:48:25 UTC 2024 arm
NOTICE:  BL3-1: Preparing for EL3 exit to normal world
NOTICE:  BL3-1: Next image address = 0x4a000000
NOTICE:  BL3-1: Next image spsr = 0x1d3ÿ

U-Boot 2018.05-00027-ge159793 (Aug 15 2025 - 10:07:31 +0000) Allwinner Technology

[00.898]CPU:   Allwinner Family
[00.901]Model: sun50iw12
[00.903]DRAM:  1 GiB
[00.908]Relocation Offset is: 35f0e000
[00.934]secure enable bit: 0
E/TC:0   fdt_getprop_u32:336 prop trace_level not found
[00.952]CPU=1392 MHz,PLL6=600 Mhz,AHB=150 Mhz, APB1=100Mhz  MBus=400Mhz
[00.958]gic: sec monitor mode
[00.972]flash init start
[00.974]workmode = 0,storage type = 2
[00.977][mmc]: mmc driver ver uboot2018:2023-05-16 11:34:00 avoid-repeat-reset-host
[00.986][mmc]: get sdc2 sdc_dis_host_caps 0x180.
[00.990][mmc]: SUNXI SDMMC Controller Version:0x50400
[01.118][mmc]: Best spd md: 2-HSDDR52/DDR50, freq: 2-50000000, Bus width: 8
[01.124]sunxi flash init ok
zztest---usb power enable
unable to find pwm led node in device tree.
[01.134]Loading Environment from SUNXI_FLASH... OK
[01.149]usb burn from boot
delay time 0
weak:otg_phy_config
[01.159]usb prepare ok
[01.962]overtime
[01.965]do_burn_from_boot usb : no usb exist
resetting USB...
[01.971]USB0:   start sunxi  USB-DRD...
config usb clk ok
sunxi USB-DRD init ok...
USB EHCI 1.00
scanning bus 0 for devices... 1 USB Device(s) found
[02.421]USB1:   start sunxi  USB1-Host...
config usb clk ok
sunxi USB1-Host init ok...
USB EHCI 1.00
scanning bus 1 for devices... 1 USB Device(s) found
[02.872]scanning usb for storage devices... 0 Storage Device(s) found
** Bad device usb 0 **
** Bad device usb 0 **
zztest---get_prj_config_from_oem
[02.903]get file(prj_config.ini) size from media_data error
10 bytes read in 0 ms
zztest---prj_mode=0
zztst--mode = 0
[SCP] :wait arisc ready....
[SCP] :arisc version: [jorpotcevt-r-303rdna1dio1v-13-3.72g-16b0]
[SCP] :arisc startup ready
[SCP] :arisc startup notify message feedback
[SCP] :sunxi-arisc driver v1.10 is starting
 [136]HELLO! BOOT0 is starting!
[140]BOOT0 commit : de956292
[143]set pll start
[145]set pll end
[147]ldob fix
[149]ldob cal: 0x2e0f
[151]prcm cpus timer clock enable
[155]board init ok
[157][mmc]: mmc driver ver 2021-07-13 11:09
[168][mmc]: Wrong media type 0x0
[171][mmc]: ***Try SD card 2***
[175][mmc]: mmc 2 cmd 8 timeout, err 100
[179][mmc]: mmc 2 cmd 8 err 100
[183][mmc]: mmc 2 send if cond failed
[187][mmc]: mmc 2 cmd 55 timeout, err 100
[192][mmc]: mmc 2 cmd 55 err 100
[195][mmc]: mmc 2 send app cmd failed
[199][mmc]: ***Try MMC card 2***
[295][mmc]: RMCA OK!
[298][mmc]: bias 4
[305][mmc]: MMC 5.1
[307][mmc]: HSSDR52/SDR25 8 bit
[311][mmc]: 50000000 Hz
[313][mmc]: 7456 MB
[315][mmc]: ***SD/MMC 2 init OK!!!***
[331]DRAM only have internal ZQ!!
[339]DRAM BOOT DRIVE INFO: V1.18
[343]DRAM CLK = 624 MHz
[345]DRAM Type = 3 (2:DDR2,3:DDR3)
[349]DRAMC ZQ value: 0x7b7bfb
[352]DRAM ODT value: 0x40
[356]DRAM index value: 0x1 0x1
[359]DRAM SIZE = 1024 M
[389]DRAM simple test OK.
[392]dram size =1024
[394]key press : 
[402]nsi init ok 2020-7-12
[404]card no is 2
[406]sdcard 2 line count 8
[409][mmc]: mmc driver ver 2021-07-13 11:09
[420][mmc]: ***Try MMC card 2***
[546][mmc]: RMCA OK!
[549][mmc]: bias 4
[555][mmc]: MMC 5.1
[557][mmc]: HSSDR52/SDR25 8 bit
[560][mmc]: 50000000 Hz
[562][mmc]: 7456 MB
[565][mmc]: ***SD/MMC 2 init OK!!!***
[711]Loading boot-pkg Succeed(index=0).
[715]Entry_name        = u-boot
[730]Entry_name        = monitor
[735]Entry_name        = scp
[741]Entry_name        = optee
[749]Entry_name        = dtb
[754]tunning data addr:0x4a0003e8
[758]Jump to second Boot.
NOTICE:  BL3-1: v1.0(debug):f6fd0d6
NOTICE:  BL3-1: Built : 10:11:47, 2024-05-22
NOTICE:  BL3-1 commit: 8
NOTICE:  secure os exist
E/TC:0 0 init_external_dt:1033 Device Tree missing
M/TC: OP-TEE version: a8294843 (gcc version 5.3.1 20160412 (Linaro GCC 5.3-2016.05)) #1 Sat Mar  9 10:48:25 UTC 2024 arm
NOTICE:  BL3-1: Preparing for EL3 exit to normal world
NOTICE:  BL3-1: Next image address = 0x4a000000
NOTICE:  BL3-1: Next image spsr = 0x1d3

U-Boot 2018.05-00027-ge159793 (Aug 15 2025 - 10:07:31 +0000) Allwinner Technology

[00.857]CPU:   Allwinner Family
[00.860]Model: sun50iw12
[00.862]DRAM:  1 GiB
[00.866]Relocation Offset is: 35f0e000
[00.893]secure enable bit: 0
E/TC:0   fdt_getprop_u32:336 prop trace_level not found
[00.911]CPU=1392 MHz,PLL6=600 Mhz,AHB=150 Mhz, APB1=100Mhz  MBus=400Mhz
[00.917]gic: sec monitor mode
[00.931]flash init start
[00.933]workmode = 0,storage type = 2
[00.936][mmc]: mmc driver ver uboot2018:2023-05-16 11:34:00 avoid-repeat-reset-host
[00.945][mmc]: get sdc2 sdc_dis_host_caps 0x180.
[00.949][mmc]: SUNXI SDMMC Controller Version:0x50400
[01.076][mmc]: Best spd md: 2-HSDDR52/DDR50, freq: 2-50000000, Bus width: 8
[01.083]sunxi flash init ok
zztest---usb power enable
unable to find pwm led node in device tree.
[01.092]Loading Environment from SUNXI_FLASH... OK
[01.108]usb burn from boot
delay time 0
weak:otg_phy_config
[01.117]usb prepare ok
[01.921]overtime
[01.924]do_burn_from_boot usb : no usb exist
resetting USB...
[01.930]USB0:   start sunxi  USB-DRD...
config usb clk ok
sunxi USB-DRD init ok...
USB EHCI 1.00
scanning bus 0 for devices... 1 USB Device(s) found
[02.380]USB1:   start sunxi  USB1-Host...
config usb clk ok
sunxi USB1-Host init ok...
USB EHCI 1.00
scanning bus 1 for devices... 1 USB Device(s) found
[02.831]scanning usb for storage devices... 0 Storage Device(s) found
** Bad device usb 0 **
** Bad device usb 0 **
zztest---get_prj_config_from_oem
[02.862]get file(prj_config.ini) size from media_data error
10 bytes read in 0 ms
zztest---prj_mode=0
zztst--mode = 0
[SCP] :wait arisc ready....
[SCP] :arisc version: [jorpotcevt-r-303rdna1dio1v-13-3.72g-16b0]
[SCP] :arisc startup ready
[SCP] :arisc startup notify message feedback
[SCP] :sunxi-arisc driver v1.10 is starting
[135]HELLO! BOOT0 is starting!
[138]BOOT0 commit : de956292
[142]set pll start
[144]set pll end
[146]ldob fix
[148]ldob cal: 0x2e0f
[150]prcm cpus timer clock enable
[154]board init ok
[156]rtc[2] value = 0xf
[158]rtc[3] value = 0xf4f48003
[162][mmc]: mmc driver ver 2021-07-13 11:09
[172][mmc]: Wrong media type 0x0
[176][mmc]: ***Try SD card 2***
[180][mmc]: mmc 2 cmd 8 timeout, err 100
[184][mmc]: mmc 2 cmd 8 err 100
[187][mmc]: mmc 2 send if cond failed
[192][mmc]: mmc 2 cmd 55 timeout, err 100
[197][mmc]: mmc 2 cmd 55 err 100
[200][mmc]: mmc 2 send app cmd failed
[204][mmc]: ***Try MMC card 2***
[300][mmc]: RMCA OK!
[302][mmc]: bias 4
[310][mmc]: MMC 5.1
[312][mmc]: HSSDR52/SDR25 8 bit
[315][mmc]: 50000000 Hz
[318][mmc]: 7456 MB
[320][mmc]: ***SD/MMC 2 init OK!!!***
[336]DRAM only have internal ZQ!!
[344]DRAM BOOT DRIVE INFO: V1.18
[347]DRAM CLK = 624 MHz
[350]DRAM Type = 3 (2:DDR2,3:DDR3)
[353]DRAMC ZQ value: 0x7b7bfb
[357]DRAM ODT value: 0x40
[361]DRAM index value: 0x1 0x1
[364]DRAM SIZE = 1024 M
[394]DRAM simple test OK.
[397]dram size =1024
[404]nsi init ok 2020-7-12
[407]card no is 2
[409]sdcard 2 line count 8
[412][mmc]: mmc driver ver 2021-07-13 11:09
[422][mmc]: ***Try MMC card 2***
[549][mmc]: RMCA OK!
[551][mmc]: bias 4
[557][mmc]: MMC 5.1
[559][mmc]: HSSDR52/SDR25 8 bit
[563][mmc]: 50000000 Hz
[565][mmc]: 7456 MB
[567][mmc]: ***SD/MMC 2 init OK!!!***
[713]Loading boot-pkg Succeed(index=0).
[718]Entry_name        = u-boot
[733]Entry_name        = monitor
[737]Entry_name        = scp
[744]Entry_name        = optee
[752]Entry_name        = dtb
[757]tunning data addr:0x4a0003e8
[760]Jump to second Boot.
NOTICE:  BL3-1: v1.0(debug):f6fd0d6
NOTICE:  BL3-1: Built : 10:11:47, 2024-05-22
NOTICE:  BL3-1 commit: 8
NOTICE:  secure os exist
E/TC:0 0 init_external_dt:1033 Device Tree missing
M/TC: OP-TEE version: a8294843 (gcc version 5.3.1 20160412 (Linaro GCC 5.3-2016.05)) #1 Sat Mar  9 10:48:25 UTC 2024 arm
NOTICE:  BL3-1: Preparing for EL3 exit to normal world
NOTICE:  BL3-1: Next image address = 0x4a000000
NOTICE:  BL3-1: Next image spsr = 0x1d3

U-Boot 2018.05-00027-ge159793 (Aug 15 2025 - 10:07:31 +0000) Allwinner Technology

[00.858]CPU:   Allwinner Family
[00.861]Model: sun50iw12
[00.863]DRAM:  1 GiB
[00.867]Relocation Offset is: 35f0e000
[00.894]secure enable bit: 0
E/TC:0   fdt_getprop_u32:336 prop trace_level not found
[00.911]CPU=1392 MHz,PLL6=600 Mhz,AHB=150 Mhz, APB1=100Mhz  MBus=400Mhz
[00.917]gic: sec monitor mode
[00.931]flash init start
[00.933]workmode = 0,storage type = 2
[00.937][mmc]: mmc driver ver uboot2018:2023-05-16 11:34:00 avoid-repeat-reset-host
[00.945][mmc]: get sdc2 sdc_dis_host_caps 0x180.
[00.949][mmc]: SUNXI SDMMC Controller Version:0x50400
[01.077][mmc]: Best spd md: 2-HSDDR52/DDR50, freq: 2-50000000, Bus width: 8
[01.083]sunxi flash init ok
zztest---usb power enable
unable to find pwm led node in device tree.
[01.093]Loading Environment from SUNXI_FLASH... OK
[01.108]usb burn from boot
delay time 0
weak:otg_phy_config
[01.118]usb prepare ok
[01.921]overtime
[01.924]do_burn_from_boot usb : no usb exist
zztest---get_prj_config_from_oem
[01.946]get file(prj_config.ini) size from media_data error
10 bytes read in 0 ms
zztest---prj_mode=0
zztst--mode = 0
Failed to get bl id property
Failed to get pwm_id property
zztest---fan power enable
zztest---fan power enable
secure storage read widevine fail
[02.001]secure storage read widevine fail with:-1
secure storage read ec_key fail
[02.008]secure storage read ec_key fail with:-1
15652 bytes read in 3 ms (5 MiB/s)
2764854 bytes read in 33 ms (79.9 MiB/s)
zztest--try to get panel_config.ini from /oem
[02.063]get file(panel_config.ini) size from media_data error
zztest--/oem/panel_config.ini is no exsists ,get panel_config.ini from Reserve0
2525 bytes read in 1 ms (2.4 MiB/s)
[02.080]LogRegData.bin version is 25-4-10-157
[02.085]Project id:0x34 version:25-1-6-3
[02.089]pwm_request: err: get reg-base err.
[02.093]pwm5 request for fastlogo fail!
1255696 bytes read in 17 ms (70.4 MiB/s)
display_bin addr: 0x7857b000 copy 0x4b100000, size: 0x132910
4743 bytes read in 2 ms (2.3 MiB/s)
display_cfg addr: 0x77f36000 copy 0x4be01000, size: 0x1287
[02.947]CWL  tse_id mips/ProjectID_0x0034.TSE
[02.953]get file(mips/database.TSE) size from media_data error
282464 bytes read in 5 ms (53.9 MiB/s)
mips/database.TSE addr: 0x786ae000 copy 0x4be41000, size: 0x44f60
[02.976]get file(mips/pq_custom.TSE) size from media_data error
15016 bytes read in 3 ms (4.8 MiB/s)
mips/pq_custom.TSE addr: 0x77f38000 copy 0x4be85f60, size: 0x3aa8
[02.996]get file(mips/projecttable.TSE) size from media_data error
1384 bytes read in 2 ms (675.8 KiB/s)
mips/projecttable.TSE addr: 0x77f3c000 copy 0x4be89a08, size: 0x568
[03.016]get file(mips/ProjectID_0x0034.TSE) size from media_data error
17304 bytes read in 2 ms (8.3 MiB/s)
mips/ProjectID_0x0034.TSE addr: 0x77f3d000 copy 0x4be89f70, size: 0x4398
[03.564]Display fastlogo finish!
List file under ULI/factory
** Unrecognized filesystem type **
[03.764]update part info
[03.958]update bootcmd
[03.963]change working_fdt 0x77ebde70 to 0x77e8de70
[03.968][mmc]: delete mmc-hs400-1_8v from dtb
[03.972][mmc]: delete mmc-hs200-1_8v from dtb
[03.979]## error: update_fdt_dram_para : FDT_ERR_NOTFOUND
[03.985]update dts
Hit any key to stop autoboot:  1  0 
zztest---add env prj_mode
zztest---get prj_mode=prj_mode=0
Android's image name: arm
[05.561]Starting kernel ...

[05.563][mmc]: mmc exit start
[05.687][mmc]: mmc 2 exit ok
[SCP] :wait arisc ready....
[SCP] :arisc version: [jorpotcevt-r-303rdna1dio1v-13-3.72g-16b0]
[SCP] :arisc startup ready
[SCP] :arisc startup notify message feedback
[SCP] :sunxi-arisc driver v1.10 is starting
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.4.99-00049-g34f0974adef4-dirty (hotack@dell-PowerEdge-R740) (arm-linux-gnueabi-gcc (Linaro GCC 5.3-2016.05) 5.3.1 20160412, GNU ld (Linaro_Binutils-2016.05) 2.25.0 Linaro 2016_02) #1006 SMP PREEMPT Mon Sep 22 09:29:12 CST 2025
[    0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7), cr=10c0383d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] OF: fdt: Machine model: sun50iw12
[    0.000000] printk: bootconsole [earlycon0] enabled
[    0.000000] OF: reserved mem: OVERLAP DETECTED!
[    0.000000] mipsloader (0x4b100000--0x4d941000) overlaps with framebuf (0x4bf41000--0x4d941000)
[    0.006477] BOOTEVENT:         6.470164: ON
[    0.087147] sunxi-msgbox-amp 3003000.msgbox: invalid resource
[    0.095246] sunxi_pwm_probe: can't get pwm  bus clk
[    0.452034] uart uart0: get regulator failed
[    0.457355] uart uart1: get regulator failed
[    0.479071] mipsloader 3061000.mipsloader: request pins failed: -19
[    0.487468] motor-control motor_ctr: failed to get property limiter-gpio
[    0.496048] Failed to read array length
[    0.505943] sunxi_key_init: get key count failed
[    0.505949] sunxi_gpadc_setup: get channel compare select failed
[    0.517931] sunxi_gpadc_setup: get channel compare low data select failed
[    0.525673] sunxi_gpadc_setup: get channel compare hig data select failed
[    0.533248] sunxi_gpadc_setup: get channel scan data failed
[    0.539466] sunxi_gpadc_setup:get channel0_compare_lowdata err!
[    0.546071] sunxi_gpadc_setup:get channel0_compare_higdata err!
[    0.552676] sunxi_gpadc_setup:get channel1_compare_lowdata err!
[    0.559281] sunxi_gpadc_setup:get channel1_compare_higdata err!
[    0.569107] sunxi_ir_startup: get ir protocol failed
[    0.634150] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 52, RTO !!
[    0.641805] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 52, RTO !!
[    0.652245] [AUDIOCODEC][sunxi_codec_parse_params][1905]:adcdrc_used:0, adchpf_used:0, dacdrc_used:0, dachpf_used:0
[    0.652245] 
[    0.665958] debugfs: Directory '2030000.codec' with parent 'regmap' already present!
[    0.666380] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 5, RTO !!
[    0.682063] debugfs: Directory '203032c.dummy_cpudai' with parent 'audiocodec' already present!
[    0.682109] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 5, RTO !!
[    0.699279] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 5, RTO !!
[    0.706855] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 5, RTO !!
[    0.714362] sunxi-mmc 4022000.sdmmc: avoid to switch power_off_notification to POWERED_ON(0x01)
[    0.724101] sunxi-mmc 4022000.sdmmc: avoid to switch power_off_notification to POWERED_ON(0x01)
[    0.733810] sunxi-mmc 4022000.sdmmc: avoid to switch power_off_notification to POWERED_ON(0x01)
[    0.733815] sunxi-mmc 4022000.sdmmc: avoid to switch power_off_notification to POWERED_ON(0x01)
[    0.775836] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0x69)
[    0.785544] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0x69)
[    0.795105] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0x69)
[    0.804665] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0x69)
[    0.814243] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0x69)
[    0.833800] [stkAccel] kxt_parse_dt/1108: Unable to read kxtj3,irq-gpio
[    0.841436] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0xe)
[    0.850952] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0xe)
[    0.860468] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0xe)
[    0.870098] sunxi_twi_do_xfer()1808 - [twi1] incomplete xfer (status: 0x20, dev addr: 0xe)
[    0.879326] [stkAccel] kxt_i2c_probe/1275: kxtj3 initialization failed
[    0.889497] incorrect key number.
[    0.966810] debugfs: Directory 'sunxi-ehci' with parent 'ehci' already present!
[    1.041473] debugfs: Directory 'sunxi-ohci' with parent 'ohci' already present!
[    1.119312] cpu cpu0: dev_pm_opp_set_rate: failed to find current OPP for freq 1392000000 (-34)
[    1.143931] sunxi-audio-card 203705c.soundowa1: use dummy codec for simple card.
[    1.152355] debugfs: Directory '2037000.owa' with parent 'sndowa1' already present!
[    1.162611] sunxi-audio-card 203207c.sounddaudio0: use dummy codec for simple card.
[    1.171309] debugfs: Directory '2032000.daudio' with parent 'snddaudio0' already present!
[    1.181908] sunxi-audio-card 203307c.sounddaudio0: use dummy codec for simple card.
[    1.190600] debugfs: Directory '2033000.daudio' with parent 'snddaudio1' already present!
[    1.205847] get_key_map_info()199 - Failed to find "oe" in dts.
[    1.212697] [ac200] get ave_regulator_name failed!
[    1.218716] [ac200] pwm enable
[    1.239141] Kernel init done
[    1.365627] init: [libfs_mgr]not access /system/bin/fsck_msdos
[    1.374642] logwrapper: executing /system/bin/fsck_msdos failed: No such file or directory
[    1.384066] logwrapper: 
[    1.390721] logwrapper: Cannot log to file /dev/fscklogs/log
[    1.397322] logwrapper: 
[    1.456558] logwrapper: executing /system/bin/newfs_msdos failed: No such file or directory
[    1.465922] logwrapper: 
[    1.474653] logwrapper: executing /system/bin/newfs_msdos failed: No such file or directory
[    1.484023] logwrapper: 
[    1.890362] init: Could not update logical partition
[    2.552651] init: Could not set 'ro.boot.dynamic_partitions' to 'true' while loading .prop filesRead-only property was already set
[    2.565808] init: Could not set 'ro.boot.dynamic_partitions_retrofit' to 'true' while loading .prop filesRead-only property was already set
[    2.729158] cgroup1: Unknown subsys name 'blkio'
[    2.734415] libprocessgroup: Failed to mount blkio cgroup: Invalid argument
[    2.743853] libprocessgroup: Failed to mount cpuset cgroup: No such device
[    2.753327] cgroup1: Unknown subsys name 'schedtune'
[    2.758939] libprocessgroup: Failed to mount schedtune cgroup: Invalid argument
[    3.108951] sunxi-rfkill soc@2900000:rfkill: get gpio chip_en failed
[    3.116317] sunxi-rfkill soc@2900000:rfkill: get gpio power_en failed
console:/ $ [    3.900144] debugfs: Directory '1800000.gpu-gpu' with parent 'vdd_sys' already present!
[    3.912965] mali 1800000.gpu: Sunxi_data->dvfs_status is false, continuing without devfreq
[    3.936290] invalid gpio:-2!
[    3.939698] invalid gpio:-2!
[    3.948317] invalid gpio:-2!
[    3.951892] platform 2000c15.pwm5: pinctrl_get failed!
[    3.996015] sunxi-pm-domain 7001000.power-management:power-controller: failed to set domain 'pd_tvcap', val=0
[    4.023373] LogRegData.bin version is 25-4-10-157
[    4.028662] Project id:0x34 version:25-1-6-3
[    4.028713] ge2d 5240000.ge2d: firmware downloaded!
[    4.250762] init: [libfs_mgr]fs_mgr_do_resize: Reszie /dev/block/by-name/userdata as '0'
[    4.361025] pMemInBuffer[0]=0xc3419ac0 pMemInBuffer[0]->bufStart=0x436a0000
[    4.368874] pMemInBuffer[1]=0xc3419b00 pMemInBuffer[1]->bufStart=0x436c0000
[    4.376764] pMemInBuffer[2]=0xc3419b40 pMemInBuffer[2]->bufStart=0x436e0000
[    4.384582] pMemInBuffer[3]=0xc3419b80 pMemInBuffer[3]->bufStart=0x43700000
[    4.392406] [AudBrg_Init] --> audio bridge irq num: 38
[    4.398353] [ABP_DTV_Init] --> abp_dtv irq num: 39
[    4.403820] audiobridge alloc size: 0x160000
[    4.409291] audiobridge ion_alloc success!
[    4.414003] audiobridge ion alloc success, and phy_addr: 0x0
[    4.420327] audiobridge:247 audbrg_istream_ConfigMemMap() ISTREAM1 phy_addr=0x0 vir_addr=0xf0ec2000
[    4.430429] audiobridge:258 audbrg_istream_ConfigMemMap() ISTREAM2 phy_addr=0x10000 vir_addr=0xf0ed2000
[    4.440920] audiobridge:269 audbrg_istream_ConfigMemMap() ISTREAM3 phy_addr=0x20000 vir_addr=0xf0ee2000
[    4.451403] audiobridge:280 audbrg_istream_ConfigMemMap() ISTREAM4 phy_addr=0x30000 vir_addr=0xf0ef2000
[    4.461888] audiobridge:155 audbrg_ostream_ConfigMemMap() OSTREAM1 phy_addr=0x40000 vir_addr=0xf0f02000
[    4.472412] audiobridge:166 audbrg_ostream_ConfigMemMap() OSTREAM2 phy_addr=0x50000 vir_addr=0xf0f12000
[    4.482909] audiobridge:232 audbrg_delayline_ConfigMemMap() DELAYLINE1 phy_addr=0x60000 vir_addr=0xf0f22000
[    4.493784] audiobridge:246 audbrg_delayline_ConfigMemMap() DELAYLINE2 phy_addr=0xa0000 vir_addr=0xf0f62000
[    4.504659] audiobridge:260 audbrg_delayline_ConfigMemMap() DELAYLINE3 phy_addr=0xe0000 vir_addr=0xf0fa2000
[    4.515539] audiobridge:274 audbrg_delayline_ConfigMemMap() DELAYLINE4 phy_addr=0x120000 vir_addr=0xf0fe2000
[    5.673946] pinctrl_get for allwinner,sunxi-pwm fail
[    6.829419] init: Could not start service 'bleaudiod' as part of class 'core': Cannot find '/system/bin/bleaudiod': No such file or directory
[    7.748906] regulator-dummy: Underflow of regulator enable count
[    7.755968] regulator-dummy: Underflow of regulator enable count
[    8.915714] init: Could not start service 'iosmain' as part of class 'main': Cannot find '/system/bin/iosmain': No such file or directory
[   10.602072] init: Could not start service 'vendor_flash_recovery' as part of class 'main': Cannot find '/vendor/bin/install-recovery.sh': No such file or directory
[   10.692534] init: Control message: Could not find 'android.hardware.camera.provider@2.4::ICameraProvider/legacy/0' for ctl.interface_start from pid: 2192 (/system/bin/hwservicemanager)
[   18.878472] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 52, RTO !!
[   18.886131] sunxi-mmc 4021000.sdmmc: smc 1 p1 err, cmd 52, RTO !!
[   19.962827] aicbsp: err:<aicwf_sdio_bus_pwrctl,1260>: bus down
[   77.308142] sunxi_pwm_enable_dual: can't parse pwm device
[   81.031583] init: Unable to set property 'ctl.interface_start' from uid:1000 gid:1000 pid:2192: Received control message after shutdown, ignoring
[   81.061320] init: Unable to set property 'ctl.interface_start' from uid:1000 gid:1000 pid:2192: Received control message after shutdown, ignoring
[   81.085607] init: Unable to set property 'ctl.interface_start' from uid:1000 gid:1000 pid:2192: Received control message after shutdown, ignoring
[   81.154882] init: Unable to set property 'ctl.interface_start' from uid:1000 gid:1000 pid:2192: Received control message after shutdown, ignoring
[   81.171004] init: Unable to set property 'ctl.interface_start' from uid:1000 gid:1000 pid:2192: Received control message after shutdown, ignoring
[   81.567904] libprocessgroup: Failed to kill process cgroup uid 0 pid 2610 in 258ms, 1 processes remain
[   81.994428] regulator-dummy: Underflow of regulator enable count
[   86.713908] sysrq: Kill All Tasks
[   86.722943] init: Unmounting /dev/block/by-name/userdata:/data opts rw,lazytime,seclabel,nosuid,nodev,noatime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,reserve_root=45199,resuid=0,resgid=1065,alloc_mode=reuse,fsync_mode=posix
[   87.239708] init: Umounted /dev/block/by-name/userdata:/data opts rw,lazytime,seclabel,nosuid,nodev,noatime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,reserve_root=45199,resuid=0,resgid=1065,alloc_mode=reuse,fsync_mode=posix
[   87.276154] init: sync() after umount...
[   87.280884] init: sync() after umount took4ms
[   87.386785] init: powerctl_shutdown_time_ms:6739:2
[   87.392441] init: Reboot ending, jumping to kernel
[   87.392576] init: remaining_shutdown_time: 299
[   87.417929] reboot_callback(): empty arg
[   87.434935] ge2d 5240000.ge2d: acquire tvdisp clock on emergency shutdown
[   87.939108] Invalid pin
[   87.941843] Invalid pin
[   87.944587] Invalid pin
[   87.947334] ge2d 5240000.ge2d: ge2d suspend
[   87.952143] [ohci2-controller]: ohci shutdown start
[   87.957610] [ohci2-controller]: ohci shutdown end
[   87.962878] [ohci1-controller]: ohci shutdown start
[   87.968333] [ohci1-controller]: ohci shutdown end
[   87.973589] sunxi_ohci_hcd_shutdown, ohci0-controller is disable, need not shutdown
[   87.982158] [ehci2-controller]: ehci shutdown start
[   87.987609] [ehci2-controller]: ehci shutdown end
[   87.992875] [ehci1-controller]: ehci shutdown start
[   87.998366] [ehci1-controller]: ehci shutdown end
[   88.003624] sunxi_ehci_hcd_shutdown, ehci0-controller is disable, need not shutdown
[   88.019647] sunxi-mmc 4022000.sdmmc: sdc set ios:clk 0Hz bm PP pm OFF vdd 0 width 1 timing LEGACY(SDR12) dt B
[   88.199289] reboot: Power down
[316]HELLO! BOOT0 is starting!
[320]BOOT0 commit : de956292
[323]set pll start
[326]set pll end
[327]ldob fix
[329]ldob cal: 0x2e0f
[331]prcm cpus timer clock enable
[335]board init ok
[337]rtc[2] value = 0x2
[340]rtc[3] value = 0xa102
[343]rtc[4] value = 0xf
[345][mmc]: mmc driver ver 2021-07-13 11:09
[356][mmc]: Wrong media type 0x0
[359][mmc]: ***Try SD card 2***
[363][mmc]: mmc 2 cmd 8 timeout, err 100
[367][mmc]: mmc 2 cmd 8 err 100
[371][mmc]: mmc 2 send if cond failed
[375][mmc]: mmc 2 cmd 55 timeout, err 100
[380][mmc]: mmc 2 cmd 55 err 100
[383][mmc]: mmc 2 send app cmd failed
[387][mmc]: ***Try MMC card 2***
[489][mmc]: RMCA OK!
[491][mmc]: bias 4
[499][mmc]: MMC 5.1
[501][mmc]: HSSDR52/SDR25 8 bit
[504][mmc]: 50000000 Hz
[507][mmc]: 7456 MB
[509][mmc]: ***SD/MMC 2 init OK!!!***
[524]DRAM only have internal ZQ!!
[533]DRAM BOOT DRIVE INFO: V1.18
[536]DRAM CLK = 624 MHz
[539]DRAM Type = 3 (2:DDR2,3:DDR3)
[542]DRAMC ZQ value: 0x7b7bfb
[546]DRAM ODT value: 0x40
[550]DRAM index value: 0x1 0x1
[553]DRAM SIZE = 1024 M
[583]DRAM simple test OK.
[586]dram size =1024
[593]nsi init ok 2020-7-12
[596]card no is 2
[598]sdcard 2 line count 8
[601][mmc]: mmc driver ver 2021-07-13 11:09
[611][mmc]: ***Try MMC card 2***
[743][mmc]: RMCA OK!
[746][mmc]: bias 4
[752][mmc]: MMC 5.1
[754][mmc]: HSSDR52/SDR25 8 bit
[757][mmc]: 50000000 Hz
[760][mmc]: 7456 MB
[762][mmc]: ***SD/MMC 2 init OK!!!***
[908]Loading boot-pkg Succeed(index=0).
[912]Entry_name        = u-boot
[927]Entry_name        = monitor
[932]Entry_name        = scp
[938]Entry_name        = optee
[947]Entry_name        = dtb
[951]tunning data addr:0x4a0003e8
[955]Jump to second Boot.
NOTICE:  BL3-1: v1.0(debug):f6fd0d6
NOTICE:  BL3-1: Built : 10:11:47, 2024-05-22
NOTICE:  BL3-1 commit: 8
NOTICE:  secure os exist
E/TC:0 0 init_external_dt:1033 Device Tree missing
M/TC: OP-TEE version: a8294843 (gcc version 5.3.1 20160412 (Linaro GCC 5.3-2016.05)) #1 Sat Mar  9 10:48:25 UTC 2024 arm
NOTICE:  BL3-1: Preparing for EL3 exit to normal world
NOTICE:  BL3-1: Next image address = 0x4a000000
NOTICE:  BL3-1: Next image spsr = 0x1d3

U-Boot 2018.05-00027-ge159793 (Aug 15 2025 - 10:07:31 +0000) Allwinner Technology

[01.053]CPU:   Allwinner Family
[01.056]Model: sun50iw12
[01.058]DRAM:  1 GiB
[01.063]Relocation Offset is: 35f0e000
[01.090]secure enable bit: 0
E/TC:0   fdt_getprop_u32:336 prop trace_level not found
[01.107]CPU=1392 MHz,PLL6=600 Mhz,AHB=150 Mhz, APB1=100Mhz  MBus=400Mhz
[01.113]gic: sec monitor mode
[01.127]flash init start
[01.129]workmode = 0,storage type = 2
[01.132][mmc]: mmc driver ver uboot2018:2023-05-16 11:34:00 avoid-repeat-reset-host
[01.141][mmc]: get sdc2 sdc_dis_host_caps 0x180.
[01.145][mmc]: SUNXI SDMMC Controller Version:0x50400
[01.278][mmc]: Best spd md: 2-HSDDR52/DDR50, freq: 2-50000000, Bus width: 8
[01.284]sunxi flash init ok
zztest---usb power enable
unable to find pwm led node in device tree.
[01.294]Loading Environment from SUNXI_FLASH... OK
[01.309]usb burn from boot
delay time 0
weak:otg_phy_config
[01.319]usb prepare ok
[02.122]overtime
[02.125]do_burn_from_boot usb : no usb exist
resetting USB...
[02.131]USB0:   start sunxi  USB-DRD...
config usb clk ok
sunxi USB-DRD init ok...
USB EHCI 1.00
scanning bus 0 for devices... 1 USB Device(s) found
[02.581]USB1:   start sunxi  USB1-Host...
config usb clk ok
sunxi USB1-Host init ok...
USB EHCI 1.00
scanning bus 1 for devices... 1 USB Device(s) found
[03.032]scanning usb for storage devices... 0 Storage Device(s) found
** Bad device usb 0 **
** Bad device usb 0 **
zztest---get_prj_config_from_oem
[03.063]get file(prj_config.ini) size from media_data error
10 bytes read in 0 ms
zztest---prj_mode=0
zztst--mode = 0
[SCP] :wait arisc ready....
[SCP] :arisc version: [jorpotcevt-r-303rdna1dio1v-13-3.72g-16b0]
[SCP] :arisc startup ready
[SCP] :arisc startup notify message feedback
[SCP] :sunxi-arisc driver v1.10 is starting
 
[17:42:23.762] Disconnected
