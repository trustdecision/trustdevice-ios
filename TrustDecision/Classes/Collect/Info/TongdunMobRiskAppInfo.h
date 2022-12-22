//
//  TongdunMobRiskAppInfo.h
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TongdunMobRiskBaseInfo.h"

@interface TongdunMobRiskAppInfo : TongdunMobRiskBaseInfo
/** App Info **/
/// bundleId
@property (nonatomic, copy) NSString *bundleId;
/// appVersion
@property (nonatomic, copy) NSString *appVersion;
@end
