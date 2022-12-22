//
//  TongdunMobRiskOSInfo.h
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TongdunMobRiskBaseInfo.h"

@interface TongdunMobRiskOSInfo : TongdunMobRiskBaseInfo
/** OS Info **/
/// osVersion
@property (nonatomic, copy) NSString *osVersion;
/// osType
@property (nonatomic, copy) NSString *osType;
/// osRelease
@property (nonatomic, copy) NSString *osRelease;
/// kernelVersion
@property (nonatomic, copy) NSString *kernelVersion;
@end
