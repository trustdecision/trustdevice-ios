//
//  TDMobRiskSpaceInfo.h
//  TDMobRisk
//
//  Created by zeinber on 2022/12/6.
//

#import "TDMobRiskBaseInfo.h"

@interface TDMobRiskSpaceInfo : TDMobRiskBaseInfo

/** spaceInfo */
/// freeDiskSpace
@property (nonatomic, assign) long long freeDiskSpace;
/// totalDiskSpace
@property (nonatomic, assign) long long totalDiskSpace;
/// memorySize(ram size)
@property (nonatomic, copy) NSString *memorySize;
/// physicalMemory
@property (nonatomic, copy) NSString *physicalMemory;

@end
