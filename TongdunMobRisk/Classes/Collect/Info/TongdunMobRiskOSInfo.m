//
//  TongdunMobRiskOSInfo.m
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TongdunMobRiskOSInfo.h"
#import "TongdunMobRiskAPIHelper.h"
#import <UIKit/UIKit.h>


@implementation TongdunMobRiskOSInfo
#pragma mark - Collect Methods
- (void)getInfo {
    // osVersion
    {
        NSString *osVersion = [TongdunMobRiskAPIHelper sysctlByName:"kern.osversion" isObject:YES];
        _osVersion = osVersion;
    }
    
    // osType
    {
        NSString *osType = [TongdunMobRiskAPIHelper sysctlByName:"kern.ostype" isObject:YES];
        _osType = osType;
    }
    
    // osRelease
    {
        NSString *osRelease = [TongdunMobRiskAPIHelper sysctlByName:"kern.osrelease" isObject:YES];
        _osRelease = osRelease;
    }
    
    // kernelVersion
    {
        NSString *kernelVersion = [TongdunMobRiskAPIHelper sysctlByName:"kern.version" isObject:YES];
        _kernelVersion = kernelVersion;
    }
}
@end
