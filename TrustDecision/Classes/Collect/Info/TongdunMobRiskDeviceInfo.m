//
//  TongdunMobRiskDeviceInfo.m
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TongdunMobRiskDeviceInfo.h"
#import "TongdunMobRiskAPIHelper.h"
#import <UIKit/UIKit.h>

@implementation TongdunMobRiskDeviceInfo
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
        NSString *deviceModel = [TongdunMobRiskAPIHelper sysctlByName:"hw.model" isObject:YES];
        _deviceModel = deviceModel;
    }
}

@end
