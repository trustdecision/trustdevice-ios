<p align="center">
  <a href="https://www.trustdecision.com/deviceFingerprint" >
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="images/logo_light.png" />
      <source media="(prefers-color-scheme: light)" srcset="images/logo_dark.png" />
      <img src="images/logo_dark.png" alt="trustdevice logo" width="729px" height="67px"/>    </picture>
  </a>
</p>

<p align="center">
  <img src="images/demoApp.gif" width="195">
</p>


# TrustDevice-iOS
A lightweight library for determining device uniqueness and risk identification.

Create a device identifier based on basic device information.

Will remain the same after uninstalling and reinstalling or clearing app data.

## Quick Start 

### 1. Add Dependcy

TrustDecision is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
# Podfile
pod 'TrustDecision', '1.5'
```

### 2. Get DeviceInfo
DeviceInfo contains device id, risk information and device details.

#### Objective-C

```objective-c
#import <TrustDecision/TDMobRisk.h>

TDMobRiskManager_t *manager = [TDMobRiskManager sharedManager];
NSMutableDictionary *options = [[NSMutableDictionary alloc] init];
[options setObject:^(NSDictionary *response) {
    // Response in sub-thread, do something with the response
    // Get DeviceId
    NSString *deviceId = response[@"device_id"];
    // Get DeviceRiskLabel
    NSDictionary *deviceRisk = response[@"device_risk_label"];
    // Get DeviceDetail
    NSDictionary *deviceDetail = response[@"device_detail"];
} forKey:@"callback"];
manager->initWithOptions(options);
```

#### Swift

```swift
import TrustDecision

