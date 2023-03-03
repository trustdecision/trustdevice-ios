//
//  TDMobRiskAppInfo.h
//  TDMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TDMobRiskBaseInfo.h"

@interface TDMobRiskAppInfo : TDMobRiskBaseInfo
/** App Info **/
/// bundleId
@property (nonatomic, copy) NSString *bundleId;
/// appVersion
@property (nonatomic, copy) NSString *appVersion;
@end
