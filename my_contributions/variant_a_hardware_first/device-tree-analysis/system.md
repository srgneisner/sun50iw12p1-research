# Directory: system

This file contains the complete directory tree for `/system` extracted from the HY300 device.

**Generated:** 2025-11-08  
**Source:** `FullDir.xml`  
**Items:** 2592 files, 357 subdirectories  
**Type:** Directory

---

## Tree Structure

```
├── system/ (drwxr-xr-x)
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
    ├── com.android.art.release/ (drwxr-xr-x)
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
    ├── com.android.tethering.inprocess/ (drwxr-xr-x)
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
    ├── com.android.vndk.current/ (drwxr-xr-x)
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
  ├── app/ (drwxr-xr-x)
    ├── AwLiveTv/ (drwxr-xr-x)
      ├── AwLiveTv.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── AwLiveTv.odex
          ├── AwLiveTv.vdex
    ├── AwSource/ (drwxr-xr-x)
      ├── AwSource.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── AwSource.odex
          ├── AwSource.vdex
    ├── AwlogSettings/ (drwxr-xr-x)
      ├── AwlogSettings.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── AwlogSettings.odex
          ├── AwlogSettings.vdex
    ├── BasicDreams/ (drwxr-xr-x)
      ├── BasicDreams.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── BasicDreams.odex
          ├── BasicDreams.vdex
    ├── Bluetooth/ (drwxr-xr-x)
      ├── Bluetooth.apk
      ├── lib/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── libbluetooth_jni.so
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── Bluetooth.odex
          ├── Bluetooth.vdex
    ├── BluetoothMidiService/ (drwxr-xr-x)
      ├── BluetoothMidiService.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── BluetoothMidiService.odex
          ├── BluetoothMidiService.vdex
    ├── CertInstaller/ (drwxr-xr-x)
      ├── CertInstaller.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── CertInstaller.odex
          ├── CertInstaller.vdex
    ├── CompanionDeviceManager/ (drwxr-xr-x)
      ├── CompanionDeviceManager.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── CompanionDeviceManager.odex
          ├── CompanionDeviceManager.vdex
    ├── CtsShimPrebuilt/ (drwxr-xr-x)
      ├── CtsShimPrebuilt.apk
    ├── EasterEgg/ (drwxr-xr-x)
      ├── EasterEgg.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── EasterEgg.odex
          ├── EasterEgg.vdex
    ├── ExtShared/ (drwxr-xr-x)
      ├── ExtShared.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── ExtShared.odex
          ├── ExtShared.vdex
    ├── HTC_Music/ (drwxr-xr-x)
      ├── HTC_Music.apk
      ├── lib/ (drwxr-xr-x)
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── HTC_Music.odex
          ├── HTC_Music.vdex
    ├── HTMLViewer/ (drwxr-xr-x)
      ├── HTMLViewer.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── HTMLViewer.odex
          ├── HTMLViewer.vdex
    ├── KeyChain/ (drwxr-xr-x)
      ├── KeyChain.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── KeyChain.odex
          ├── KeyChain.vdex
    ├── MiracastReceiver/ (drwxr-xr-x)
      ├── MiracastReceiver.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── MiracastReceiver.odex
          ├── MiracastReceiver.vdex
    ├── NFXAccessibility/ (drwxr-xr-x)
      ├── NFXAccessibility.apk
      ├── lib/ (drwxr-xr-x)
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── NFXAccessibility.odex
          ├── NFXAccessibility.vdex
    ├── NfcNci/ (drwxr-xr-x)
      ├── NfcNci.apk
      ├── lib/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── libnfc_nci_jni.so
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── NfcNci.odex
          ├── NfcNci.vdex
    ├── PacProcessor/ (drwxr-xr-x)
      ├── PacProcessor.apk
      ├── lib/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── libjni_pacprocessor.so
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── PacProcessor.odex
          ├── PacProcessor.vdex
    ├── PlatformCaptivePortalLogin/ (drwxr-xr-x)
      ├── PlatformCaptivePortalLogin.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── PlatformCaptivePortalLogin.odex
          ├── PlatformCaptivePortalLogin.vdex
    ├── PrintRecommendationService/ (drwxr-xr-x)
      ├── PrintRecommendationService.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── PrintRecommendationService.odex
          ├── PrintRecommendationService.vdex
    ├── PrintSpooler/ (drwxr-xr-x)
      ├── PrintSpooler.apk
      ├── lib/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── libprintspooler_jni.so
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── PrintSpooler.odex
          ├── PrintSpooler.vdex
    ├── SecureElement/ (drwxr-xr-x)
      ├── SecureElement.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── SecureElement.odex
          ├── SecureElement.vdex
    ├── TvdVideo/ (drwxr-xr-x)
      ├── TvdVideo.apk
    ├── Update/ (drwxr-xr-x)
      ├── Update.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── Update.odex
          ├── Update.vdex
    ├── WallpaperBackup/ (drwxr-xr-x)
      ├── WallpaperBackup.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── WallpaperBackup.odex
          ├── WallpaperBackup.vdex
  ├── bin/ (drwxr-x--x)
    ├── abb
    ├── acpi
    ├── am
    ├── apexd
    ├── app_process
    ├── app_process32
    ├── appops
    ├── appsdisable
    ├── appwidget
    ├── atrace
    ├── audioserver
    ├── auditctl
    ├── awk
    ├── awlogd
    ├── base64
    ├── basename
    ├── bc
    ├── bcc
    ├── blank_screen
    ├── blkid
    ├── blockdev
    ├── bmgr
    ├── bootanimation
    ├── bootstat
    ├── bootstrap/ (drwxr-x--x)
      ├── linker
      ├── linker_asan
    ├── boringssl_self_test32
    ├── bpfloader
    ├── bt_test
    ├── bu
    ├── bugreport
    ├── bugreportz
    ├── bunzip2
    ├── bzcat
    ├── bzip2
    ├── cal
    ├── cameraserver
    ├── cat
    ├── charger
    ├── chattr
    ├── chcon
    ├── chgrp
    ├── chmod
    ├── chown
    ├── chroot
    ├── chrt
    ├── cksum
    ├── clatd
    ├── clear
    ├── cmd
    ├── cmp
    ├── comm
    ├── content
    ├── cp
    ├── cpio
    ├── crash_dump32
    ├── credstore
    ├── cut
    ├── dalvikvm
    ├── date
    ├── dd
    ├── debuggerd
    ├── decfps
    ├── defrag.f2fs
    ├── device_config
    ├── devmem
    ├── dex2oat
    ├── df
    ├── diff
    ├── dirname
    ├── disable-verity
    ├── dmctl
    ├── dmesg
    ├── dnsmasq
    ├── dos2unix
    ├── dpm
    ├── drmserver
    ├── du
    ├── dump.f2fs
    ├── dumpstate
    ├── dumpsys
    ├── e2freefrag
    ├── e2fsck
    ├── e2fsdroid
    ├── echo
    ├── egrep
    ├── enable-verity
    ├── env
    ├── expand
    ├── expr
    ├── fallocate
    ├── false
    ├── fgrep
    ├── file
    ├── find
    ├── flags_health_check
    ├── flock
    ├── fmt
    ├── free
    ├── fsck.exfat
    ├── fsck.f2fs
    ├── fsck_msdos
    ├── fsverity_init
    ├── fsync
    ├── gatekeeperd
    ├── getconf
    ├── getenforce
    ├── getevent
    ├── getprop
    ├── gmsopt
    ├── gpioservice
    ├── gpuservice
    ├── grep
    ├── groups
    ├── gsi_tool
    ├── gsid
    ├── gunzip
    ├── gzip
    ├── head
    ├── heapprofd
    ├── hid
    ├── hostname
    ├── hotel_server.sh
    ├── hw/ (drwxr-x--x)
      ├── android.hidl.allocator@1.0-service
      ├── android.system.suspend@1.0-service
    ├── hwclock
    ├── hwservicemanager
    ├── i2cdetect
    ├── i2cdump
    ├── i2cget
    ├── i2cset
    ├── iconv
    ├── id
    ├── idmap2
    ├── idmap2d
    ├── ifconfig
    ├── ime
    ├── incident
    ├── incident-helper-cmd
    ├── incident_helper
    ├── incidentd
    ├── init
    ├── inotifyd
    ├── input
    ├── insmod
    ├── install
    ├── installd
    ├── ionice
    ├── iorenice
    ├── iosimu
    ├── ip
    ├── ip6tables
    ├── ip6tables-restore
    ├── ip6tables-save
    ├── iperf
    ├── iperf3
    ├── iptables
    ├── iptables-restore
    ├── iptables-save
    ├── isomountservice
    ├── keystore
    ├── keystore_cli_v2
    ├── kill
    ├── killall
    ├── kmsgd
    ├── ld.mc
    ├── ldd
    ├── librank
    ├── linker
    ├── linker_asan
    ├── linkerconfig
    ├── lmkd
    ├── ln
    ├── load_policy
    ├── locksettings
    ├── log
    ├── logcat
    ├── logd
    ├── logname
    ├── logwrapper
    ├── losetup
    ├── lpdump
    ├── lpdumpd
    ├── ls
    ├── lsattr
    ├── lshal
    ├── lsmod
    ├── lsof
    ├── lspci
    ├── lsusb
    ├── make_f2fs
    ├── md5sum
    ├── mdnsd
    ├── mediaextractor
    ├── mediametrics
    ├── mediaserver
    ├── memtester
    ├── microcom
    ├── migrate_legacy_obb_data.sh
    ├── mini-keyctl
    ├── mkdir
    ├── mke2fs
    ├── mkfifo
    ├── mkfs.exfat
    ├── mkfs.ext2
    ├── mkfs.ext3
    ├── mkfs.ext4
    ├── mknod
    ├── mkntfs
    ├── mkswap
    ├── mktemp
    ├── modinfo
    ├── modprobe
    ├── monkey
    ├── more
    ├── mount
    ├── mount.exfat
    ├── mountpoint
    ├── mtpd
    ├── multi_ir
    ├── mv
    ├── nc
    ├── ndc
    ├── netcat
    ├── netd
    ├── netstat
    ├── newfs_msdos
    ├── nfsprobe
    ├── nice
    ├── nl
    ├── nohup
    ├── nproc
    ├── nsenter
    ├── ntfs-3g
    ├── ntfs-3g.probe
    ├── od
    ├── paste
    ├── patch
    ├── perfetto
    ├── pgrep
    ├── pidof
    ├── ping
    ├── ping6
    ├── pkill
    ├── pm
    ├── pmap
    ├── pppd
    ├── pppoe
    ├── pppoe-connect
    ├── pppoe-disconnect
    ├── preinstall
    ├── printenv
    ├── printf
    ├── procrank
    ├── ps
    ├── pwd
    ├── qw
    ├── racoon
    ├── readelf
    ├── readlink
    ├── realpath
    ├── reboot
    ├── recovery-persist
    ├── recovery-refresh
    ├── renice
    ├── replace_file.sh
    ├── requestsync
    ├── resize.f2fs
    ├── resize2fs
    ├── restorecon
    ├── rm
    ├── rmdir
    ├── rmmod
    ├── rss_hwm_reset
    ├── run-as
    ├── runcon
    ├── schedtest
    ├── screencap
    ├── screenrecord
    ├── sdcard
    ├── secdiscard
    ├── secilc
    ├── sed
    ├── sendevent
    ├── sensorservice
    ├── seq
    ├── service
    ├── servicemanager
    ├── set-verity-state
    ├── setenforce
    ├── setprop
    ├── setsid
    ├── settings
    ├── sgdisk
    ├── sh
    ├── sha1sum
    ├── sha224sum
    ├── sha256sum
    ├── sha384sum
    ├── sha512sum
    ├── showmap
    ├── simpleperf
    ├── simpleperf_app_runner
    ├── sleep
    ├── sload_f2fs
    ├── sm
    ├── snapshotctl
    ├── sort
    ├── split
    ├── ss
    ├── sst_test_v2
    ├── start
    ├── start_app.sh
    ├── stat
    ├── stop
    ├── storaged
    ├── strings
    ├── stty
    ├── surfaceflinger
    ├── svc
    ├── swapoff
    ├── swapon
    ├── sync
    ├── sysctl
    ├── systemmixservice
    ├── tac
    ├── tail
    ├── tar
    ├── taskset
    ├── tc
    ├── tcpdump
    ├── tee
    ├── test
    ├── time
    ├── timeout
    ├── tombstoned
    ├── toolbox
    ├── top
    ├── touch
    ├── toybox
    ├── tr
    ├── treadahead
    ├── true
    ├── truncate
    ├── tty
    ├── tune2fs
    ├── tzdatacheck
    ├── ueventd
    ├── uiautomator
    ├── ulimit
    ├── umount
    ├── uname
    ├── uncrypt
    ├── uniq
    ├── unix2dos
    ├── unlink
    ├── unshare
    ├── unzip
    ├── update_engine
    ├── update_verifier
    ├── uptime
    ├── usbd
    ├── usleep
    ├── uudecode
    ├── uuencode
    ├── uuidgen
    ├── vdc
    ├── videotunnel-native
    ├── viewcompiler
    ├── vmstat
    ├── vold
    ├── vold_prepare_subdirs
    ├── wait_for_keymaster
    ├── watch
    ├── watchdogd
    ├── wc
    ├── which
    ├── whoami
    ├── wifi
    ├── wifi_test
    ├── wificond
    ├── wm
    ├── xargs
    ├── xxd
    ├── yes
    ├── zcat
    ├── zipinfo
    ├── ziptool
  ├── build.prop
  ├── camprjspe.ini
  ├── clear_white_list.ini
  ├── db_config/ (drwxr-xr-x)
    ├── db_custom_config.json
  ├── etc/ (drwxr-xr-x)
    ├── NOTICE.xml.gz
    ├── allow_skip_permissions_review.ini
    ├── audio_effects.conf
    ├── bluetooth/ (drwxr-xr-x)
      ├── bt_did.conf
      ├── bt_stack.conf
    ├── boot-image.bprof
    ├── boot-image.prof
    ├── bpf/ (drwxr-xr-x)
      ├── bpf_dec_vsync.o
      ├── clatd.o
      ├── netd.o
      ├── offload.o
      ├── stacktracer.o
      ├── time_in_state.o
    ├── cedarx.conf
    ├── cfg-videoplayer.xml
    ├── cgroups.json
    ├── clatd.conf
    ├── compatconfig/ (drwxr-xr-x)
      ├── documents-ui-compat-config.xml
      ├── framework-platform-compat-config.xml
      ├── libcore-platform-compat-config.xml
      ├── services-platform-compat-config.xml
    ├── default-permissions/ (drwxr-xr-x)
      ├── default-permissions.xml
    ├── dirty-image-objects
    ├── event-log-tags
    ├── fonts.xml
    ├── fs_config_dirs
    ├── fs_config_files
    ├── gps_debug.conf
    ├── grant_permission_apps.ini
    ├── group
    ├── hosts
    ├── init/ (drwxr-xr-x)
      ├── android.hidl.allocator@1.0-service.rc
      ├── android.system.suspend@1.0-service.rc
      ├── apexd.rc
      ├── appsdisable.rc
      ├── atrace.rc
      ├── audioserver.rc
      ├── awlogd.rc
      ├── blank_screen.rc
      ├── bootanim.rc
      ├── bootstat.rc
      ├── bpfloader.rc
      ├── cameraserver.rc
      ├── credstore.rc
      ├── drmserver.rc
      ├── dumpstate.rc
      ├── flags_health_check.rc
      ├── gatekeeperd.rc
      ├── gmsopt.rc
      ├── gpioservice.rc
      ├── gpuservice.rc
      ├── gsid.rc
      ├── heapprofd.rc
      ├── hw/ (drwxr-xr-x)
        ├── init.rc
        ├── init.usb.configfs.rc
        ├── init.usb.rc
        ├── init.zygote32.rc
      ├── hwservicemanager.rc
      ├── idmap2d.rc
      ├── incidentd.rc
      ├── init.wireless.property.rc
      ├── installd.rc
      ├── isomountservice.rc
      ├── keystore.rc
      ├── lmkd.rc
      ├── logd.rc
      ├── lpdumpd.rc
      ├── mdnsd.rc
      ├── mediaextractor.rc
      ├── mediametrics.rc
      ├── mediaserver.rc
      ├── mtpd.rc
      ├── multi_ir.rc
      ├── netd.rc
      ├── pppoe.rc
      ├── preinstall.rc
      ├── qw.rc
      ├── racoon.rc
      ├── recovery-persist.rc
      ├── recovery-refresh.rc
      ├── rss_hwm_reset.rc
      ├── servicemanager.rc
      ├── shutdownanim.rc
      ├── storaged.rc
      ├── surfaceflinger.rc
      ├── systemmix.rc
      ├── tombstoned.rc
      ├── treadahead.rc
      ├── uncrypt.rc
      ├── update_engine.rc
      ├── update_verifier.rc
      ├── usbd.rc
      ├── vdc.rc
      ├── vold.rc
      ├── wait_for_keymaster.rc
      ├── wifi.rc
      ├── wificond.rc
    ├── lmkd_whitelist
    ├── media_codecs.xml
    ├── media_profiles_V1_0.dtd
    ├── mke2fs.conf
    ├── mkshrc
    ├── passwd
    ├── permissions/ (drwxr-xr-x)
      ├── android.hardware.location.network.xml
      ├── android.software.controls.xml
      ├── android.software.webview.xml
      ├── android.test.base.xml
      ├── android.test.mock.xml
      ├── android.test.runner.xml
      ├── com.android.documentsui.xml
      ├── com.android.future.usb.accessory.xml
      ├── com.android.location.provider.xml
      ├── com.android.media.remotedisplay.xml
      ├── com.android.mediadrm.signer.xml
      ├── com.android.providers.tv.xml
      ├── com.google.android.maps.xml
      ├── com.google.android.media.effects.xml
      ├── com.softwinner.tv.xml
      ├── javax.obex.xml
      ├── org.apache.http.legacy.xml
      ├── platform.xml
      ├── privapp-permissions-go-system.xml
      ├── privapp-permissions-google.xml
      ├── privapp-permissions-platform.xml
      ├── privapp-vendor-permissions.xml
      ├── provision-permissions.xml
      ├── split-permissions-google.xml
    ├── porvider_whitelist.ini
    ├── ppp/ (drwxr-xr-x)
      ├── ip-down-pppoe
      ├── ip-up-pppoe
      ├── ip-up-vpn
      ├── peers/ (drwxr-xr-x)
        ├── pppoe-options
    ├── preferred-apps/ (drwxr-xr-x)
      ├── custom.xml
      ├── google.xml
    ├── preloaded-classes
    ├── prop.default
    ├── protolog.conf.json.gz
    ├── public.libraries.txt
    ├── sanitizer.libraries.txt
    ├── seccomp_policy/ (drwxr-xr-x)
      ├── code_coverage.arm.policy
      ├── code_coverage.arm64.policy
      ├── crash_dump.arm.policy
      ├── crash_dump.arm64.policy
      ├── mediacodec.policy
      ├── mediaextractor.policy
    ├── security/ (drwxr-xr-x)
      ├── cacerts/ (drwxr-xr-x)
        ├── 00673b5b.0
        ├── 04f60c28.0
        ├── 0d69c7e1.0
        ├── 10531352.0
        ├── 111e6273.0
        ├── 12d55845.0
        ├── 1dcd6f4c.0
        ├── 1df5a75f.0
        ├── 1e1eab7c.0
        ├── 1e8e7201.0
        ├── 1eb37bdf.0
        ├── 1f58a078.0
        ├── 219d9499.0
        ├── 23f4c490.0
        ├── 27af790d.0
        ├── 2add47b6.0
        ├── 2d9dafe4.0
        ├── 2fa87019.0
        ├── 302904dd.0
        ├── 304d27c3.0
        ├── 31188b5e.0
        ├── 33ee480d.0
        ├── 343eb6cb.0
        ├── 35105088.0
        ├── 399e7759.0
        ├── 3a3b02ce.0
        ├── 3ad48a91.0
        ├── 3c58f906.0
        ├── 3c6676aa.0
        ├── 3c860d51.0
        ├── 3c899c73.0
        ├── 3c9a4d3b.0
        ├── 3d441de8.0
        ├── 3e7271e8.0
        ├── 40dc992e.0
        ├── 455f1b52.0
        ├── 48a195d8.0
        ├── 4be590e0.0
        ├── 5046c355.0
        ├── 524d9b43.0
        ├── 52b525c7.0
        ├── 583d0756.0
        ├── 5a250ea7.0
        ├── 5a3f0ff8.0
        ├── 5acf816d.0
        ├── 5cf9d536.0
        ├── 5e4e69e7.0
        ├── 5f47b495.0
        ├── 60afe812.0
        ├── 6187b673.0
        ├── 63a2c897.0
        ├── 67495436.0
        ├── 69105f4f.0
        ├── 6b03dec0.0
        ├── 75680d2e.0
        ├── 76579174.0
        ├── 7892ad52.0
        ├── 7999be0d.0
        ├── 7a7c655d.0
        ├── 7a819ef2.0
        ├── 7c302982.0
        ├── 7d453d8f.0
        ├── 81b9768f.0
        ├── 82223c44.0
        ├── 85cde254.0
        ├── 86212b19.0
        ├── 869fbf79.0
        ├── 87753b0d.0
        ├── 882de061.0
        ├── 88950faa.0
        ├── 89c02a45.0
        ├── 8d6437c3.0
        ├── 91739615.0
        ├── 9282e51c.0
        ├── 9339512a.0
        ├── 9479c8c3.0
        ├── 9576d26b.0
        ├── 95aff9e3.0
        ├── 9685a493.0
        ├── 9772ca32.0
        ├── 985c1f52.0
        ├── 9d6523ce.0
        ├── 9f533518.0
        ├── a2c66da8.0
        ├── a3896b44.0
        ├── a7605362.0
        ├── a7d2cf64.0
        ├── a81e292b.0
        ├── ab5346f4.0
        ├── ab59055e.0
        ├── aeb67534.0
        ├── b0ed035a.0
        ├── b0f3e76e.0
        ├── b3fb433b.0
        ├── b74d2bd5.0
        ├── b7db1890.0
        ├── b872f2b4.0
        ├── b936d1c6.0
        ├── bc3f2570.0
        ├── bd43e1dd.0
        ├── bdacca6f.0
        ├── bf64f35b.0
        ├── c2c1704e.0
        ├── c491639e.0
        ├── c51c224c.0
        ├── c559d742.0
        ├── c7e2a638.0
        ├── c907e29b.0
        ├── c90bc37d.0
        ├── cb156124.0
        ├── cb1c3204.0
        ├── ccc52f49.0
        ├── cf701eeb.0
        ├── d06393bb.0
        ├── d0cddf45.0
        ├── d16a5865.0
        ├── d18e9066.0
        ├── d41b5e2a.0
        ├── d4c339cb.0
        ├── d59297b8.0
        ├── d7746a63.0
        ├── da7377f6.0
        ├── dbc54cab.0
        ├── dbff3a01.0
        ├── dc99f41e.0
        ├── dfc0fe80.0
        ├── e442e424.0
        ├── e48193cf.0
        ├── e775ed2d.0
        ├── e8651083.0
        ├── ed39abd0.0
        ├── f013ecaf.0
        ├── f0cd152c.0
        ├── f459871d.0
        ├── facacbc6.0
        ├── fb5fa911.0
        ├── fd08c599.0
        ├── fde84897.0
      ├── cacerts_google/ (drwxr-xr-x)
        ├── 00673b5b.0
        ├── 02b73561.0
        ├── 04f60c28.0
        ├── 052e396b.0
        ├── 0d69c7e1.0
        ├── 111e6273.0
        ├── 124bbd54.0
        ├── 1e8e7201.0
        ├── 219d9499.0
        ├── 23f4c490.0
        ├── 27af790d.0
        ├── 2add47b6.0
        ├── 2afc57aa.0
        ├── 343eb6cb.0
        ├── 35105088.0
        ├── 399e7759.0
        ├── 3ad48a91.0
        ├── 3c58f906.0
        ├── 3e7271e8.0
        ├── 455f1b52.0
        ├── 4fbd6bfa.0
        ├── 5021a0a2.0
        ├── 524d9b43.0
        ├── 57692373.0
        ├── 594f1775.0
        ├── 5a3f0ff8.0
        ├── 5e4e69e7.0
        ├── 67495436.0
        ├── 69105f4f.0
        ├── 75680d2e.0
        ├── 7999be0d.0
        ├── 7d453d8f.0
        ├── 81b9768f.0
        ├── 85cde254.0
        ├── 86212b19.0
        ├── 87753b0d.0
        ├── 89c02a45.0
        ├── 8d6437c3.0
        ├── 9772ca32.0
        ├── a2c66da8.0
        ├── a2df7ad7.0
        ├── a7d2cf64.0
        ├── b0f3e76e.0
        ├── b3fb433b.0
        ├── bc3f2570.0
        ├── bf64f35b.0
        ├── c491639e.0
        ├── c527e4ab.0
        ├── c7e2a638.0
        ├── c90bc37d.0
        ├── ccc52f49.0
        ├── d4c339cb.0
        ├── dbc54cab.0
        ├── e268a4c5.0
        ├── e48193cf.0
        ├── e775ed2d.0
        ├── ed39abd0.0
        ├── facacbc6.0
        ├── ff783690.0
      ├── fsverity/ (drwxr-xr-x)
        ├── fsverity-release.x509.der
      ├── otacerts.zip
    ├── selinux/ (drwxr-xr-x)
      ├── mapping/ (drwxr-xr-x)
        ├── 26.0.cil
        ├── 26.0.compat.cil
        ├── 27.0.cil
        ├── 27.0.compat.cil
        ├── 28.0.cil
        ├── 28.0.compat.cil
        ├── 29.0.cil
        ├── 29.0.compat.cil
        ├── 30.0.cil
      ├── plat_file_contexts
      ├── plat_hwservice_contexts
      ├── plat_mac_permissions.xml
      ├── plat_property_contexts
      ├── plat_seapp_contexts
      ├── plat_sepolicy.cil
      ├── plat_sepolicy_and_mapping.sha256
      ├── plat_service_contexts
    ├── sysconfig/ (drwxr-xr-x)
      ├── framework-sysconfig.xml
      ├── google-hiddenapi-package-whitelist.xml
      ├── google.xml
      ├── google_build.xml
      ├── google_exclusives_enable.xml
      ├── hiddenapi-package-whitelist.xml
      ├── preinstalled-packages-platform.xml
    ├── task_profiles.json
    ├── textclassifier/ (drwxr-xr-x)
      ├── actions_suggestions.universal.model
      ├── lang_id.model
      ├── textclassifier.en.model
      ├── textclassifier.universal.model
    ├── ueventd.rc
    ├── unknow_source_whitelist.ini
    ├── updatable-bcp-packages.txt
    ├── vintf/ (drwxr-xr-x)
      ├── compatibility_matrix.1.xml
      ├── compatibility_matrix.2.xml
      ├── compatibility_matrix.3.xml
      ├── compatibility_matrix.4.xml
      ├── compatibility_matrix.5.xml
      ├── compatibility_matrix.device.xml
      ├── compatibility_matrix.legacy.xml
      ├── manifest/ (drwxr-xr-x)
        ├── android.frameworks.stats@1.0-service.xml
        ├── android.hidl.allocator@1.0-service.xml
        ├── android.system.suspend@1.0-service.xml
        ├── manifest_android.frameworks.cameraservice.service@2.1.xml
        ├── manifest_media_c2_software.xml
      ├── manifest.xml
    ├── vndkcorevariant.libraries.txt
    ├── xtables.lock
  ├── fonts/ (drwxr-xr-x)
    ├── AndroidClock.ttf
    ├── CarroisGothicSC-Regular.ttf
    ├── ComingSoon.ttf
    ├── CutiveMono.ttf
    ├── DancingScript-Bold.ttf
    ├── DancingScript-Regular.ttf
    ├── DroidSans-Bold.ttf
    ├── DroidSans.ttf
    ├── DroidSansMono.ttf
    ├── NotoColorEmoji.ttf
    ├── NotoNaskhArabic-Bold.ttf
    ├── NotoNaskhArabic-Regular.ttf
    ├── NotoNaskhArabicUI-Bold.ttf
    ├── NotoNaskhArabicUI-Regular.ttf
    ├── NotoSansAdlam-VF.ttf
    ├── NotoSansAhom-Regular.otf
    ├── NotoSansAnatolianHieroglyphs-Regular.otf
    ├── NotoSansArmenian-Bold.otf
    ├── NotoSansArmenian-Medium.otf
    ├── NotoSansArmenian-Regular.otf
    ├── NotoSansAvestan-Regular.ttf
    ├── NotoSansBalinese-Regular.ttf
    ├── NotoSansBamum-Regular.ttf
    ├── NotoSansBassaVah-Regular.otf
    ├── NotoSansBatak-Regular.ttf
    ├── NotoSansBengali-Bold.otf
    ├── NotoSansBengali-Medium.otf
    ├── NotoSansBengali-Regular.otf
    ├── NotoSansBengaliUI-Bold.otf
    ├── NotoSansBengaliUI-Medium.otf
    ├── NotoSansBengaliUI-Regular.otf
    ├── NotoSansBhaiksuki-Regular.otf
    ├── NotoSansBrahmi-Regular.ttf
    ├── NotoSansBuginese-Regular.ttf
    ├── NotoSansBuhid-Regular.ttf
    ├── NotoSansCJK-Regular.ttc
    ├── NotoSansCanadianAboriginal-Regular.ttf
    ├── NotoSansCarian-Regular.ttf
    ├── NotoSansChakma-Regular.otf
    ├── NotoSansCham-Bold.ttf
    ├── NotoSansCham-Regular.ttf
    ├── NotoSansCherokee-Regular.ttf
    ├── NotoSansCoptic-Regular.ttf
    ├── NotoSansCuneiform-Regular.ttf
    ├── NotoSansCypriot-Regular.ttf
    ├── NotoSansDeseret-Regular.ttf
    ├── NotoSansDevanagari-Bold.otf
    ├── NotoSansDevanagari-Medium.otf
    ├── NotoSansDevanagari-Regular.otf
    ├── NotoSansDevanagariUI-Bold.otf
    ├── NotoSansDevanagariUI-Medium.otf
    ├── NotoSansDevanagariUI-Regular.otf
    ├── NotoSansEgyptianHieroglyphs-Regular.ttf
    ├── NotoSansElbasan-Regular.otf
    ├── NotoSansEthiopic-Bold.ttf
    ├── NotoSansEthiopic-Regular.ttf
    ├── NotoSansGeorgian-VF.ttf
    ├── NotoSansGlagolitic-Regular.ttf
    ├── NotoSansGothic-Regular.ttf
    ├── NotoSansGujarati-Bold.ttf
    ├── NotoSansGujarati-Regular.ttf
    ├── NotoSansGujaratiUI-Bold.ttf
    ├── NotoSansGujaratiUI-Regular.ttf
    ├── NotoSansGunjalaGondi-Regular.otf
    ├── NotoSansGurmukhi-Bold.ttf
    ├── NotoSansGurmukhi-Regular.ttf
    ├── NotoSansGurmukhiUI-Bold.ttf
    ├── NotoSansGurmukhiUI-Regular.ttf
    ├── NotoSansHanifiRohingya-Regular.otf
    ├── NotoSansHanunoo-Regular.ttf
    ├── NotoSansHatran-Regular.otf
    ├── NotoSansHebrew-Bold.ttf
    ├── NotoSansHebrew-Regular.ttf
    ├── NotoSansImperialAramaic-Regular.ttf
    ├── NotoSansInscriptionalPahlavi-Regular.ttf
    ├── NotoSansInscriptionalParthian-Regular.ttf
    ├── NotoSansJavanese-Regular.otf
    ├── NotoSansKaithi-Regular.ttf
    ├── NotoSansKannada-Bold.ttf
    ├── NotoSansKannada-Regular.ttf
    ├── NotoSansKannadaUI-Bold.ttf
    ├── NotoSansKannadaUI-Regular.ttf
    ├── NotoSansKayahLi-Regular.ttf
    ├── NotoSansKharoshthi-Regular.ttf
    ├── NotoSansKhmer-VF.ttf
    ├── NotoSansKhmerUI-Bold.ttf
    ├── NotoSansKhmerUI-Regular.ttf
    ├── NotoSansKhojki-Regular.otf
    ├── NotoSansLao-Bold.ttf
    ├── NotoSansLao-Regular.ttf
    ├── NotoSansLaoUI-Bold.ttf
    ├── NotoSansLaoUI-Regular.ttf
    ├── NotoSansLepcha-Regular.ttf
    ├── NotoSansLimbu-Regular.ttf
    ├── NotoSansLinearA-Regular.otf
    ├── NotoSansLinearB-Regular.ttf
    ├── NotoSansLisu-Regular.ttf
    ├── NotoSansLycian-Regular.ttf
    ├── NotoSansLydian-Regular.ttf
    ├── NotoSansMalayalam-Bold.otf
    ├── NotoSansMalayalam-Medium.otf
    ├── NotoSansMalayalam-Regular.otf
    ├── NotoSansMalayalamUI-Bold.otf
    ├── NotoSansMalayalamUI-Medium.otf
    ├── NotoSansMalayalamUI-Regular.otf
    ├── NotoSansMandaic-Regular.ttf
    ├── NotoSansManichaean-Regular.otf
    ├── NotoSansMarchen-Regular.otf
    ├── NotoSansMasaramGondi-Regular.otf
    ├── NotoSansMeeteiMayek-Regular.ttf
    ├── NotoSansMeroitic-Regular.otf
    ├── NotoSansMiao-Regular.otf
    ├── NotoSansMongolian-Regular.ttf
    ├── NotoSansMro-Regular.otf
    ├── NotoSansMultani-Regular.otf
    ├── NotoSansMyanmar-Bold.otf
    ├── NotoSansMyanmar-Medium.otf
    ├── NotoSansMyanmar-Regular.otf
    ├── NotoSansMyanmarUI-Bold.otf
    ├── NotoSansMyanmarUI-Medium.otf
    ├── NotoSansMyanmarUI-Regular.otf
    ├── NotoSansNKo-Regular.ttf
    ├── NotoSansNabataean-Regular.otf
    ├── NotoSansNewTaiLue-Regular.ttf
    ├── NotoSansNewa-Regular.otf
    ├── NotoSansOgham-Regular.ttf
    ├── NotoSansOlChiki-Regular.ttf
    ├── NotoSansOldItalic-Regular.ttf
    ├── NotoSansOldNorthArabian-Regular.otf
    ├── NotoSansOldPermic-Regular.otf
    ├── NotoSansOldPersian-Regular.ttf
    ├── NotoSansOldSouthArabian-Regular.ttf
    ├── NotoSansOldTurkic-Regular.ttf
    ├── NotoSansOriya-Bold.ttf
    ├── NotoSansOriya-Regular.ttf
    ├── NotoSansOriyaUI-Bold.ttf
    ├── NotoSansOriyaUI-Regular.ttf
    ├── NotoSansOsage-Regular.ttf
    ├── NotoSansOsmanya-Regular.ttf
    ├── NotoSansPahawhHmong-Regular.otf
    ├── NotoSansPalmyrene-Regular.otf
    ├── NotoSansPauCinHau-Regular.otf
    ├── NotoSansPhagsPa-Regular.ttf
    ├── NotoSansPhoenician-Regular.ttf
    ├── NotoSansRejang-Regular.ttf
    ├── NotoSansRunic-Regular.ttf
    ├── NotoSansSamaritan-Regular.ttf
    ├── NotoSansSaurashtra-Regular.ttf
    ├── NotoSansSharada-Regular.otf
    ├── NotoSansShavian-Regular.ttf
    ├── NotoSansSinhala-Bold.otf
    ├── NotoSansSinhala-Medium.otf
    ├── NotoSansSinhala-Regular.otf
    ├── NotoSansSinhalaUI-Bold.otf
    ├── NotoSansSinhalaUI-Medium.otf
    ├── NotoSansSinhalaUI-Regular.otf
    ├── NotoSansSoraSompeng-Regular.otf
    ├── NotoSansSundanese-Regular.ttf
    ├── NotoSansSylotiNagri-Regular.ttf
    ├── NotoSansSymbols-Regular-Subsetted.ttf
    ├── NotoSansSymbols-Regular-Subsetted2.ttf
    ├── NotoSansSyriacEastern-Regular.ttf
    ├── NotoSansSyriacEstrangela-Regular.ttf
    ├── NotoSansSyriacWestern-Regular.ttf
    ├── NotoSansTagalog-Regular.ttf
    ├── NotoSansTagbanwa-Regular.ttf
    ├── NotoSansTaiLe-Regular.ttf
    ├── NotoSansTaiTham-Regular.ttf
    ├── NotoSansTaiViet-Regular.ttf
    ├── NotoSansTamil-Bold.otf
    ├── NotoSansTamil-Medium.otf
    ├── NotoSansTamil-Regular.otf
    ├── NotoSansTamilUI-Bold.otf
    ├── NotoSansTamilUI-Medium.otf
    ├── NotoSansTamilUI-Regular.otf
    ├── NotoSansTelugu-Bold.ttf
    ├── NotoSansTelugu-Regular.ttf
    ├── NotoSansTeluguUI-Bold.ttf
    ├── NotoSansTeluguUI-Regular.ttf
    ├── NotoSansThaana-Bold.ttf
    ├── NotoSansThaana-Regular.ttf
    ├── NotoSansThai-Bold.ttf
    ├── NotoSansThai-Regular.ttf
    ├── NotoSansThaiUI-Bold.ttf
    ├── NotoSansThaiUI-Regular.ttf
    ├── NotoSansTibetan-Bold.ttf
    ├── NotoSansTibetan-Regular.ttf
    ├── NotoSansTifinagh-Regular.otf
    ├── NotoSansUgaritic-Regular.ttf
    ├── NotoSansVai-Regular.ttf
    ├── NotoSansWancho-Regular.otf
    ├── NotoSansWarangCiti-Regular.otf
    ├── NotoSansYi-Regular.ttf
    ├── NotoSerif-Bold.ttf
    ├── NotoSerif-BoldItalic.ttf
    ├── NotoSerif-Italic.ttf
    ├── NotoSerif-Regular.ttf
    ├── NotoSerifArmenian-Bold.otf
    ├── NotoSerifArmenian-Regular.otf
    ├── NotoSerifBengali-Bold.ttf
    ├── NotoSerifBengali-Regular.ttf
    ├── NotoSerifCJK-Regular.ttc
    ├── NotoSerifDevanagari-Bold.ttf
    ├── NotoSerifDevanagari-Regular.ttf
    ├── NotoSerifEthiopic-Bold.otf
    ├── NotoSerifEthiopic-Regular.otf
    ├── NotoSerifGeorgian-VF.ttf
    ├── NotoSerifGujarati-Bold.ttf
    ├── NotoSerifGujarati-Regular.ttf
    ├── NotoSerifGurmukhi-Bold.otf
    ├── NotoSerifGurmukhi-Regular.otf
    ├── NotoSerifHebrew-Bold.ttf
    ├── NotoSerifHebrew-Regular.ttf
    ├── NotoSerifKannada-Bold.ttf
    ├── NotoSerifKannada-Regular.ttf
    ├── NotoSerifKhmer-Bold.otf
    ├── NotoSerifKhmer-Regular.otf
    ├── NotoSerifLao-Bold.ttf
    ├── NotoSerifLao-Regular.ttf
    ├── NotoSerifMalayalam-Bold.ttf
    ├── NotoSerifMalayalam-Regular.ttf
    ├── NotoSerifMyanmar-Bold.otf
    ├── NotoSerifMyanmar-Regular.otf
    ├── NotoSerifSinhala-Bold.otf
    ├── NotoSerifSinhala-Regular.otf
    ├── NotoSerifTamil-Bold.otf
    ├── NotoSerifTamil-Regular.otf
    ├── NotoSerifTelugu-Bold.ttf
    ├── NotoSerifTelugu-Regular.ttf
    ├── NotoSerifThai-Bold.ttf
    ├── NotoSerifThai-Regular.ttf
    ├── Roboto-Black.ttf
    ├── Roboto-BlackItalic.ttf
    ├── Roboto-Bold.ttf
    ├── Roboto-BoldItalic.ttf
    ├── Roboto-Italic.ttf
    ├── Roboto-Light.ttf
    ├── Roboto-LightItalic.ttf
    ├── Roboto-Medium.ttf
    ├── Roboto-MediumItalic.ttf
    ├── Roboto-Regular.ttf
    ├── Roboto-Thin.ttf
    ├── Roboto-ThinItalic.ttf
    ├── RobotoCondensed-Bold.ttf
    ├── RobotoCondensed-BoldItalic.ttf
    ├── RobotoCondensed-Italic.ttf
    ├── RobotoCondensed-Light.ttf
    ├── RobotoCondensed-LightItalic.ttf
    ├── RobotoCondensed-Medium.ttf
    ├── RobotoCondensed-MediumItalic.ttf
    ├── RobotoCondensed-Regular.ttf
    ├── SourceSansPro-Bold.ttf
    ├── SourceSansPro-BoldItalic.ttf
    ├── SourceSansPro-Italic.ttf
    ├── SourceSansPro-Regular.ttf
    ├── SourceSansPro-SemiBold.ttf
    ├── SourceSansPro-SemiBoldItalic.ttf
  ├── framework/ (drwxr-xr-x)
    ├── am.jar
    ├── android.hidl.base-V1.0-java.jar
    ├── android.hidl.manager-V1.0-java.jar
    ├── android.test.base.jar
    ├── android.test.mock.jar
    ├── android.test.runner.jar
    ├── appwidget.jar
    ├── arm/ (drwxr-xr-x)
      ├── boot-ext.art
      ├── boot-ext.oat
      ├── boot-ext.vdex
      ├── boot-framework-atb-backward-compatibility.art
      ├── boot-framework-atb-backward-compatibility.oat
      ├── boot-framework-atb-backward-compatibility.vdex
      ├── boot-framework.art
      ├── boot-framework.oat
      ├── boot-framework.vdex
    ├── awbms.jar
    ├── bmgr.jar
    ├── boot-ext.vdex
    ├── boot-framework-atb-backward-compatibility.vdex
    ├── boot-framework.vdex
    ├── bu.jar
    ├── com.android.future.usb.accessory.jar
    ├── com.android.location.provider.jar
    ├── com.android.media.remotedisplay.jar
    ├── com.android.mediadrm.signer.jar
    ├── com.google.android.media.effects.jar
    ├── com.softwinner.tv.jar
    ├── content.jar
    ├── dpm.jar
    ├── ethernet-service.jar
    ├── ext.jar
    ├── framework-atb-backward-compatibility.jar
    ├── framework-res.apk
    ├── framework.jar
    ├── hid.jar
    ├── incident-helper-cmd.jar
    ├── input.jar
    ├── javax.obex.jar
    ├── locksettings.jar
    ├── monkey.jar
    ├── oat/ (drwxr-xr-x)
      ├── arm/ (drwxr-xr-x)
        ├── am.odex
        ├── am.vdex
        ├── android.hidl.base-V1.0-java.odex
        ├── android.hidl.base-V1.0-java.vdex
        ├── android.hidl.manager-V1.0-java.odex
        ├── android.hidl.manager-V1.0-java.vdex
        ├── android.test.base.odex
        ├── android.test.base.vdex
        ├── android.test.mock.odex
        ├── android.test.mock.vdex
        ├── android.test.runner.odex
        ├── android.test.runner.vdex
        ├── appwidget.odex
        ├── appwidget.vdex
        ├── awbms.odex
        ├── awbms.vdex
        ├── bmgr.odex
        ├── bmgr.vdex
        ├── bu.odex
        ├── bu.vdex
        ├── com.android.future.usb.accessory.odex
        ├── com.android.future.usb.accessory.vdex
        ├── com.android.location.provider.odex
        ├── com.android.location.provider.vdex
        ├── com.android.media.remotedisplay.odex
        ├── com.android.media.remotedisplay.vdex
        ├── com.android.mediadrm.signer.odex
        ├── com.android.mediadrm.signer.vdex
        ├── content.odex
        ├── content.vdex
        ├── dpm.odex
        ├── dpm.vdex
        ├── ethernet-service.odex
        ├── ethernet-service.vdex
        ├── hid.odex
        ├── hid.vdex
        ├── incident-helper-cmd.odex
        ├── incident-helper-cmd.vdex
        ├── input.odex
        ├── input.vdex
        ├── javax.obex.odex
        ├── javax.obex.vdex
        ├── locksettings.odex
        ├── locksettings.vdex
        ├── monkey.odex
        ├── monkey.vdex
        ├── org.apache.http.legacy.odex
        ├── org.apache.http.legacy.vdex
        ├── pppoe-service.odex
        ├── pppoe-service.vdex
        ├── requestsync.odex
        ├── requestsync.vdex
        ├── service-blobstore.odex
        ├── service-blobstore.vdex
        ├── service-jobscheduler.odex
        ├── service-jobscheduler.vdex
        ├── services.art
        ├── services.odex
        ├── services.vdex
        ├── sm.odex
        ├── sm.vdex
        ├── softwinner.audio.odex
        ├── softwinner.audio.vdex
        ├── svc.odex
        ├── svc.vdex
        ├── uiautomator.odex
        ├── uiautomator.vdex
    ├── org.apache.http.legacy.jar
    ├── org.apache.http.legacy.jar.prof
    ├── pppoe-service.jar
    ├── requestsync.jar
    ├── service-blobstore.jar
    ├── service-jobscheduler.jar
    ├── services.jar
    ├── services.jar.bprof
    ├── services.jar.prof
    ├── sm.jar
    ├── softwinner.audio.jar
    ├── svc.jar
    ├── uiautomator.jar
  ├── lib/ (drwxr-xr-x)
    ├── android.frameworks.bufferhub@1.0.so
    ├── android.frameworks.cameraservice.common@2.0.so
    ├── android.frameworks.cameraservice.device@2.0.so
    ├── android.frameworks.cameraservice.service@2.0.so
    ├── android.frameworks.cameraservice.service@2.1.so
    ├── android.frameworks.displayservice@1.0.so
    ├── android.frameworks.schedulerservice@1.0.so
    ├── android.frameworks.sensorservice@1.0.so
    ├── android.frameworks.stats@1.0.so
    ├── android.frameworks.vr.composer@2.0.so
    ├── android.hardware.atrace@1.0.so
    ├── android.hardware.audio.common-util.so
    ├── android.hardware.audio.common@2.0-util.so
    ├── android.hardware.audio.common@2.0.so
    ├── android.hardware.audio.common@4.0-util.so
    ├── android.hardware.audio.common@4.0.so
    ├── android.hardware.audio.common@5.0-util.so
    ├── android.hardware.audio.common@5.0.so
    ├── android.hardware.audio.common@6.0-util.so
    ├── android.hardware.audio.common@6.0.so
    ├── android.hardware.audio.effect@2.0.so
    ├── android.hardware.audio.effect@4.0.so
    ├── android.hardware.audio.effect@5.0.so
    ├── android.hardware.audio.effect@6.0.so
    ├── android.hardware.audio@2.0.so
    ├── android.hardware.audio@4.0.so
    ├── android.hardware.audio@5.0.so
    ├── android.hardware.audio@6.0.so
    ├── android.hardware.bluetooth.a2dp@1.0.so
    ├── android.hardware.bluetooth.audio@2.0.so
    ├── android.hardware.bluetooth@1.0.so
    ├── android.hardware.bluetooth@1.1.so
    ├── android.hardware.boot@1.0.so
    ├── android.hardware.boot@1.1.so
    ├── android.hardware.broadcastradio@1.0.so
    ├── android.hardware.broadcastradio@1.1.so
    ├── android.hardware.camera.common@1.0.so
    ├── android.hardware.camera.device@1.0.so
    ├── android.hardware.camera.device@3.2.so
    ├── android.hardware.camera.device@3.3.so
    ├── android.hardware.camera.device@3.4.so
    ├── android.hardware.camera.device@3.5.so
    ├── android.hardware.camera.device@3.6.so
    ├── android.hardware.camera.provider@2.4.so
    ├── android.hardware.camera.provider@2.5.so
    ├── android.hardware.camera.provider@2.6.so
    ├── android.hardware.cas.native@1.0.so
    ├── android.hardware.cas@1.0.so
    ├── android.hardware.common-V1-ndk_platform.so
    ├── android.hardware.configstore-utils.so
    ├── android.hardware.configstore@1.0.so
    ├── android.hardware.configstore@1.1.so
    ├── android.hardware.confirmationui@1.0.so
    ├── android.hardware.contexthub@1.0.so
    ├── android.hardware.drm@1.0.so
    ├── android.hardware.drm@1.1.so
    ├── android.hardware.drm@1.2.so
    ├── android.hardware.drm@1.3.so
    ├── android.hardware.dumpstate@1.0.so
    ├── android.hardware.dumpstate@1.1.so
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
    ├── android.hardware.identity-support-lib.so
    ├── android.hardware.input.classifier@1.0.so
    ├── android.hardware.input.common@1.0.so
    ├── android.hardware.ir@1.0.so
    ├── android.hardware.keymaster@3.0.so
    ├── android.hardware.keymaster@4.0.so
    ├── android.hardware.keymaster@4.1.so
    ├── android.hardware.light@2.0.so
    ├── android.hardware.media.bufferpool@2.0.so
    ├── android.hardware.media.c2@1.0.so
    ├── android.hardware.media.c2@1.1.so
    ├── android.hardware.media.omx@1.0.so
    ├── android.hardware.media@1.0.so
    ├── android.hardware.memtrack@1.0.so
    ├── android.hardware.nfc@1.0.so
    ├── android.hardware.nfc@1.1.so
    ├── android.hardware.nfc@1.2.so
    ├── android.hardware.power-V1-cpp.so
    ├── android.hardware.power.stats@1.0.so
    ├── android.hardware.power@1.0.so
    ├── android.hardware.power@1.1.so
    ├── android.hardware.power@1.2.so
    ├── android.hardware.power@1.3.so
    ├── android.hardware.renderscript@1.0.so
    ├── android.hardware.sensors@1.0.so
    ├── android.hardware.sensors@2.0.so
    ├── android.hardware.sensors@2.1.so
    ├── android.hardware.thermal@1.0.so
    ├── android.hardware.tv.cec@1.0.so
    ├── android.hardware.tv.input@1.0.so
    ├── android.hardware.usb.gadget@1.0.so
    ├── android.hardware.vibrator-V1-cpp.so
    ├── android.hardware.vibrator@1.0.so
    ├── android.hardware.vibrator@1.1.so
    ├── android.hardware.vibrator@1.2.so
    ├── android.hardware.vibrator@1.3.so
    ├── android.hardware.vr@1.0.so
    ├── android.hidl.allocator@1.0.so
    ├── android.hidl.memory.token@1.0.so
    ├── android.hidl.memory@1.0.so
    ├── android.hidl.safe_union@1.0.so
    ├── android.hidl.token@1.0-utils.so
    ├── android.hidl.token@1.0.so
    ├── android.system.net.netd@1.0.so
    ├── android.system.net.netd@1.1.so
    ├── android.system.suspend@1.0.so
    ├── android.system.wifi.keystore@1.0.so
    ├── apex_aidl_interface-V1-cpp.so
    ├── bootstrap/ (drwxr-xr-x)
      ├── libc.so
      ├── libdl.so
      ├── libdl_android.so
      ├── libm.so
    ├── capture_state_listener-aidl-V1-cpp.so
    ├── dnsresolver_aidl_interface-V6-cpp.so
    ├── gsi_aidl_interface-V1-cpp.so
    ├── heapprofd_client.so
    ├── hw/ (drwxr-xr-x)
      ├── android.hidl.memory@1.0-impl.so
      ├── audio.a2dp.default.so
    ├── ld-android.so
    ├── libAtbm783x.so
    ├── libEGL.so
    ├── libETC1.so
    ├── libFFTEm.so
    ├── libGLESv1_CM.so
    ├── libGLESv2.so
    ├── libGLESv3.so
    ├── libLLVM_android.so
    ├── libMemAdapter.so
    ├── libOpenMAXAL.so
    ├── libOpenSLES.so
    ├── libRS.so
    ├── libRSCacheDir.so
    ├── libRSCpuRef.so
    ├── libRSDriver.so
    ├── libRS_internal.so
    ├── libRScpp.so
    ├── libSurfaceFlingerProp.so
    ├── libUtility.so
    ├── libVE.so
    ├── libaaudio.so
    ├── libaaudio_internal.so
    ├── libaaudioservice.so
    ├── libadbd_auth.so
    ├── libadbd_fs.so
    ├── libadecoder.so
    ├── libadmanager_jni.so
    ├── libaencoder.so
    ├── libamidi.so
    ├── libandroid.so
    ├── libandroid_net.so
    ├── libandroid_runtime.so
    ├── libandroid_runtime_lazy.so
    ├── libandroid_servers.so
    ├── libandroidfw.so
    ├── libappfuse.so
    ├── libartpalette-system.so
    ├── libasyncio.so
    ├── libaudioclient.so
    ├── libaudioeffect_jni.so
    ├── libaudioflinger.so
    ├── libaudiofoundation.so
    ├── libaudiohal.so
    ├── libaudiohal@2.0.so
    ├── libaudiohal@4.0.so
    ├── libaudiohal@5.0.so
    ├── libaudiohal@6.0.so
    ├── libaudiohal_deathhandler.so
    ├── libaudiomanager.so
    ├── libaudiopolicy.so
    ├── libaudiopolicyenginedefault.so
    ├── libaudiopolicymanager.so
    ├── libaudiopolicymanagerdefault.so
    ├── libaudiopolicyservice.so
    ├── libaudioprocessing.so
    ├── libaudiospdif.so
    ├── libaudioutils.so
    ├── libavservices_minijail.so
    ├── libaw_aacdec.so
    ├── libaw_alacdec.so
    ├── libaw_amrdec.so
    ├── libaw_apedec.so
    ├── libaw_atrcdec.so
    ├── libaw_cookdec.so
    ├── libaw_dsddec.so
    ├── libaw_flacdec.so
    ├── libaw_g729dec.so
    ├── libaw_mp3dec.so
    ├── libaw_oggdec.so
    ├── libaw_opusdec.so
    ├── libaw_output.so
    ├── libaw_radec.so
    ├── libaw_sdi.so
    ├── libaw_siprdec.so
    ├── libaw_wavdec.so
    ├── libawadapter_base.so
    ├── libawav1.so
    ├── libawavs.so
    ├── libawavs2.so
    ├── libawh264.so
    ├── libawh265.so
    ├── libawimage_jni.so
    ├── libawmetadataretriever.so
    ├── libawmjpeg.so
    ├── libawmjpegplus.so
    ├── libawmpeg2.so
    ├── libawmpeg4dx.so
    ├── libawmpeg4h263.so
    ├── libawmpeg4normal.so
    ├── libawmpeg4vp6.so
    ├── libawplayer.so
    ├── libawvp6soft.so
    ├── libawvp8.so
    ├── libawvp9Hw.so
    ├── libawvp9HwAL.so
    ├── libawvp9soft.so
    ├── libawwmv12soft.so
    ├── libbacktrace.so
    ├── libbase.so
    ├── libbcc.so
    ├── libbcinfo.so
    ├── libbinder.so
    ├── libbinder_ndk.so
    ├── libbinderwrapper.so
    ├── libblas.so
    ├── libbluetooth.so
    ├── libbluetooth_jni.so
    ├── libbootanimation.so
    ├── libbootloader_message.so
    ├── libbpf.so
    ├── libbpf_android.so
    ├── libbrillo-binder.so
    ├── libbrillo-stream.so
    ├── libbrillo.so
    ├── libbufferhub.so
    ├── libbufferhubqueue.so
    ├── libc++.so
    ├── libc.so
    ├── libcamera2ndk.so
    ├── libcamera_client.so
    ├── libcamera_metadata.so
    ├── libcameraservice.so
    ├── libcap.so
    ├── libcdc_base.so
    ├── libcdv_output.so
    ├── libcdv_playback.so
    ├── libcdx_base.so
    ├── libcdx_common.so
    ├── libcdx_parser.so
    ├── libcdx_playback.so
    ├── libcdx_stream.so
    ├── libcgrouprc.so
    ├── libcheckfile.so
    ├── libchrome.so
    ├── libclang_rt.asan-arm-android.so
    ├── libclcore.bc
    ├── libclcore_debug.bc
    ├── libclcore_debug_g.bc
    ├── libclcore_g.bc
    ├── libclcore_neon.bc
    ├── libcodec2.so
    ├── libcodec2_client.so
    ├── libcodec2_hidl_client@1.0.so
    ├── libcodec2_hidl_client@1.1.so
    ├── libcodec2_vndk.so
    ├── libcompiler_rt.so
    ├── libcredstore_aidl.so
    ├── libcrypto.so
    ├── libcrypto_aw.so
    ├── libcrypto_utils.so
    ├── libcups.so
    ├── libcurl.so
    ├── libcutils.so
    ├── libcvbs_jni.so
    ├── libdataloader.so
    ├── libdatasource.so
    ├── libdebuggerd_client.so
    ├── libdexfile_support.so
    ├── libdiskconfig.so
    ├── libdisplayservicehidl.so
    ├── libdl.so
    ├── libdl_android.so
    ├── libdng_sdk.so
    ├── libdrmframework.so
    ├── libdrmframework_jni.so
    ├── libdrmframeworkcommon.so
    ├── libdrxsx7.so
    ├── libdrxsx7_hal.so
    ├── libdtvkit_platform.so
    ├── libdumpstateaidl.so
    ├── libdumpstateutil.so
    ├── libdumputils.so
    ├── libdvb_base.so
    ├── libdvb_core.so
    ├── libdvb_core_client.so
    ├── libdvb_demod.so
    ├── libdvb_demux.so
    ├── libdvb_no_ca.so
    ├── libdvb_sp.so
    ├── libdvb_tsc.so
    ├── libdvbcore_jni.so
    ├── libdynamic_depth.so
    ├── libeffectsconfig.so
    ├── libevent.so
    ├── libexif.so
    ├── libexpat.so
    ├── libext2_blkid.so
    ├── libext2_com_err.so
    ├── libext2_e2p.so
    ├── libext2_misc.so
    ├── libext2_quota.so
    ├── libext2_uuid.so
    ├── libext2fs.so
    ├── libext4_utils.so
    ├── libf2fs_sparseblock.so
    ├── libfbm.so
    ├── libfdtrack.so
    ├── libfec.so
    ├── libfilterfw.so
    ├── libfilterpack_imageproc.so
    ├── libfmq.so
    ├── libfs_mgr.so
    ├── libfs_mgr_binder.so
    ├── libft2.so
    ├── libgatekeeper.so
    ├── libgatekeeper_aidl.so
    ├── libgfxstats.so
    ├── libgifplayer.so
    ├── libgifplayer_jni.so
    ├── libgpio_jni.so
    ├── libgpioservice.so
    ├── libgpuservice.so
    ├── libgralloctypes.so
    ├── libgraphicsenv.so
    ├── libgsi.so
    ├── libgui.so
    ├── libhalcpucomm.so
    ├── libhaldemux.so
    ├── libhaldisplay.so
    ├── libhalspi.so
    ├── libhardware.so
    ├── libhardware_legacy.so
    ├── libharfbuzz_ng.so
    ├── libhdmi_jni.so
    ├── libheif.so
    ├── libhidcommand_jni.so
    ├── libhidl-gen-hash.so
    ├── libhidl-gen-utils.so
    ├── libhidlallocatorutils.so
    ├── libhidlbase.so
    ├── libhidlmemory.so
    ├── libhttp_base.so
    ├── libhttp_proxy.so
    ├── libhwui.so
    ├── libidmap2.so
    ├── libidmap2_policies.so
    ├── libimage_io.so
    ├── libimg_utils.so
    ├── libincfs.so
    ├── libincident.so
    ├── libincidentpriv.so
    ├── libinput.so
    ├── libinputflinger.so
    ├── libinputflinger_base.so
    ├── libinputreader.so
    ├── libinputreporter.so
    ├── libinputservice.so
    ├── libion.so
    ├── libiprocesser.so
    ├── libiprouteutil.so
    ├── libisomountmanager_jni.so
    ├── libisomountmanagerservice.so
    ├── libjni_WFDManager.so
    ├── libjni_pacprocessor.so
    ├── libjni_swos.so
    ├── libjnigraphics.so
    ├── libjpeg.so
    ├── libjsoncpp.so
    ├── libkeymaster4_1support.so
    ├── libkeymaster4support.so
    ├── libkeymaster_messages.so
    ├── libkeymaster_portable.so
    ├── libkeystone.so
    ├── libkeystore-attestation-application-id.so
    ├── libkeystore-engine.so
    ├── libkeystore_aidl.so
    ├── libkeystore_binder.so
    ├── libkeystore_parcelables.so
    ├── libkeyutils.so
    ├── liblayers_proto.so
    ├── libldacBT_abr.so
    ├── libldacBT_enc.so
    ├── liblive555.so
    ├── liblog.so
    ├── liblogwrap.so
    ├── liblp.so
    ├── liblpdump.so
    ├── liblpdump_interface-V1-cpp.so
    ├── liblzma.so
    ├── libm.so
    ├── libmdnssd.so
    ├── libmedia.so
    ├── libmedia_codeclist.so
    ├── libmedia_helper.so
    ├── libmedia_jni.so
    ├── libmedia_jni_utils.so
    ├── libmedia_omx.so
    ├── libmedia_omx_client.so
    ├── libmediadrm.so
    ├── libmediadrmmetrics_consumer.so
    ├── libmediadrmmetrics_full.so
    ├── libmediadrmmetrics_lite.so
    ├── libmediaextractorservice.so
    ├── libmedialogservice.so
    ├── libmediametrics.so
    ├── libmediametricsservice.so
    ├── libmediandk.so
    ├── libmediandk_utils.so
    ├── libmediaplayerservice.so
    ├── libmediautils.so
    ├── libmeminfo.so
    ├── libmemtrack.so
    ├── libmemunreachable.so
    ├── libminijail.so
    ├── libminikin.so
    ├── libmpeg4base.so
    ├── libmtp.so
    ├── libmultiir.so
    ├── libmultiir_jni.so
    ├── libmultiirservice.so
    ├── libnativebridge_lazy.so
    ├── libnativedisplay.so
    ├── libnativeloader_lazy.so
    ├── libnativewindow.so
    ├── libnbaio.so
    ├── libnblog.so
    ├── libnetd_client.so
    ├── libnetdbpf.so
    ├── libnetdutils.so
    ├── libnetlink.so
    ├── libnetutils.so
    ├── libneuralnetworks_packageinfo.so
    ├── libnfc-nci.so
    ├── libnfc_nci_jni.so
    ├── libpackagelistparser.so
    ├── libpassthrua.so
    ├── libpassthrud.so
    ├── libpcap.so
    ├── libpcre2.so
    ├── libpdfium.so
    ├── libpdx_default_transport.so
    ├── libpiex.so
    ├── libpng.so
    ├── libpower.so
    ├── libpowermanager.so
    ├── libpppoe-jni.so
    ├── libprintspooler_jni.so
    ├── libprocessgroup.so
    ├── libprocessgroup_setup.so
    ├── libprocinfo.so
    ├── libprotobuf-cpp-full.so
    ├── libprotobuf-cpp-lite.so
    ├── libprotoutil.so
    ├── libpsi.so
    ├── libpuresoftkeymasterdevice.so
    ├── libqtaguid.so
    ├── libradio_metadata.so
    ├── libresourcemanagerservice.so
    ├── librs_jni.so
    ├── librtp.so
    ├── librtp_jni.so
    ├── libsbm.so
    ├── libscaledown.so
    ├── libschedulerservicehidl.so
    ├── libselinux.so
    ├── libsensor.so
    ├── libsensorprivacy.so
    ├── libsensorservice.so
    ├── libsensorservicehidl.so
    ├── libservices.so
    ├── libsfplugin_ccodec.so
    ├── libsfplugin_ccodec_utils.so
    ├── libsigchain.so
    ├── libsoft_attestation_cert.so
    ├── libsoftkeymasterdevice.so
    ├── libsonic.so
    ├── libsonivox.so
    ├── libsoundpool.so
    ├── libsparse.so
    ├── libspeexresampler.so
    ├── libsqlite.so
    ├── libsquashfs_utils.so
    ├── libssl.so
    ├── libsst.so
    ├── libstagefright.so
    ├── libstagefright_amrnb_common.so
    ├── libstagefright_bufferpool@2.0.1.so
    ├── libstagefright_bufferqueue_helper.so
    ├── libstagefright_codecbase.so
    ├── libstagefright_flacdec.so
    ├── libstagefright_foundation.so
    ├── libstagefright_framecapture_utils.so
    ├── libstagefright_hdcp.so
    ├── libstagefright_http_support.so
    ├── libstagefright_httplive.so
    ├── libstagefright_omx.so
    ├── libstagefright_omx_utils.so
    ├── libstagefright_wfd.so
    ├── libstagefright_xmlparser.so
    ├── libstatshidl.so
    ├── libstatslog.so
    ├── libstdc++.so
    ├── libsubdecoder.so
    ├── libsurfaceflinger.so
    ├── libsync.so
    ├── libsystemmix_jni.so
    ├── libsystemmixservice.so
    ├── libsysutils.so
    ├── libteec.so
    ├── libtimeinstate.so
    ├── libtimestats.so
    ├── libtimestats_proto.so
    ├── libtinyalsa.so
    ├── libtinyxml2.so
    ├── libtinyxml_trid.so
    ├── libtombstoned_client.so
    ├── libtuner_R842.so
    ├── libtuner_atbm253.so
    ├── libtuner_base.so
    ├── libtuner_si2151.so
    ├── libtv_frontend.so
    ├── libui.so
    ├── libunwindstack.so
    ├── libusbhost.so
    ├── libutils.so
    ├── libutilscallstack.so
    ├── libvdecoder.so
    ├── libvenc_base.so
    ├── libvenc_common.so
    ├── libvenc_h264.so
    ├── libvenc_h265.so
    ├── libvenc_jpeg.so
    ├── libvencoder.so
    ├── libvibrator.so
    ├── libvideoengine.so
    ├── libvintf.so
    ├── libvkjson.so
    ├── libvndksupport.so
    ├── libvulkan.so
    ├── libwebviewchromium_loader.so
    ├── libwebviewchromium_plat_support.so
    ├── libwfdmanager.so
    ├── libwfdplayer.so
    ├── libwfdrtsp.so
    ├── libwfds.so
    ├── libwifi-system-iface.so
    ├── libwilhelm.so
    ├── libxmetadata_retriever.so
    ├── libxml2.so
    ├── libxplayer.so
    ├── libyuv.so
    ├── libz.so
    ├── libziparchive.so
    ├── netd_aidl_interface-V4-cpp.so
    ├── netd_event_listener_interface-V1-cpp.so
    ├── oemnetd_aidl_interface-V1-cpp.so
    ├── pppol2tp-android.so
    ├── pppopptp-android.so
    ├── server_configurable_flags.so
    ├── service.incremental.so
    ├── slicer.so
    ├── suspend_control_aidl_interface-V1-cpp.so
    ├── vendor.aw.homlet.tvsystem.tvserver@1.0.so
    ├── vendor.aw.tvserver@1.0.so
  ├── media/ (drwxr-xr-x)
    ├── bootanimation.zip
  ├── preinstall/ (drwxr-xr-x)
  ├── priv-app/ (drwxr-xr-x)
    ├── ATV_Katniss/ (drwxr-xr-x)
      ├── ATV_Katniss.apk
      ├── lib/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── libassistant_android.so
          ├── libaudioplayer.so
          ├── libelements.so
          ├── libframesequence.so
          ├── libgeller_jni_lib.so
          ├── libgoogle_speech_micro_jni.so
          ├── libmappedcountercacheversionjni.so
          ├── libnative_crash_handler_jni.so
          ├── libogg_opus_encoder.so
          ├── libopuscodec.so
          ├── libspeexcodec.so
          ├── libvcdiffjni.so
          ├── libwebrtc_apm.so
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── ATV_Katniss.odex
          ├── ATV_Katniss.vdex
    ├── AwManager/ (drwxr-xr-x)
      ├── AwManager.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── AwManager.odex
          ├── AwManager.vdex
    ├── AwTvProvision/ (drwxr-xr-x)
      ├── AwTvProvision.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── AwTvProvision.odex
          ├── AwTvProvision.vdex
    ├── BackupRestoreConfirmation/ (drwxr-xr-x)
      ├── BackupRestoreConfirmation.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── BackupRestoreConfirmation.odex
          ├── BackupRestoreConfirmation.vdex
    ├── BlockedNumberProvider/ (drwxr-xr-x)
      ├── BlockedNumberProvider.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── BlockedNumberProvider.odex
          ├── BlockedNumberProvider.vdex
    ├── BuiltInPrintService/ (drwxr-xr-x)
      ├── BuiltInPrintService.apk
      ├── lib/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── libcups.so
          ├── libwfds.so
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── BuiltInPrintService.odex
          ├── BuiltInPrintService.vdex
    ├── CellBroadcastServiceModulePlatform/ (drwxr-xr-x)
      ├── CellBroadcastServiceModulePlatform.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── CellBroadcastServiceModulePlatform.odex
          ├── CellBroadcastServiceModulePlatform.vdex
    ├── CtsShimPrivPrebuilt/ (drwxr-xr-x)
      ├── CtsShimPrivPrebuilt.apk
    ├── DocumentsUI/ (drwxr-xr-x)
      ├── DocumentsUI.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── DocumentsUI.odex
          ├── DocumentsUI.vdex
    ├── DownloadProvider/ (drwxr-xr-x)
      ├── DownloadProvider.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── DownloadProvider.odex
          ├── DownloadProvider.vdex
    ├── DownloadProviderUi/ (drwxr-xr-x)
      ├── DownloadProviderUi.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── DownloadProviderUi.odex
          ├── DownloadProviderUi.vdex
    ├── DynamicSystemInstallationService/ (drwxr-xr-x)
      ├── DynamicSystemInstallationService.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── DynamicSystemInstallationService.odex
          ├── DynamicSystemInstallationService.vdex
    ├── ExternalStorageProvider/ (drwxr-xr-x)
      ├── ExternalStorageProvider.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── ExternalStorageProvider.odex
          ├── ExternalStorageProvider.vdex
    ├── FusedLocation/ (drwxr-xr-x)
      ├── FusedLocation.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── FusedLocation.odex
          ├── FusedLocation.vdex
    ├── GoogleServicesFramework/ (drwxr-xr-x)
      ├── GoogleServicesFramework.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── GoogleServicesFramework.odex
          ├── GoogleServicesFramework.vdex
    ├── InProcessNetworkStack/ (drwxr-xr-x)
      ├── InProcessNetworkStack.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── InProcessNetworkStack.odex
          ├── InProcessNetworkStack.vdex
    ├── InputDevices/ (drwxr-xr-x)
      ├── InputDevices.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── InputDevices.odex
          ├── InputDevices.vdex
    ├── LocalTransport/ (drwxr-xr-x)
      ├── LocalTransport.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── LocalTransport.odex
          ├── LocalTransport.vdex
    ├── ManagedProvisioning/ (drwxr-xr-x)
      ├── ManagedProvisioning.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── ManagedProvisioning.odex
          ├── ManagedProvisioning.vdex
    ├── MediaProviderLegacy/ (drwxr-xr-x)
      ├── MediaProviderLegacy.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── MediaProviderLegacy.odex
          ├── MediaProviderLegacy.vdex
    ├── MtpService/ (drwxr-xr-x)
      ├── MtpService.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── MtpService.odex
          ├── MtpService.vdex
    ├── MusicFX/ (drwxr-xr-x)
      ├── MusicFX.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── MusicFX.odex
          ├── MusicFX.vdex
    ├── PackageInstaller/ (drwxr-xr-x)
      ├── PackageInstaller.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── PackageInstaller.odex
          ├── PackageInstaller.vdex
    ├── PlatformNetworkPermissionConfig/ (drwxr-xr-x)
      ├── PlatformNetworkPermissionConfig.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── PlatformNetworkPermissionConfig.odex
          ├── PlatformNetworkPermissionConfig.vdex
    ├── PlayStoreTv/ (drwxr-xr-x)
      ├── PlayStoreTv.apk
      ├── lib/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── libbrotli.so
          ├── libconscrypt_jni.so
          ├── libcronet.114.0.5735.84.so
          ├── libempty_armeabi-v7a.so
          ├── libmappedcountercacheversionjni.so
          ├── libphonesky_data_loader.so
          ├── libtensorflowlite_jni.so
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── PlayStoreTv.odex
          ├── PlayStoreTv.vdex
    ├── PrebuiltGmsCore/ (drwxr-xr-x)
      ├── PrebuiltGmsCore.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── PrebuiltGmsCore.odex
          ├── PrebuiltGmsCore.vdex
    ├── ProxyHandler/ (drwxr-xr-x)
      ├── ProxyHandler.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── ProxyHandler.odex
          ├── ProxyHandler.vdex
    ├── SettingsAssist/ (drwxr-xr-x)
      ├── SettingsAssist.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── SettingsAssist.odex
          ├── SettingsAssist.vdex
    ├── SettingsProvider/ (drwxr-xr-x)
      ├── SettingsProvider.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── SettingsProvider.odex
          ├── SettingsProvider.vdex
    ├── SharedStorageBackup/ (drwxr-xr-x)
      ├── SharedStorageBackup.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── SharedStorageBackup.odex
          ├── SharedStorageBackup.vdex
    ├── Shell/ (drwxr-xr-x)
      ├── Shell.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── Shell.odex
          ├── Shell.vdex
    ├── SoundPicker/ (drwxr-xr-x)
      ├── SoundPicker.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── SoundPicker.odex
          ├── SoundPicker.vdex
    ├── StatementService/ (drwxr-xr-x)
      ├── StatementService.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── StatementService.odex
          ├── StatementService.vdex
    ├── TvProvider/ (drwxr-xr-x)
      ├── TvProvider.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── TvProvider.odex
          ├── TvProvider.vdex
    ├── UserDictionaryProvider/ (drwxr-xr-x)
      ├── UserDictionaryProvider.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── UserDictionaryProvider.odex
          ├── UserDictionaryProvider.vdex
    ├── VideoInputService/ (drwxr-xr-x)
      ├── VideoInputService.apk
      ├── lib/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── libcvbs_jni.so
          ├── libhdmi_jni.so
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── VideoInputService.odex
          ├── VideoInputService.vdex
    ├── VpnDialogs/ (drwxr-xr-x)
      ├── VpnDialogs.apk
      ├── oat/ (drwxr-xr-x)
        ├── arm/ (drwxr-xr-x)
          ├── VpnDialogs.odex
          ├── VpnDialogs.vdex
  ├── product
  ├── shortcuts.config
  ├── system_ext/ (drwxr-xr-x)
    ├── build.prop
    ├── etc/ (drwxr-xr-x)
      ├── NOTICE.xml.gz
      ├── compatconfig/ (drwxr-xr-x)
        ├── settings-platform-compat-config.xml
      ├── group
      ├── passwd
      ├── permissions/ (drwxr-xr-x)
        ├── com.android.cellbroadcastreceiver.xml
        ├── com.android.settings.xml
        ├── com.android.storagemanager.xml
        ├── com.android.systemui.xml
        ├── com.softwinner.screenshot.xml
        ├── privapp-settingssetup.xml
      ├── selinux/ (drwxr-xr-x)
        ├── system_ext_file_contexts
        ├── system_ext_hwservice_contexts
        ├── system_ext_mac_permissions.xml
        ├── system_ext_property_contexts
        ├── system_ext_seapp_contexts
        ├── system_ext_sepolicy.cil
        ├── system_ext_sepolicy_and_mapping.sha256
        ├── system_ext_service_contexts
      ├── vintf/ (drwxr-xr-x)
        ├── manifest.xml
    ├── priv-app/ (drwxr-xr-x)
      ├── CellBroadcastAppPlatform/ (drwxr-xr-x)
        ├── CellBroadcastAppPlatform.apk
        ├── oat/ (drwxr-xr-x)
          ├── arm/ (drwxr-xr-x)
            ├── CellBroadcastAppPlatform.odex
            ├── CellBroadcastAppPlatform.vdex
      ├── Screenshot/ (drwxr-xr-x)
        ├── Screenshot.apk
        ├── oat/ (drwxr-xr-x)
          ├── arm/ (drwxr-xr-x)
            ├── Screenshot.odex
            ├── Screenshot.vdex
      ├── Settings/ (drwxr-xr-x)
        ├── Settings.apk
        ├── oat/ (drwxr-xr-x)
          ├── arm/ (drwxr-xr-x)
            ├── Settings.odex
            ├── Settings.vdex
      ├── SettingsSetup/ (drwxr-xr-x)
        ├── SettingsSetup.apk
        ├── oat/ (drwxr-xr-x)
          ├── arm/ (drwxr-xr-x)
            ├── SettingsSetup.odex
            ├── SettingsSetup.vdex
      ├── StorageManager/ (drwxr-xr-x)
        ├── StorageManager.apk
        ├── oat/ (drwxr-xr-x)
          ├── arm/ (drwxr-xr-x)
            ├── StorageManager.odex
            ├── StorageManager.vdex
      ├── SystemUI/ (drwxr-xr-x)
        ├── SystemUI.apk
        ├── oat/ (drwxr-xr-x)
          ├── arm/ (drwxr-xr-x)
            ├── SystemUI.odex
            ├── SystemUI.vdex
      ├── WallpaperCropper/ (drwxr-xr-x)
        ├── WallpaperCropper.apk
        ├── oat/ (drwxr-xr-x)
          ├── arm/ (drwxr-xr-x)
            ├── WallpaperCropper.odex
            ├── WallpaperCropper.vdex
  ├── usr/ (drwxr-xr-x)
    ├── hyphen-data/ (drwxr-xr-x)
      ├── hyph-as.hyb
      ├── hyph-as.lic.txt
      ├── hyph-be.hyb
      ├── hyph-be.lic.txt
      ├── hyph-bg.hyb
      ├── hyph-bg.lic.txt
      ├── hyph-bn.hyb
      ├── hyph-bn.lic.txt
      ├── hyph-cu.hyb
      ├── hyph-cu.lic.txt
      ├── hyph-cy.hyb
      ├── hyph-cy.lic.txt
      ├── hyph-da.hyb
      ├── hyph-da.lic.txt
      ├── hyph-de-1901.hyb
      ├── hyph-de-1901.lic.txt
      ├── hyph-de-1996.hyb
      ├── hyph-de-1996.lic.txt
      ├── hyph-de-ch-1901.hyb
      ├── hyph-de-ch-1901.lic.txt
      ├── hyph-en-gb.hyb
      ├── hyph-en-gb.lic.txt
      ├── hyph-en-us.hyb
      ├── hyph-en-us.lic.txt
      ├── hyph-es.hyb
      ├── hyph-es.lic.txt
      ├── hyph-et.hyb
      ├── hyph-et.lic.txt
      ├── hyph-eu.hyb
      ├── hyph-eu.lic.txt
      ├── hyph-fr.hyb
      ├── hyph-fr.lic.txt
      ├── hyph-ga.hyb
      ├── hyph-ga.lic.txt
      ├── hyph-gu.hyb
      ├── hyph-gu.lic.txt
      ├── hyph-hi.hyb
      ├── hyph-hi.lic.txt
      ├── hyph-hr.hyb
      ├── hyph-hr.lic.txt
      ├── hyph-hu.hyb
      ├── hyph-hu.lic.txt
      ├── hyph-hy.hyb
      ├── hyph-hy.lic.txt
      ├── hyph-kn.hyb
      ├── hyph-kn.lic.txt
      ├── hyph-la.hyb
      ├── hyph-la.lic.txt
      ├── hyph-ml.hyb
      ├── hyph-ml.lic.txt
      ├── hyph-mn-cyrl.hyb
      ├── hyph-mn-cyrl.lic.txt
      ├── hyph-mr.hyb
      ├── hyph-mr.lic.txt
      ├── hyph-nb.hyb
      ├── hyph-nb.lic.txt
      ├── hyph-nn.hyb
      ├── hyph-nn.lic.txt
      ├── hyph-or.hyb
      ├── hyph-or.lic.txt
      ├── hyph-pa.hyb
      ├── hyph-pa.lic.txt
      ├── hyph-pt.hyb
      ├── hyph-pt.lic.txt
      ├── hyph-sl.hyb
      ├── hyph-sl.lic.txt
      ├── hyph-ta.hyb
      ├── hyph-ta.lic.txt
      ├── hyph-te.hyb
      ├── hyph-te.lic.txt
      ├── hyph-tk.hyb
      ├── hyph-tk.lic.txt
      ├── hyph-und-ethi.hyb
      ├── hyph-und-ethi.lic.txt
    ├── icu
    ├── idc/ (drwxr-xr-x)
      ├── AVRCP.idc
      ├── qwerty.idc
      ├── qwerty2.idc
    ├── keychars/ (drwxr-xr-x)
      ├── Generic.kcm
      ├── Vendor_18d1_Product_0200.kcm
      ├── Vendor_18d1_Product_5018.kcm
      ├── Virtual.kcm
      ├── qwerty.kcm
      ├── qwerty2.kcm
    ├── keylayout/ (drwxr-xr-x)
      ├── AVRCP.kl
      ├── Generic.kl
      ├── Vendor_000e_Product_3412.kl
      ├── Vendor_0079_Product_0011.kl
      ├── Vendor_0079_Product_18d4.kl
      ├── Vendor_044f_Product_b326.kl
      ├── Vendor_045e_Product_028e.kl
      ├── Vendor_045e_Product_028f.kl
      ├── Vendor_045e_Product_02a1.kl
      ├── Vendor_045e_Product_02d1.kl
      ├── Vendor_045e_Product_02dd.kl
      ├── Vendor_045e_Product_02e0.kl
      ├── Vendor_045e_Product_02e3.kl
      ├── Vendor_045e_Product_02ea.kl
      ├── Vendor_045e_Product_02fd.kl
      ├── Vendor_045e_Product_0b12.kl
      ├── Vendor_046d_Product_b501.kl
      ├── Vendor_046d_Product_c216.kl
      ├── Vendor_046d_Product_c219.kl
      ├── Vendor_046d_Product_c21d.kl
      ├── Vendor_046d_Product_c21e.kl
      ├── Vendor_046d_Product_c21f.kl
      ├── Vendor_046d_Product_c242.kl
      ├── Vendor_046d_Product_c294.kl
      ├── Vendor_046d_Product_c299.kl
      ├── Vendor_046d_Product_c532.kl
      ├── Vendor_0504_Product_0000.kl
      ├── Vendor_054c_Product_0268.kl
      ├── Vendor_054c_Product_0268_Version_8000.kl
      ├── Vendor_054c_Product_0268_Version_8100.kl
      ├── Vendor_054c_Product_0268_Version_8111.kl
      ├── Vendor_054c_Product_05c4.kl
      ├── Vendor_054c_Product_05c4_Version_8000.kl
      ├── Vendor_054c_Product_05c4_Version_8100.kl
      ├── Vendor_054c_Product_05c4_Version_8111.kl
      ├── Vendor_054c_Product_09cc.kl
      ├── Vendor_054c_Product_09cc_Version_8000.kl
      ├── Vendor_054c_Product_09cc_Version_8100.kl
      ├── Vendor_054c_Product_09cc_Version_8111.kl
      ├── Vendor_054c_Product_0ba0.kl
      ├── Vendor_054c_Product_0ba0_Version_8111.kl
      ├── Vendor_056e_Product_2004.kl
      ├── Vendor_057e_Product_2009.kl
      ├── Vendor_0583_Product_2060.kl
      ├── Vendor_05ac_Product_0239.kl
      ├── Vendor_06a3_Product_f51a.kl
      ├── Vendor_0738_Product_4716.kl
      ├── Vendor_0738_Product_4718.kl
      ├── Vendor_0738_Product_4726.kl
      ├── Vendor_0738_Product_4736.kl
      ├── Vendor_0738_Product_4740.kl
      ├── Vendor_0738_Product_9871.kl
      ├── Vendor_0738_Product_b726.kl
      ├── Vendor_0738_Product_beef.kl
      ├── Vendor_0738_Product_cb02.kl
      ├── Vendor_0738_Product_cb03.kl
      ├── Vendor_0738_Product_cb29.kl
      ├── Vendor_0738_Product_f738.kl
      ├── Vendor_07ff_Product_ffff.kl
      ├── Vendor_0b05_Product_4500.kl
      ├── Vendor_0e6f_Product_0113.kl
      ├── Vendor_0e6f_Product_011f.kl
      ├── Vendor_0e6f_Product_0131.kl
      ├── Vendor_0e6f_Product_0133.kl
      ├── Vendor_0e6f_Product_0139.kl
      ├── Vendor_0e6f_Product_013a.kl
      ├── Vendor_0e6f_Product_0146.kl
      ├── Vendor_0e6f_Product_0147.kl
      ├── Vendor_0e6f_Product_0161.kl
      ├── Vendor_0e6f_Product_0162.kl
      ├── Vendor_0e6f_Product_0163.kl
      ├── Vendor_0e6f_Product_0164.kl
      ├── Vendor_0e6f_Product_0165.kl
      ├── Vendor_0e6f_Product_0201.kl
      ├── Vendor_0e6f_Product_0213.kl
      ├── Vendor_0e6f_Product_021f.kl
      ├── Vendor_0e6f_Product_0246.kl
      ├── Vendor_0e6f_Product_02a4.kl
      ├── Vendor_0e6f_Product_02a6.kl
      ├── Vendor_0e6f_Product_02ab.kl
      ├── Vendor_0e6f_Product_0301.kl
      ├── Vendor_0e6f_Product_0346.kl
      ├── Vendor_0e6f_Product_0401.kl
      ├── Vendor_0e6f_Product_0413.kl
      ├── Vendor_0e6f_Product_0501.kl
      ├── Vendor_0e6f_Product_f900.kl
      ├── Vendor_0f0d_Product_000a.kl
      ├── Vendor_0f0d_Product_000c.kl
      ├── Vendor_0f0d_Product_0067.kl
      ├── Vendor_1038_Product_1412.kl
      ├── Vendor_1038_Product_1430.kl
      ├── Vendor_1038_Product_1431.kl
      ├── Vendor_11c9_Product_55f0.kl
      ├── Vendor_12ab_Product_0301.kl
      ├── Vendor_12bd_Product_d015.kl
      ├── Vendor_1430_Product_4748.kl
      ├── Vendor_1430_Product_f801.kl
      ├── Vendor_146b_Product_0601.kl
      ├── Vendor_1532_Product_0037.kl
      ├── Vendor_1532_Product_0900.kl
      ├── Vendor_1532_Product_0a03.kl
      ├── Vendor_15e4_Product_3f00.kl
      ├── Vendor_15e4_Product_3f0a.kl
      ├── Vendor_15e4_Product_3f10.kl
      ├── Vendor_162e_Product_beef.kl
      ├── Vendor_1689_Product_fd00.kl
      ├── Vendor_1689_Product_fd01.kl
      ├── Vendor_1689_Product_fe00.kl
      ├── Vendor_18d1_Product_0200.kl
      ├── Vendor_18d1_Product_2c40.kl
      ├── Vendor_18d1_Product_5018.kl
      ├── Vendor_1949_Product_0401.kl
      ├── Vendor_1bad_Product_0002.kl
      ├── Vendor_1bad_Product_f016.kl
      ├── Vendor_1bad_Product_f021.kl
      ├── Vendor_1bad_Product_f023.kl
      ├── Vendor_1bad_Product_f025.kl
      ├── Vendor_1bad_Product_f027.kl
      ├── Vendor_1bad_Product_f028.kl
      ├── Vendor_1bad_Product_f036.kl
      ├── Vendor_1bad_Product_f038.kl
      ├── Vendor_1bad_Product_f501.kl
      ├── Vendor_1bad_Product_f506.kl
      ├── Vendor_1bad_Product_f900.kl
      ├── Vendor_1bad_Product_f901.kl
      ├── Vendor_1bad_Product_f903.kl
      ├── Vendor_1bad_Product_f904.kl
      ├── Vendor_1bad_Product_fa01.kl
      ├── Vendor_1bad_Product_fd00.kl
      ├── Vendor_1bad_Product_fd01.kl
      ├── Vendor_1d5a_Product_c081.kl
      ├── Vendor_1d79_Product_0009.kl
      ├── Vendor_20bc_Product_5500.kl
      ├── Vendor_22b8_Product_093d.kl
      ├── Vendor_2378_Product_1008.kl
      ├── Vendor_2378_Product_100a.kl
      ├── Vendor_24c6_Product_5300.kl
      ├── Vendor_24c6_Product_5303.kl
      ├── Vendor_24c6_Product_530a.kl
      ├── Vendor_24c6_Product_531a.kl
      ├── Vendor_24c6_Product_5397.kl
      ├── Vendor_24c6_Product_541a.kl
      ├── Vendor_24c6_Product_542a.kl
      ├── Vendor_24c6_Product_543a.kl
      ├── Vendor_24c6_Product_5500.kl
      ├── Vendor_24c6_Product_5501.kl
      ├── Vendor_24c6_Product_5506.kl
      ├── Vendor_24c6_Product_550d.kl
      ├── Vendor_24c6_Product_551a.kl
      ├── Vendor_24c6_Product_561a.kl
      ├── Vendor_24c6_Product_5b02.kl
      ├── Vendor_24c6_Product_5d04.kl
      ├── Vendor_24c6_Product_fafe.kl
      ├── Vendor_28de_Product_1102.kl
      ├── Vendor_2b54_Product_1600.kl
      ├── qwerty.kl
      ├── sunxi-keyboard.kl
    ├── share/ (drwxr-xr-x)
      ├── bmd/ (drwxr-xr-x)
        ├── RFFspeed_501.bmd
        ├── RFFstd_501.bmd
      ├── zoneinfo/ (drwxr-xr-x)
        ├── tz_version
        ├── tzdata
  ├── vendor
```

---

