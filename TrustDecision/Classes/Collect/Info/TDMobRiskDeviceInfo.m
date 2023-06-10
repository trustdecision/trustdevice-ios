//
//  TDMobRiskDeviceInfo.m
//  TDMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TDMobRiskDeviceInfo.h"
#import "TDMobRiskAPIHelper.h"
#import <UIKit/UIKit.h>

@implementation TDMobRiskDeviceInfo
#pragma mark - Collect Methods
- (void)getInfo {
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
}

@end
