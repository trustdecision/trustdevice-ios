//
//  TDMobRiskTimeInfo.m
//  TDMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TDMobRiskTimeInfo.h"
#import "TDMobRiskAPIHelper.h"
#import <sys/sysctl.h>

@implementation TDMobRiskTimeInfo
#pragma mark - Collect Methods
- (void)getInfo {
    // currentTime
    {
        NSDate *date = [NSDate date];
        NSTimeInterval currentTime = [date timeIntervalSince1970] * 1000000;
        _currentTime = currentTime;
    }
    
    // bootTime
    {
        struct timeval bootTime_t;
        size_t size = sizeof(bootTime_t);
        int result = sysctlbyname("kern.boottime", &bootTime_t, &size, NULL, 0);
        NSTimeInterval bootTime = 0;
        if (result == 0) {
            bootTime = bootTime_t.tv_sec *(long long)1000000 + bootTime_t.tv_usec;
        }
        _bootTime = bootTime;
    }
}
@end
