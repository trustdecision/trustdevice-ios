//
//  TDMobRiskOSInfo.m
//  TDMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TDMobRiskOSInfo.h"
#import "TDMobRiskAPIHelper.h"
#import <UIKit/UIKit.h>


@implementation TDMobRiskOSInfo
#pragma mark - Collect Methods
- (void)getInfo {
    // osVersion
    {
        NSString *osVersion = [TDMobRiskAPIHelper sysctlByName:"kern.osversion" isObject:YES];
        _osVersion = osVersion;
    }
    
    // osType
    {
        NSString *osType = [TDMobRiskAPIHelper sysctlByName:"kern.ostype" isObject:YES];
        _osType = osType;
    }
    
    // osRelease
    {
        NSString *osRelease = [TDMobRiskAPIHelper sysctlByName:"kern.osrelease" isObject:YES];
        _osRelease = osRelease;
    }
    
    // kernelVersion
    {
        NSString *kernelVersion = [TDMobRiskAPIHelper sysctlByName:"kern.version" isObject:YES];
        _kernelVersion = kernelVersion;
    }
}
@end
