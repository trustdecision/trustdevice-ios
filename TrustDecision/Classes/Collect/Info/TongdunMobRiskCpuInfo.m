//
//  TongdunMobRiskCpuInfo.m
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TongdunMobRiskCpuInfo.h"
#import "TongdunMobRiskAPIHelper.h"

@implementation TongdunMobRiskCpuInfo
#pragma mark - Collect Methods
- (void)getInfo {
    // cpuCount
    {
        NSString *cpuCount = [TongdunMobRiskAPIHelper sysctlByName:"hw.ncpu" isObject:NO];
        _cpuCount = cpuCount;
    }
}
@end
