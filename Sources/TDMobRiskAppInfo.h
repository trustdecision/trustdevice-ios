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
/// applicationId
@property (nonatomic, copy) NSString *applicationId;
/// teamName
@property (nonatomic, copy) NSString *teamName;
/// sandboxPath
@property (nonatomic, copy) NSString *sandboxPath;
/// appInstallTime
@property (nonatomic, assign) NSTimeInterval appInstallTime;
@end
