//
//  TongdunMobRiskDeviceStatusInfo.h
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TongdunMobRiskBaseInfo.h"

@interface TongdunMobRiskDeviceStatusInfo : TongdunMobRiskBaseInfo
/** Device Status Info **/
/// jailbreak
@property (nonatomic, assign) BOOL jailbreak;
/// debug
@property (nonatomic, assign) BOOL debug;
/// simulator
@property (nonatomic, assign) BOOL simulator;
@end
