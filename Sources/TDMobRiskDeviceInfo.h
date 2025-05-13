//
//  TDMobRiskDeviceInfo.h
//  TDMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TDMobRiskBaseInfo.h"

@interface TDMobRiskDeviceInfo : TDMobRiskBaseInfo
/** deviceInfo */
/// model
@property (nonatomic, copy) NSString *model;
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
/// hostName
@property (nonatomic, copy) NSString *hostName;
/// timeZone
@property (nonatomic, copy) NSString *timeZone;
/// batteryState
@property (nonatomic, assign) NSInteger batteryState;
/// Mobile Network Code
@property (nonatomic, copy) NSString *mnc;
/// Mobile Country Code
@property (nonatomic, copy) NSString *mcc;
/// Local Country ISO
@property (nonatomic, copy) NSString *localCountryIso;
@end
