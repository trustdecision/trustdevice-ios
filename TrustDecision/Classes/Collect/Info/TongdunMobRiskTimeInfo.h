//
//  TongdunMobRiskTimeInfo.h
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TongdunMobRiskBaseInfo.h"

@interface TongdunMobRiskTimeInfo : TongdunMobRiskBaseInfo
/** timeInfo */
/// currentTime, unit is microsecond
@property (nonatomic, assign) NSTimeInterval currentTime;
/// bootTime, unit is microsecond
@property (nonatomic, assign) NSTimeInterval bootTime;
@end
