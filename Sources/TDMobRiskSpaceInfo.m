//
//  TDMobRiskSpaceInfo.m
//  TDMobRisk
//
//  Created by zeinber on 2022/12/6.
//

#import "TDMobRiskSpaceInfo.h"
#import "TDMobRiskAPIHelper.h"
#import <UIKit/UIKit.h>

@implementation TDMobRiskSpaceInfo
#pragma mark - Collect Methods
- (void)getInfo {
    // totalDiskSpace
    {
        long long totalDiskSpace = -1;
        NSError *error = nil;
        NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSDictionary *docDict = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[docPaths lastObject] error:&error];
        if (docDict) {
            NSNumber *systemSize = [docDict objectForKey:NSFileSystemSize];
            totalDiskSpace = [systemSize unsignedLongLongValue];
        }else {
#ifdef DEBUG
            NSLog(@"[%s] - [Error] - %@ ",__func__, error);
#endif
        }
        _totalDiskSpace = totalDiskSpace;
    }
    
    // freeDiskSpace
    {
        long long freeDiskSpace = -1;
        NSError *error = nil;
        NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSDictionary *docDict = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[docPaths lastObject] error:&error];
        if (docDict) {
            NSNumber *systemFreeSize = [docDict objectForKey:NSFileSystemFreeSize];
            freeDiskSpace = [systemFreeSize unsignedLongLongValue];
        }else {
#ifdef DEBUG
            NSLog(@"[%s] - [Error] - %@ ",__func__, error);
#endif
        }
        _freeDiskSpace = freeDiskSpace;
    }
    
    // memorySize
    {
        NSString *memorySize = [TDMobRiskAPIHelper sysctlByName:"hw.memsize" isObject:NO];
        _memorySize = memorySize;
    }
    
    // physicalMemory
    {
        NSString *physicalMemory = [TDMobRiskAPIHelper sysctlByName:"hw.physmem" isObject:NO];
        _physicalMemory = physicalMemory;
    }
}

@end
