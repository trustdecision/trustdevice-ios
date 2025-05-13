//
//  TDMobRiskAPIHelper.m
//  TDMobRisk
//
//  Created by zeinber on 2022/12/6.
//

#import "TDMobRiskAPIHelper.h"
#import <sys/sysctl.h>

@implementation TDMobRiskAPIHelper

+ (NSString *)sysctlByName:(const char *)name isObject:(BOOL)isObject {
    NSString *cString = nil;
    NSString *unknowDesc = @"unknow";
    if (isObject) {
        size_t size = 0;
        sysctlbyname(name, NULL, &size, NULL, 0);
        void *cstr = malloc(size);
        memset(cstr, 0, size);
        int sysctl_flag = sysctlbyname(name, cstr, &size, NULL, 0);
        if (sysctl_flag == 0) {
            cString = [[NSString alloc] initWithCString:cstr ?: "" encoding:NSUTF8StringEncoding];
        }else {
            cString = unknowDesc;
        }
        free(cstr);
    }else {
        if (strcmp(name, "hw.ncpu") == 0) {
            unsigned int num;
            size_t numLen = sizeof(num);
            int sysctl_flag = sysctlbyname(name, &num, &numLen, NULL, 0);
            if (sysctl_flag == 0) {
                cString = [NSString stringWithFormat:@"%u",num];
            }else {
                cString = unknowDesc;
            }
        }else {
            long long num;
            size_t numLen = sizeof(num);
            int sysctl_flag = sysctlbyname(name, &num, &numLen, NULL, 0);
            if (sysctl_flag == 0) {
                cString = [NSString stringWithFormat:@"%lld",num];
            }else {
                cString = unknowDesc;
            }
        }
    }
    return cString;
}
@end
