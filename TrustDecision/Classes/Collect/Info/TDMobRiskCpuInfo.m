//
//  TDMobRiskCpuInfo.m
//  TDMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TDMobRiskCpuInfo.h"
#import "TDMobRiskAPIHelper.h"

@implementation TDMobRiskCpuInfo
#pragma mark - Collect Methods
- (void)getInfo {
    // cpuCount
    {
        NSString *cpuCount = [TDMobRiskAPIHelper sysctlByName:"hw.ncpu" isObject:NO];
        _cpuCount = cpuCount;
    }
}
@end
