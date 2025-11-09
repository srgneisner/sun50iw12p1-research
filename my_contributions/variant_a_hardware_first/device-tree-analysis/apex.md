# Directory: apex

This file contains the complete directory tree for `/apex` extracted from the HY300 device.

**Generated:** 2025-11-08  
**Source:** `FullDir.xml`  
**Items:** 553 files, 84 subdirectories  
**Type:** Directory

---

## Tree Structure

```
├── apex/ (drwxr-xr-x)
  ├── com.android.adbd/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── bin/ (drwxr-x--x)
      ├── adbd
    ├── etc/ (drwxr-xr-x)
      ├── init.rc
    ├── lib/ (drwxr-xr-x)
      ├── libadb_pairing_auth.so
      ├── libadb_pairing_connection.so
      ├── libadb_pairing_server.so
      ├── libadb_protos.so
      ├── libadbconnection_client.so
      ├── libbase.so
      ├── libc++.so
      ├── libcrypto.so
      ├── libcrypto_utils.so
      ├── libcutils.so
      ├── libprotobuf-cpp-lite.so
  ├── com.android.art/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── bin/ (drwxr-x--x)
      ├── dalvikvm
      ├── dalvikvm32
      ├── dex2oat32
      ├── dexdump
      ├── dexlist
      ├── dexoptanalyzer
      ├── oatdump
      ├── profman
    ├── etc/ (drwxr-xr-x)
      ├── ld.config.txt
    ├── javalib/ (drwxr-xr-x)
      ├── apache-xml.jar
      ├── arm/ (drwxr-xr-x)
        ├── boot-apache-xml.art
        ├── boot-apache-xml.oat
        ├── boot-apache-xml.vdex
        ├── boot-bouncycastle.art
        ├── boot-bouncycastle.oat
        ├── boot-bouncycastle.vdex
        ├── boot-core-icu4j.art
        ├── boot-core-icu4j.oat
        ├── boot-core-icu4j.vdex
        ├── boot-core-libart.art
        ├── boot-core-libart.oat
        ├── boot-core-libart.vdex
        ├── boot-okhttp.art
        ├── boot-okhttp.oat
        ├── boot-okhttp.vdex
        ├── boot.art
        ├── boot.oat
        ├── boot.vdex
      ├── bouncycastle.jar
      ├── core-icu4j.jar
      ├── core-libart.jar
      ├── core-oj.jar
      ├── okhttp.jar
    ├── lib/ (drwxr-xr-x)
      ├── libadbconnection.so
      ├── libandroidicu.so
      ├── libandroidio.so
      ├── libart-compiler.so
      ├── libart-dexlayout.so
      ├── libart-disassembler.so
      ├── libart.so
      ├── libartbase.so
      ├── libartpalette.so
      ├── libbacktrace.so
      ├── libbase.so
      ├── libc++.so
      ├── libcrypto.so
      ├── libdexfile.so
      ├── libdexfile_external.so
      ├── libdexfile_support.so
      ├── libdt_fd_forward.so
      ├── libdt_socket.so
      ├── libexpat.so
      ├── libicu_jni.so
      ├── libicui18n.so
      ├── libicuuc.so
      ├── libjavacore.so
      ├── libjdwp.so
      ├── liblzma.so
      ├── libnativebridge.so
      ├── libnativehelper.so
      ├── libnativeloader.so
      ├── libnpt.so
      ├── libopenjdk.so
      ├── libopenjdkjvm.so
      ├── libopenjdkjvmti.so
      ├── libpac.so
      ├── libperfetto_hprof.so
      ├── libprofile.so
      ├── libsigchain.so
      ├── libunwindstack.so
      ├── libvixl.so
      ├── libz.so
      ├── libziparchive.so
  ├── com.android.conscrypt/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── bin/ (drwxr-x--x)
      ├── boringssl_self_test32
    ├── etc/ (drwxr-xr-x)
      ├── ld.config.txt
    ├── javalib/ (drwxr-xr-x)
      ├── conscrypt.jar
    ├── lib/ (drwxr-xr-x)
      ├── libc++.so
      ├── libcrypto.so
      ├── libjavacrypto.so
      ├── libssl.so
  ├── com.android.extservices/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── priv-app/ (drwxr-xr-x)
      ├── ExtServices/ (drwxr-xr-x)
        ├── ExtServices.apk
  ├── com.android.i18n/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── etc/ (drwxr-xr-x)
      ├── icu/ (drwxr-xr-x)
        ├── icudt66l.dat
  ├── com.android.ipsec/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── etc/ (drwxr-xr-x)
      ├── permissions/ (drwxr-xr-x)
        ├── android.net.ipsec.ike.xml
    ├── javalib/ (drwxr-xr-x)
      ├── android.net.ipsec.ike.jar
  ├── com.android.media/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── etc/ (drwxr-xr-x)
      ├── seccomp_policy/ (drwxr-xr-x)
        ├── code_coverage.arm.policy
        ├── crash_dump.arm.policy
        ├── mediaextractor.policy
    ├── javalib/ (drwxr-xr-x)
      ├── updatable-media.jar
    ├── lib/ (drwxr-xr-x)
      ├── extractors/ (drwxr-xr-x)
        ├── libaacextractor.so
        ├── libamrextractor.so
        ├── libflacextractor.so
        ├── libmidiextractor.so
        ├── libmkvextractor.so
        ├── libmp3extractor.so
        ├── libmp4extractor.so
        ├── libmpeg2extractor.so
        ├── liboggextractor.so
        ├── libwavextractor.so
      ├── libaudioutils.so
      ├── libbase.so
      ├── libc++.so
      ├── libcutils.so
      ├── libspeexresampler.so
      ├── libstagefright_flacdec.so
  ├── com.android.media.swcodec/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── bin/ (drwxr-x--x)
      ├── mediaswcodec
    ├── etc/ (drwxr-xr-x)
      ├── init.rc
      ├── ld.config.txt
      ├── media_codecs.xml
      ├── seccomp_policy/ (drwxr-xr-x)
        ├── code_coverage.arm.policy
        ├── crash_dump.arm.policy
        ├── mediaswcodec.policy
    ├── lib/ (drwxr-xr-x)
      ├── android.hardware.common-V1-ndk_platform.so
      ├── android.hardware.graphics.allocator@2.0.so
      ├── android.hardware.graphics.allocator@3.0.so
      ├── android.hardware.graphics.allocator@4.0.so
      ├── android.hardware.graphics.bufferqueue@1.0.so
      ├── android.hardware.graphics.bufferqueue@2.0.so
      ├── android.hardware.graphics.common-V1-ndk_platform.so
      ├── android.hardware.graphics.common@1.0.so
      ├── android.hardware.graphics.common@1.1.so
      ├── android.hardware.graphics.common@1.2.so
      ├── android.hardware.graphics.mapper@2.0.so
      ├── android.hardware.graphics.mapper@2.1.so
      ├── android.hardware.graphics.mapper@3.0.so
      ├── android.hardware.graphics.mapper@4.0.so
      ├── android.hardware.media.bufferpool@2.0.so
      ├── android.hardware.media.c2@1.0.so
      ├── android.hardware.media.c2@1.1.so
      ├── android.hardware.media.omx@1.0.so
      ├── android.hardware.media@1.0.so
      ├── android.hidl.memory.token@1.0.so
      ├── android.hidl.memory@1.0.so
      ├── android.hidl.safe_union@1.0.so
      ├── android.hidl.token@1.0-utils.so
      ├── android.hidl.token@1.0.so
      ├── libaudioutils.so
      ├── libavservices_minijail.so
      ├── libbase.so
      ├── libc++.so
      ├── libcap.so
      ├── libcodec2.so
      ├── libcodec2_hidl@1.0.so
      ├── libcodec2_hidl@1.1.so
      ├── libcodec2_soft_aacdec.so
      ├── libcodec2_soft_aacenc.so
      ├── libcodec2_soft_amrnbdec.so
      ├── libcodec2_soft_amrnbenc.so
      ├── libcodec2_soft_amrwbdec.so
      ├── libcodec2_soft_amrwbenc.so
      ├── libcodec2_soft_av1dec_gav1.so
      ├── libcodec2_soft_avcdec.so
      ├── libcodec2_soft_avcenc.so
      ├── libcodec2_soft_common.so
      ├── libcodec2_soft_flacdec.so
      ├── libcodec2_soft_flacenc.so
      ├── libcodec2_soft_g711alawdec.so
      ├── libcodec2_soft_g711mlawdec.so
      ├── libcodec2_soft_gsmdec.so
      ├── libcodec2_soft_h263dec.so
      ├── libcodec2_soft_h263enc.so
      ├── libcodec2_soft_hevcdec.so
      ├── libcodec2_soft_hevcenc.so
      ├── libcodec2_soft_mp3dec.so
      ├── libcodec2_soft_mpeg2dec.so
      ├── libcodec2_soft_mpeg4dec.so
      ├── libcodec2_soft_mpeg4enc.so
      ├── libcodec2_soft_opusdec.so
      ├── libcodec2_soft_opusenc.so
      ├── libcodec2_soft_rawdec.so
      ├── libcodec2_soft_vorbisdec.so
      ├── libcodec2_soft_vp8dec.so
      ├── libcodec2_soft_vp8enc.so
      ├── libcodec2_soft_vp9dec.so
      ├── libcodec2_soft_vp9enc.so
      ├── libcodec2_vndk.so
      ├── libcutils.so
      ├── libfmq.so
      ├── libgralloctypes.so
      ├── libhardware.so
      ├── libhidlbase.so
      ├── libhidlmemory.so
      ├── libion.so
      ├── libmedia_codecserviceregistrant.so
      ├── libminijail.so
      ├── libopus.so
      ├── libprocessgroup.so
      ├── libsfplugin_ccodec_utils.so
      ├── libspeexresampler.so
      ├── libstagefright_amrnb_common.so
      ├── libstagefright_bufferpool@2.0.1.so
      ├── libstagefright_bufferqueue_helper.so
      ├── libstagefright_enc_common.so
      ├── libstagefright_flacdec.so
      ├── libstagefright_foundation.so
      ├── libui.so
      ├── libutils.so
      ├── libvpx.so
  ├── com.android.mediaprovider/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── etc/ (drwxr-xr-x)
      ├── compatconfig/ (drwxr-xr-x)
        ├── media-provider-platform-compat-config.xml
    ├── javalib/ (drwxr-xr-x)
      ├── framework-mediaprovider.jar
    ├── priv-app/ (drwxr-xr-x)
      ├── MediaProvider/ (drwxr-xr-x)
        ├── MediaProvider.apk
  ├── com.android.neuralnetworks/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── lib/ (drwxr-xr-x)
      ├── libneuralnetworks.so
  ├── com.android.os.statsd/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── bin/ (drwxr-x--x)
      ├── statsd
    ├── etc/ (drwxr-xr-x)
      ├── init.rc
    ├── javalib/ (drwxr-xr-x)
      ├── framework-statsd.jar
      ├── service-statsd.jar
    ├── lib/ (drwxr-xr-x)
      ├── libstats_jni.so
      ├── libstatspull.so
      ├── libstatssocket.so
  ├── com.android.permission/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── javalib/ (drwxr-xr-x)
      ├── framework-permission.jar
      ├── service-permission.jar
    ├── priv-app/ (drwxr-xr-x)
      ├── PermissionController/ (drwxr-xr-x)
        ├── PermissionController.apk
  ├── com.android.resolv/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── lib/ (drwxr-xr-x)
      ├── libcrypto.so
      ├── libnetd_resolv.so
      ├── libssl.so
  ├── com.android.runtime/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── bin/ (drwxr-x--x)
      ├── linker
      ├── linker_asan
    ├── lib/ (drwxr-xr-x)
      ├── bionic/ (drwxr-xr-x)
        ├── libc.so
        ├── libdl.so
        ├── libdl_android.so
        ├── libm.so
      ├── ld-android.so
      ├── libbase.so
      ├── libc++.so
      ├── libc_malloc_debug.so
      ├── libc_malloc_hooks.so
      ├── libdexfile_support.so
      ├── liblzma.so
      ├── libunwindstack.so
  ├── com.android.sdkext/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── bin/ (drwxr-x--x)
      ├── derive_sdk
    ├── etc/ (drwxr-xr-x)
      ├── derive_sdk.rc
      ├── sdkinfo.binarypb
    ├── javalib/ (drwxr-xr-x)
      ├── framework-sdkextensions.jar
  ├── com.android.tethering/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── javalib/ (drwxr-xr-x)
      ├── framework-tethering.jar
    ├── priv-app/ (drwxr-xr-x)
      ├── InProcessTethering/ (drwxr-xr-x)
        ├── InProcessTethering.apk
  ├── com.android.tzdata/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── etc/ (drwxr-xr-x)
      ├── icu/ (drwxr-xr-x)
        ├── icu_tzdata.dat
      ├── tz/ (drwxr-xr-x)
        ├── telephonylookup.xml
        ├── tz_version
        ├── tzdata
        ├── tzlookup.xml
  ├── com.android.vndk.v30/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── etc/ (drwxr-xr-x)
      ├── llndk.libraries.30.txt
      ├── vndkcore.libraries.30.txt
      ├── vndkprivate.libraries.30.txt
      ├── vndksp.libraries.30.txt
    ├── lib/ (drwxr-xr-x)
      ├── android.frameworks.automotive.display@1.0.so
      ├── android.frameworks.cameraservice.common@2.0.so
      ├── android.frameworks.cameraservice.device@2.0.so
      ├── android.frameworks.cameraservice.service@2.0.so
      ├── android.frameworks.cameraservice.service@2.1.so
      ├── android.frameworks.displayservice@1.0.so
      ├── android.frameworks.schedulerservice@1.0.so
      ├── android.frameworks.sensorservice@1.0.so
      ├── android.frameworks.stats@1.0.so
      ├── android.hardware.atrace@1.0.so
      ├── android.hardware.audio.common@2.0.so
      ├── android.hardware.audio.common@4.0.so
      ├── android.hardware.audio.common@5.0.so
      ├── android.hardware.audio.common@6.0.so
      ├── android.hardware.audio.effect@2.0.so
      ├── android.hardware.audio.effect@4.0.so
      ├── android.hardware.audio.effect@5.0.so
      ├── android.hardware.audio.effect@6.0.so
      ├── android.hardware.audio@2.0.so
      ├── android.hardware.audio@4.0.so
      ├── android.hardware.audio@5.0.so
      ├── android.hardware.audio@6.0.so
      ├── android.hardware.authsecret@1.0.so
      ├── android.hardware.automotive.audiocontrol@1.0.so
      ├── android.hardware.automotive.audiocontrol@2.0.so
      ├── android.hardware.automotive.can@1.0.so
      ├── android.hardware.automotive.evs@1.0.so
      ├── android.hardware.automotive.evs@1.1.so
      ├── android.hardware.automotive.occupant_awareness-V1-ndk_platform.so
      ├── android.hardware.automotive.sv@1.0.so
      ├── android.hardware.automotive.vehicle@2.0.so
      ├── android.hardware.biometrics.face@1.0.so
      ├── android.hardware.biometrics.fingerprint@2.1.so
      ├── android.hardware.biometrics.fingerprint@2.2.so
      ├── android.hardware.bluetooth.a2dp@1.0.so
      ├── android.hardware.bluetooth.audio@2.0.so
      ├── android.hardware.bluetooth@1.0.so
      ├── android.hardware.bluetooth@1.1.so
      ├── android.hardware.boot@1.0.so
      ├── android.hardware.boot@1.1.so
      ├── android.hardware.broadcastradio@1.0.so
      ├── android.hardware.broadcastradio@1.1.so
      ├── android.hardware.broadcastradio@2.0.so
      ├── android.hardware.camera.common@1.0.so
      ├── android.hardware.camera.device@1.0.so
      ├── android.hardware.camera.device@3.2.so
      ├── android.hardware.camera.device@3.3.so
      ├── android.hardware.camera.device@3.4.so
      ├── android.hardware.camera.device@3.5.so
      ├── android.hardware.camera.device@3.6.so
      ├── android.hardware.camera.metadata@3.2.so
      ├── android.hardware.camera.metadata@3.3.so
      ├── android.hardware.camera.metadata@3.4.so
      ├── android.hardware.camera.metadata@3.5.so
      ├── android.hardware.camera.provider@2.4.so
      ├── android.hardware.camera.provider@2.5.so
      ├── android.hardware.camera.provider@2.6.so
      ├── android.hardware.cas.native@1.0.so
      ├── android.hardware.cas@1.0.so
      ├── android.hardware.cas@1.1.so
      ├── android.hardware.cas@1.2.so
      ├── android.hardware.common-V1-ndk_platform.so
      ├── android.hardware.configstore-utils.so
      ├── android.hardware.configstore@1.0.so
      ├── android.hardware.configstore@1.1.so
      ├── android.hardware.confirmationui-support-lib.so
      ├── android.hardware.confirmationui@1.0.so
      ├── android.hardware.contexthub@1.0.so
      ├── android.hardware.contexthub@1.1.so
      ├── android.hardware.drm@1.0.so
      ├── android.hardware.drm@1.1.so
      ├── android.hardware.drm@1.2.so
      ├── android.hardware.drm@1.3.so
      ├── android.hardware.dumpstate@1.0.so
      ├── android.hardware.dumpstate@1.1.so
      ├── android.hardware.fastboot@1.0.so
      ├── android.hardware.gatekeeper@1.0.so
      ├── android.hardware.gnss.measurement_corrections@1.0.so
      ├── android.hardware.gnss.measurement_corrections@1.1.so
      ├── android.hardware.gnss.visibility_control@1.0.so
      ├── android.hardware.gnss@1.0.so
      ├── android.hardware.gnss@1.1.so
      ├── android.hardware.gnss@2.0.so
      ├── android.hardware.gnss@2.1.so
      ├── android.hardware.graphics.allocator@2.0.so
      ├── android.hardware.graphics.allocator@3.0.so
      ├── android.hardware.graphics.allocator@4.0.so
      ├── android.hardware.graphics.bufferqueue@1.0.so
      ├── android.hardware.graphics.bufferqueue@2.0.so
      ├── android.hardware.graphics.common-V1-ndk_platform.so
      ├── android.hardware.graphics.common@1.0.so
      ├── android.hardware.graphics.common@1.1.so
      ├── android.hardware.graphics.common@1.2.so
      ├── android.hardware.graphics.composer@2.1.so
      ├── android.hardware.graphics.composer@2.2.so
      ├── android.hardware.graphics.composer@2.3.so
      ├── android.hardware.graphics.composer@2.4.so
      ├── android.hardware.graphics.mapper@2.0.so
      ├── android.hardware.graphics.mapper@2.1.so
      ├── android.hardware.graphics.mapper@3.0.so
      ├── android.hardware.graphics.mapper@4.0.so
      ├── android.hardware.health.storage@1.0.so
      ├── android.hardware.health@1.0.so
      ├── android.hardware.health@2.0.so
      ├── android.hardware.health@2.1.so
      ├── android.hardware.identity-V2-ndk_platform.so
      ├── android.hardware.input.classifier@1.0.so
      ├── android.hardware.input.common@1.0.so
      ├── android.hardware.ir@1.0.so
      ├── android.hardware.keymaster-V2-ndk_platform.so
      ├── android.hardware.keymaster@3.0.so
      ├── android.hardware.keymaster@4.0.so
      ├── android.hardware.keymaster@4.1.so
      ├── android.hardware.light-V1-ndk_platform.so
      ├── android.hardware.light@2.0.so
      ├── android.hardware.media.bufferpool@1.0.so
      ├── android.hardware.media.bufferpool@2.0.so
      ├── android.hardware.media.c2@1.0.so
      ├── android.hardware.media.c2@1.1.so
      ├── android.hardware.media.omx@1.0.so
      ├── android.hardware.media@1.0.so
      ├── android.hardware.memtrack@1.0.so
      ├── android.hardware.neuralnetworks@1.0.so
      ├── android.hardware.neuralnetworks@1.1.so
      ├── android.hardware.neuralnetworks@1.2.so
      ├── android.hardware.neuralnetworks@1.3.so
      ├── android.hardware.nfc@1.0.so
      ├── android.hardware.nfc@1.1.so
      ├── android.hardware.nfc@1.2.so
      ├── android.hardware.oemlock@1.0.so
      ├── android.hardware.power-V1-ndk_platform.so
      ├── android.hardware.power.stats@1.0.so
      ├── android.hardware.power@1.0.so
      ├── android.hardware.power@1.1.so
      ├── android.hardware.power@1.2.so
      ├── android.hardware.power@1.3.so
      ├── android.hardware.radio.config@1.0.so
      ├── android.hardware.radio.config@1.1.so
      ├── android.hardware.radio.config@1.2.so
      ├── android.hardware.radio.deprecated@1.0.so
      ├── android.hardware.radio@1.0.so
      ├── android.hardware.radio@1.1.so
      ├── android.hardware.radio@1.2.so
      ├── android.hardware.radio@1.3.so
      ├── android.hardware.radio@1.4.so
      ├── android.hardware.radio@1.5.so
      ├── android.hardware.rebootescrow-V1-ndk_platform.so
      ├── android.hardware.renderscript@1.0.so
      ├── android.hardware.secure_element@1.0.so
      ├── android.hardware.secure_element@1.1.so
      ├── android.hardware.secure_element@1.2.so
      ├── android.hardware.sensors@1.0.so
      ├── android.hardware.sensors@2.0.so
      ├── android.hardware.sensors@2.1.so
      ├── android.hardware.soundtrigger@2.0-core.so
      ├── android.hardware.soundtrigger@2.0.so
      ├── android.hardware.soundtrigger@2.1.so
      ├── android.hardware.soundtrigger@2.2.so
      ├── android.hardware.soundtrigger@2.3.so
      ├── android.hardware.tetheroffload.config@1.0.so
      ├── android.hardware.tetheroffload.control@1.0.so
      ├── android.hardware.thermal@1.0.so
      ├── android.hardware.thermal@1.1.so
      ├── android.hardware.thermal@2.0.so
      ├── android.hardware.tv.cec@1.0.so
      ├── android.hardware.tv.cec@2.0.so
      ├── android.hardware.tv.input@1.0.so
      ├── android.hardware.tv.tuner@1.0.so
      ├── android.hardware.usb.gadget@1.0.so
      ├── android.hardware.usb.gadget@1.1.so
      ├── android.hardware.usb@1.0.so
      ├── android.hardware.usb@1.1.so
      ├── android.hardware.usb@1.2.so
      ├── android.hardware.vibrator-V1-ndk_platform.so
      ├── android.hardware.vibrator@1.0.so
      ├── android.hardware.vibrator@1.1.so
      ├── android.hardware.vibrator@1.2.so
      ├── android.hardware.vibrator@1.3.so
      ├── android.hardware.vr@1.0.so
      ├── android.hardware.weaver@1.0.so
      ├── android.hardware.wifi.hostapd@1.0.so
      ├── android.hardware.wifi.hostapd@1.1.so
      ├── android.hardware.wifi.hostapd@1.2.so
      ├── android.hardware.wifi.offload@1.0.so
      ├── android.hardware.wifi.supplicant@1.0.so
      ├── android.hardware.wifi.supplicant@1.1.so
      ├── android.hardware.wifi.supplicant@1.2.so
      ├── android.hardware.wifi.supplicant@1.3.so
      ├── android.hardware.wifi@1.0.so
      ├── android.hardware.wifi@1.1.so
      ├── android.hardware.wifi@1.2.so
      ├── android.hardware.wifi@1.3.so
      ├── android.hardware.wifi@1.4.so
      ├── android.hidl.allocator@1.0.so
      ├── android.hidl.memory.block@1.0.so
      ├── android.hidl.memory.token@1.0.so
      ├── android.hidl.memory@1.0.so
      ├── android.hidl.safe_union@1.0.so
      ├── android.hidl.token@1.0-utils.so
      ├── android.hidl.token@1.0.so
      ├── android.system.net.netd@1.0.so
      ├── android.system.net.netd@1.1.so
      ├── android.system.suspend@1.0.so
      ├── android.system.wifi.keystore@1.0.so
      ├── hw/ (drwxr-xr-x)
        ├── android.hidl.memory@1.0-impl.so
      ├── libRSCpuRef.so
      ├── libRSDriver.so
      ├── libRS_internal.so
      ├── libadf.so
      ├── libaudioroute.so
      ├── libaudioutils.so
      ├── libbacktrace.so
      ├── libbase.so
      ├── libbcinfo.so
      ├── libbinder.so
      ├── libblas.so
      ├── libbufferqueueconverter.so
      ├── libc++.so
      ├── libcamera_metadata.so
      ├── libcap.so
      ├── libclang_rt.scudo-arm-android.so
      ├── libclang_rt.scudo_minimal-arm-android.so
      ├── libclang_rt.ubsan_standalone-arm-android.so
      ├── libcn-cbor.so
      ├── libcodec2.so
      ├── libcompiler_rt.so
      ├── libcrypto.so
      ├── libcrypto_utils.so
      ├── libcurl.so
      ├── libcutils.so
      ├── libdiskconfig.so
      ├── libdumpstateutil.so
      ├── libevent.so
      ├── libexif.so
      ├── libexpat.so
      ├── libfmq.so
      ├── libgatekeeper.so
      ├── libgralloctypes.so
      ├── libgui.so
      ├── libhardware.so
      ├── libhardware_legacy.so
      ├── libhidlallocatorutils.so
      ├── libhidlbase.so
      ├── libhidlmemory.so
      ├── libion.so
      ├── libjpeg.so
      ├── libjsoncpp.so
      ├── libldacBT_abr.so
      ├── libldacBT_enc.so
      ├── liblz4.so
      ├── liblzma.so
      ├── libmedia_helper.so
      ├── libmedia_omx.so
      ├── libmemtrack.so
      ├── libminijail.so
      ├── libmkbootimg_abi_check.so
      ├── libnetutils.so
      ├── libnl.so
      ├── libpcre2.so
      ├── libpiex.so
      ├── libpng.so
      ├── libpower.so
      ├── libprocessgroup.so
      ├── libprocinfo.so
      ├── libradio_metadata.so
      ├── libspeexresampler.so
      ├── libsqlite.so
      ├── libssl.so
      ├── libstagefright_bufferpool@2.0.so
      ├── libstagefright_bufferqueue_helper.so
      ├── libstagefright_foundation.so
      ├── libstagefright_omx.so
      ├── libstagefright_omx_utils.so
      ├── libstagefright_xmlparser.so
      ├── libsysutils.so
      ├── libtinyalsa.so
      ├── libtinyxml2.so
      ├── libui.so
      ├── libunwindstack.so
      ├── libusbhost.so
      ├── libutils.so
      ├── libutilscallstack.so
      ├── libwifi-system-iface.so
      ├── libxml2.so
      ├── libyuv.so
      ├── libz.so
      ├── libziparchive.so
  ├── com.android.wifi/ (drwxr-xr-x)
    ├── apex_manifest.pb
    ├── apex_pubkey
    ├── app/ (drwxr-xr-x)
      ├── OsuLogin/ (drwxr-xr-x)
        ├── OsuLogin.apk
    ├── etc/ (drwxr-xr-x)
      ├── security/ (drwxr-xr-x)
        ├── cacerts_wfa/ (drwxr-xr-x)
          ├── 21125ccd.0
          ├── 674b5f5b.0
          ├── ea93cb5b.0
    ├── javalib/ (drwxr-xr-x)
      ├── framework-wifi.jar
      ├── service-wifi.jar
    ├── priv-app/ (drwxr-xr-x)
      ├── ServiceWifiResources/ (drwxr-xr-x)
        ├── ServiceWifiResources.apk
```

---

