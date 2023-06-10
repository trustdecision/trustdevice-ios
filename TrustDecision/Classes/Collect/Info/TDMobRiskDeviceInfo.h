//
//  TDMobRiskDeviceInfo.h
//  TDMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TDMobRiskBaseInfo.h"

@interface TDMobRiskDeviceInfo : TDMobRiskBaseInfo
/** deviceInfo */
/// deviceType
@property (nonatomic, copy) NSString *deviceType;
/// displayResolution
@property (nonatomic, copy) NSString *displayResolution;
/// displayScale
@property (nonatomic, assign) double displayScale;
/// deviceModel
@property (nonatomic, copy) NSString *deviceModel;
/// deviceName
@property (nonatomic, copy) NSString *deviceName;
/// timeZone
@property (nonatomic, copy) NSString *timeZone;
/// batteryState
@property (nonatomic, assign) NSInteger batteryState;
@end
