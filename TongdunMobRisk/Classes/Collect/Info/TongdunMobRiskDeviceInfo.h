//
//  TongdunMobRiskDeviceInfo.h
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TongdunMobRiskBaseInfo.h"

@interface TongdunMobRiskDeviceInfo : TongdunMobRiskBaseInfo
/** deviceInfo */
/// deviceType
@property (nonatomic, copy) NSString *deviceType;
/// displayResolution
@property (nonatomic, copy) NSString *displayResolution;
/// displayScale
@property (nonatomic, assign) double displayScale;
/// deviceModel
@property (nonatomic, copy) NSString *deviceModel;
@end
