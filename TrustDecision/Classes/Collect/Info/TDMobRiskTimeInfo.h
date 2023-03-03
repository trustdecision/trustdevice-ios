//
//  TDMobRiskTimeInfo.h
//  TDMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TDMobRiskBaseInfo.h"

@interface TDMobRiskTimeInfo : TDMobRiskBaseInfo
/** timeInfo */
/// currentTime, unit is microsecond
@property (nonatomic, assign) NSTimeInterval currentTime;
/// bootTime, unit is microsecond
@property (nonatomic, assign) NSTimeInterval bootTime;
@end
