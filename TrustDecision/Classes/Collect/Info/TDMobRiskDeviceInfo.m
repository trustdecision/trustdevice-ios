//
//  TDMobRiskDeviceInfo.m
//  TDMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TDMobRiskDeviceInfo.h"
#import "TDMobRiskAPIHelper.h"
#import <UIKit/UIKit.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <sys/sysctl.h>

@implementation TDMobRiskDeviceInfo
#pragma mark - Collect Methods
- (void)getInfo {
    // machine
    {
        NSString *model = nil;
        size_t size = sizeof(model);
        sysctlbyname("hw.machine", NULL, &size, NULL, 0);
        char *machine = malloc(size);
        sysctlbyname("hw.machine", machine, &size, NULL, 0);
        model = [NSString stringWithUTF8String:machine];
        free(machine);
        _model = model;
    }
    
    // deviceType
    {
        UIDevice *device = [UIDevice currentDevice];
        NSString *deviceType = device.model;
        _deviceType = deviceType;
    }
    
    // displayResolution
    {
        UIScreen *screen = [UIScreen mainScreen];
        CGRect nativeBounds = [screen nativeBounds];
        NSString *displayResolution = [NSString stringWithFormat:@"%.1lfx%.1lf",nativeBounds.size.width,nativeBounds.size.height];
        _displayResolution = displayResolution;
    }
    
    // displayScale
    {
        UIScreen *screen = [UIScreen mainScreen];
        double displayScale = [screen nativeScale];
        _displayScale = displayScale;
    }
    
    // deviceModel
    {
        NSString *deviceModel = [TDMobRiskAPIHelper sysctlByName:"hw.model" isObject:YES];
        _deviceModel = deviceModel;
    }
    
    // deviceName
    {
        NSString *deviceName = [[UIDevice currentDevice] systemName];
        _deviceName = deviceName;
    }
    
    // hostName
    {
        size_t size = 0;
        const char *name = "kern.hostname";
        sysctlbyname(name , 0LL, &size, 0, 0);
        void *buf = malloc(size);
        sysctlbyname(name, buf, &size, 0, 0);
        NSString *hostName;
        if(buf) {
            hostName = [NSString stringWithCString:buf encoding:NSUTF8StringEncoding];
            free(buf);
        }
        _hostName = hostName;
    }

    // timeZone
    {
        NSString *timeZone = [[NSTimeZone localTimeZone] name];
        _timeZone = timeZone;
    }
    
    // batteryState
    {
        UIDevice *currentDevice = [UIDevice currentDevice];
        if (!currentDevice.isBatteryMonitoringEnabled) {
            currentDevice.batteryMonitoringEnabled = true;
        }
        _batteryState = [currentDevice batteryState];
    }
    
    // mnc
    {
        CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
        _mnc = [[networkInfo subscriberCellularProvider] mobileNetworkCode];
    }
    
    // mcc
    {
        CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
        _mcc = [[networkInfo subscriberCellularProvider] mobileCountryCode];
    }
}

@end
