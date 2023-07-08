# CCBench
  
  
Benchmark apps for static analyzing native world of Android applications.

+ First: 2021 Nov 16 

16 apps 

In CCBench, native code contains __android_log_print,else

In CCBench_jucify,native code contains LOG

ccbench

|                               | real Leak | JN-SAF | JuCify | JNFuzz-Droid |
| ----------------------------- | --------- | ------ | ------ | ------------ |
| condition1.apk                | √         | ×      | √      | √            |
| explosion_path2.apk           | √         | ×      | √      | √            |
| math_library.apk              | √         | ×      | ×      | √            |
| smt1.apk                      | ×         | √      | ×      | ×            |
| switch1.apk                   | ×         | √      | ×      | ×            |
| while1.apk                    | √         | ×      | √      | √            |
| atoll.apk                     | √         | ×      | ×      | √            |
| strcpy.apk                    | √         | ×      | √      | √            |
| strcpy1.apk                   | √         | ×      | ×      | √            |
| tcp_client.apk                | √√        | ××     | √×     | √√           |
| udp_client.apk                | √√        | ××     | √×     | √√           |
| native_metho_overloading.apk  | √         | √      | ×      | √            |
| native_metho_overloading1.apk | √         | ×      | √      | √            |
| interrupt_cfg.apk             | √         | ×      | √      | √            |
| weak.apk                      | √         | ×      | √      | √            |
| log_noleak.apk                | ×         | ×      | √      | ×            |


+ 2022 Nov 31
add arm arch alone

|                               | real Leak | JN-SAF | JuCify | JNFuzz-Droid |
| ----------------------------- | --------- | ------ | ------ | ------------ |
| armeabi.apk                   | √         | √      | √      | √            |
| armeabi_v7a.apk               | √         | √      | √      | √            |
| arm64_v8a.apk                 | √         | ×      | √      | √            |

+ 2023 Jau 1
add thread apk

|                               | real Leak | JN-SAF | JuCify | JNFuzz-Droid |
| ----------------------------- | --------- | ------ | ------ | ------------ |
| thread.apk                    | √         | √      | √      | √            |
| thread_in_leak.apk            | √         | √      | √      | √            |
| thread_noleak.apk             | ×         | ×      | ×      | ×            |
| global_imei.apk               | √         | √      | √      | √            |



