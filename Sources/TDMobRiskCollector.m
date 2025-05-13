//
//  TDMobRiskCollector.m
//  TDMobRisk
//
//  Created by zeinber on 2022/12/6.
//

#import "TDMobRiskCollector.h"
#import "TDMobRiskIdentifierInfo.h"
#import "TDMobRiskOSInfo.h"
#import "TDMobRiskCpuInfo.h"
#import "TDMobRiskAppInfo.h"
#import "TDMobRiskDeviceStatusInfo.h"
#import "TDMobRiskSpaceInfo.h"
#import "TDMobRiskDeviceInfo.h"
#import "TDMobRiskTimeInfo.h"
#import "TDMobRiskIdCalculator.h"
#import "TDMobRiskHeader.h"

@implementation TDMobRiskCollector
#pragma mark - Output Methods
/// Get CollectData
+ (NSDictionary *)getCollectInfo {
    /** Collect Data */
    // IdentifierInfo
    TDMobRiskIdentifierInfo *identifierInfo = [[TDMobRiskIdentifierInfo alloc] init];
    // OSInfo
    TDMobRiskOSInfo *osInfo = [[TDMobRiskOSInfo alloc] init];
    // CpuInfo
    TDMobRiskCpuInfo *cpuInfo = [[TDMobRiskCpuInfo alloc] init];
    // AppInfo
    TDMobRiskAppInfo *appInfo = [[TDMobRiskAppInfo alloc] init];
    // DeviceStatusInfo
    TDMobRiskDeviceStatusInfo *deviceStatusInfo = [[TDMobRiskDeviceStatusInfo alloc] init];
    // SpaceInfo
    TDMobRiskSpaceInfo *spaceInfo = [[TDMobRiskSpaceInfo alloc] init];
    // DeviceInfo
    TDMobRiskDeviceInfo *deviceInfo = [[TDMobRiskDeviceInfo alloc] init];
    // TimeInfo
    TDMobRiskTimeInfo *timeInfo = [[TDMobRiskTimeInfo alloc] init];
    
    /* Transfer the collected data to json **/
    NSArray *collectTypeObjArray = @[
        identifierInfo,
        osInfo,
        cpuInfo,
        appInfo,
        deviceStatusInfo,
        spaceInfo,
        deviceInfo,
        timeInfo
    ];
    NSMutableDictionary *collectDataDict = [[NSMutableDictionary alloc] init];
    for (TDMobRiskBaseInfo *info in collectTypeObjArray) {
        NSDictionary *infoDict = [info getJsonDict];
        if (infoDict && [infoDict isKindOfClass:[NSDictionary class]]) {
            [collectDataDict setValuesForKeysWithDictionary:infoDict];
        }
    }
    return collectDataDict;
}
@end