var options = [String : NSObject]()
let responseCallback: ([String : Any])-> Void = { response in
    // Response in sub-thread, do something with the response
    // Get DeviceId
    let deviceId = response["device_id"]   
    // Get DeviceRiskLabel
    let deviceRisk = response["device_risk_label"]
    // Get DeviceDetail
    let deviceDetail = response["device_detail"]                                         
}
options["callback"] = unsafeBitCast(responseCallback as @convention(block) ([String : Any]) -> Void, to: AnyObject.self) as? NSObject
let manager = TDMobRiskManager.sharedManager()
manager?.pointee.initWithOptions(options)
```

## Data Sample
```json
{
    "device_id":"4b3491c6bb6a27c6c58a038939a10d4cad97555e517574e7bd0291db96243859",
    "device_risk_label":{
        "jailbreak":false,
        "simulator":false,
        "debug":true
    },
    "device_detail":{
        "displayResolution":"828.0x1792.0",
        "deviceModel":"N104AP",
        "kernelVersion":"Darwin Kernel Version 22.6.0: Wed Jun 28 20:51:23 PDT 2023; root:xnu-8796.142.1~1\/RELEASE_ARM64_T8030",
        "debug":true,
        "sandboxPath":"3CDAE89E-1D51-4DD2-941C-02B2780021FF",
        "mcc":"460",
        "batteryState":2,
        "teamName":"XXX XXX Technology Co., Ltd.",
        "cloudid":"316A8157-B4E5-4F40-BE37-8115588CA734",
        "bundleId":"com.trustdevice.fingerprint",
        "appVersion":"1.0",
        "timeZone":"Asia\/Shanghai",
        "applicationId":"R3F7G5M76J.com.trustdevice.fingerprint",
        "freeDiskSpace":4820676608,
        "physicalMemory":"8333852672",
        "currentTime":1693451898456090,
        "totalDiskSpace":127933894656,
        "mnc":"02",
        "appInstallTime":1679884827203788.8,
        "osVersion":"20G75",
        "hostName":"ssd",
        "osType":"Darwin",
        "deviceType":"iPhone",
        "displayScale":2,
        "idfv":"E5082421-F447-4B45-B453-22C656B56314",
        "osRelease":"22.6.0",
        "memorySize":"4038885376",
        "deviceName":"iOS",
        "cpuCount":"6",
        "isiOSAppOnMac":0,
        "simulator":false,
        "jailbreak":false,
        "bootTime":1692954854089697,
        "secureKernelStatus":true
    }
}
```
## Open Source Features

+ Basic device ID, consistent when uninstalling applications and reinstalling
+ Basic equipment information, which can be used for simple data analysis
+ Basic risk identification ability

| RiskLabel | Risk Description                                             |
| --------- | ------------------------------------------------------------ |
| jailbreak | Attackers will have higher privileges and can install many cheating software to affect the normal development of application business. |
| simulator | The simulator provides many simulation functions, which will affect the normal operation of applications, such as virtual positioning. |
| debug     | Applications can be modified by attackers at will, and the program will return unexpected values. |


## Open Source VS Pro
|            Ability            | Open Source |                             Pro                              |
| :---------------------------: | :---------: | :----------------------------------------------------------: |
|       100% open source        |     Yes     |                              No                              |
|           Device ID           |    Basic    | Extremely stable, even if the device is restored to factory settings, it can still be recognized as the same |
|       Device Risk Label       |    Basic    |                        Extremely rich                        |
|        Device Details         |    Basic    |                        Extremely rich                        |
|          IP Location          |      -      |                              ✓                               |
|       Device Risk Score       |      -      |                              ✓                               |
|  Environment Risk Evaluation  |      -      |                              ✓                               |
|     Fraud Tools Detection     |      -      |                              ✓                               |
| Behavioral Activity Capturing |      -      |                              ✓                               |

## Pro Introduction

TrustDecision TrustDevice has the leading device fingerprint technology, which has been integrated by more than 10000 global leading brands, protecting the entire customer journey.

**There are 6 leading core features about TrustDevice Pro:**

### 1. Wide Coverage
Comprehensive coverage of Android, iOS, Web, H5, applets and other device types.

### 2. Stable and Reliable
TrustDevice served more than 10,000 clients, 200 million+ daily active users , and 6 billion+ devices , with excellent product functions and stability.
The fingerprint accuracy of different terminal devices exceeded 99.9%, and the output of risk labels exceeded 70 items.

### 3. Unparalleled Safety
TrustDevice's code virtualization & obfuscation technology make the malware fraudsters suffer from painful cost and imprecision when performing reverse-engineering.

### 4. Core Intellectual Property
Fully independent intellectual property rights, with a number of patented technology.

### 5. Security Compliance
TrustDevice is committed to the highest standards in security and compliance to keep your data safe.
GDPR/CCA/PCI DSS/ISO 27701/ISO 9001 Compliant.

### 6. Easy to Deploy
SaaS（Software as a Service）deployment supported, reducing massively your integration cost and enabling rapid access to device fingerprint service.

## Where to Get Support
We are happy to provide technical support for our open-source trustdevice-ios library. We recommend using GitHub Issues to submit bugs or Discussions to ask questions. Using [Issues](https://github.com/trustdecision/trustdevice-ios/issues) and [Discussions](https://github.com/trustdecision/trustdevice-ios/discussions) publicly will help the open-source community and other users with similar issues.

In addition, any idea or interest in using TrustDevice Pro can be found on the [www.trustdecision.com](https://www.trustdecision.com/trustDevice), registered account for a free trial; or via email trustdevice@trustdecision.com contact us directly and quickly open the service.

## Compatibility
|           Items           |     Description      |
| :-----------------------: | :------------------: |
| Supported System Versions |       iOS9.0+        |
|  Supported Architecture   | armv7, arm64, x86_64 |

## TrustDevice Pro VS Others
<table>
    <tr align="center">
        <th>Type</th><th>Scene</th><th>Result</th><th>TrusDevice Pro</th><th>Fingerprint</th><th>Seon</th><th>CredoLab</th><th>Sift</th><th>Shield</th><th>PerimeterX</th>
    </tr>
    <tr align="center">
        <td>Device Fingerprint Compatibility</td><td>iOS 9.0 and above, including iOS 16, etc.</td><td>Able to collect device info and generate device ID</td><td>✅</td><td>✅(ios12 and above)</td><td>✅(ios9 and above)</td><td>✅(ios11 and above)</td><td>✅(ios9.2 and above)</td><td>✅(ios9 and above)</td><td>✅(ios11 and above)</td>
    </tr>
    <tr align="center">
        <td rowspan="2">Device fingerprint uniqueness</td><td>Different apps (with different package names) on the same device</td><td>Device fingerprints/ID matches </td><td>✅</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td>
    </tr>
    <tr align="center">
        <td>The same app on two unique devices (including the case of the same device model and the same system version)</td><td>Device fingerprint/ID should not match. Each device to have its own unique device fingeprint/ID</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td>
    </tr>
    <tr align="center">
        <td rowspan="6">Device Fingerprint Stability</td><td>Uninstall and reinstall</td><td>Device fingerprints/ID are consistent before and after reinstallation</td><td>✅</td><td>✅</td><td>❌</td><td>✅</td><td>❌</td><td>✅</td><td>❌</td>
    </tr>
      <tr align="center">
        <td>Clear all app data</td><td>Device fingerprints/ID are consistent before and after clearing all app data</td><td>✅</td><td>✅</td><td>❌</td><td>✅</td><td>❌</td><td>✅</td><td>❌</td>
    </tr>
    </tr>
    <tr align="center">
        <td>Disable all app permissions except network permissions and clear app data</td><td>Device fingerprints/ID are consistent before and after disabling all permissions</td><td>✅</td><td>✅</td><td>❌</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td>
    </tr>
    <tr align="center">
        <td>Modify the common information of the device system (brand, model, IDFA, IDFV, etc.) through the machine modification tool</td><td>Device fingerprint/ID still matches with before modification</td><td>✅</td><td>✅</td><td>❌</td><td>✅</td><td>❌</td><td>✅</td><td>❌</td>
    </tr>
    <tr align="center">
        <td>Device system upgrade</td><td>Device fingerprints/ID are consistent before and after system upgrade</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td>
    </tr>
    <tr align="center">
        <td>Factory reset (including iOS 14 and above, etc.)</td><td>The device fingerprints/ID are the same before and after the device is restored to factory settings</td><td>✅</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td>
    </tr>
    <tr align="center">
        <td rowspan="12">Device Fingerprint Risk Identification</td><td>Secondary packaging</td><td>Ability to identify secondary packaged unofficial apps</td><td>✅</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td><td>✅</td><td>❌</td>
    </tr>
    <tr align="center">
        <td>Replay attack</td><td>Ability to identify replay attacks</td><td>✅</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td>
    </tr>
    <tr align="center">
        <td>Device location information has been tampered with</td><td>Ability to identify tampering of location information</td><td>✅</td><td>✅</td><td>❌</td><td>✅</td><td>✅</td><td>✅</td><td>-</td>
    </tr>
    <tr align="center">
        <td>No SIM card inserted</td><td>Can identify whether the device is inserted with a SIM card</td><td>✅</td><td>❌</td><td>❌</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td>
    </tr>
    <tr align="center">
        <td>The device uses an HTTP proxy</td><td>Can identify HTTP proxy risks</td><td>✅</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td><td>✅</td>
    </tr>
    <tr align="center">
        <td>The device uses a VPN proxy</td><td>Can identify VPN proxy risks</td><td>✅</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td><td>✅</td><td>❌</td>
    </tr>
    <tr align="center">
        <td>Jailbreak</td><td>Ability to identify jailbreak risks</td><td>✅</td><td>❌</td><td>✅</td><td>❌</td><td>✅</td><td>✅</td><td>✅</td>
    </tr>
    <tr align="center">
        <td>The device is an emulator</td><td>Ability to recognize emulators</td><td>✅</td><td>❌</td><td>✅</td><td>❌</td><td>✅</td><td>✅</td><td>❌</td>
    </tr>
    <tr align="center">
        <td>The device uses the machine modification tool to modify the device parameter information</td><td>Ability to identify mainstream modification tools</td><td>✅</td><td>❌</td><td>❌</td><td>❌</td><td>✅</td><td>✅</td><td>❌</td>
    </tr>
    <tr align="center">
        <td>The device has scripts and group control tools installed (tools that are used to control multiple devices from single terminal - device farm/device group)</td><td>Can identify mainstream scripting/group control tools</td><td>✅</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td><td>✅</td><td>❌</td>
    </tr>
    <tr align="center">
        <td>The device is equipped with an M chip</td><td>Devices capable of recognizing M-chips</td><td>✅</td><td>❌</td><td>❌</td><td>❌</td><td>✅</td><td>✅</td><td>-</td>
    </tr>
    <tr align="center">
        <td>The device is not logged into the iCloud account</td><td>Able to identify login iCloud account</td><td>✅</td><td>❌</td><td>✅</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td>
    </tr>
    <tr align="center">
        <td rowspan="6">Security and Stability</td><td>Code Protection</td><td>The device fingerprint SDK and JS have code protection mechanisms (such as VMP), which effectively resist black hat cracking attempts to manipulate code logic and falsify data</td><td>✅ (OLLVM, VMP)</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td>
    </tr>
    <tr align="center">
        <td>Downgrade</td><td>Intercepting and sending collection requests in the iOS environment can still generate device fingerprints normally</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td>
    </tr>
    <tr align="center">
        <td>Anti packet capture</td><td>iOS has the ability to prevent packet capture</td><td>✅</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td><td>❌</td><td>✅</td>
    </tr>
</table>


## License

This library is MIT licensed. Copyright trustdecision, Inc. 2022.
