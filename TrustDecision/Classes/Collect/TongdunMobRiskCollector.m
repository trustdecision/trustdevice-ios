//
//  TongdunMobRiskCollector.m
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/6.
//

#import "TongdunMobRiskCollector.h"
#import "TongdunMobRiskIdentifierInfo.h"
#import "TongdunMobRiskOSInfo.h"
#import "TongdunMobRiskCpuInfo.h"
#import "TongdunMobRiskAppInfo.h"
#import "TongdunMobRiskDeviceStatusInfo.h"
#import "TongdunMobRiskSpaceInfo.h"
#import "TongdunMobRiskDeviceInfo.h"
#import "TongdunMobRiskTimeInfo.h"
#import "TongdunMobRiskIdCalculator.h"
#import "TongdunMobRiskHeader.h"

@implementation TongdunMobRiskCollector
#pragma mark - Output Methods
/// Get CollectData
+ (NSDictionary *)getCollectInfo {
    /** Collect Data */
    // IdentifierInfo
    TongdunMobRiskIdentifierInfo *identifierInfo = [[TongdunMobRiskIdentifierInfo alloc] init];
    // OSInfo
    TongdunMobRiskOSInfo *osInfo = [[TongdunMobRiskOSInfo alloc] init];
    // CpuInfo
    TongdunMobRiskCpuInfo *cpuInfo = [[TongdunMobRiskCpuInfo alloc] init];
    // AppInfo
    TongdunMobRiskAppInfo *appInfo = [[TongdunMobRiskAppInfo alloc] init];
    // DeviceStatusInfo
    TongdunMobRiskDeviceStatusInfo *deviceStatusInfo = [[TongdunMobRiskDeviceStatusInfo alloc] init];
    // SpaceInfo
    TongdunMobRiskSpaceInfo *spaceInfo = [[TongdunMobRiskSpaceInfo alloc] init];
    // DeviceInfo
    TongdunMobRiskDeviceInfo *deviceInfo = [[TongdunMobRiskDeviceInfo alloc] init];
    // TimeInfo
    TongdunMobRiskTimeInfo *timeInfo = [[TongdunMobRiskTimeInfo alloc] init];
    
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
    for (TongdunMobRiskBaseInfo *info in collectTypeObjArray) {
        NSDictionary *infoDict = [info getJsonDict];
        if (infoDict && [infoDict isKindOfClass:[NSDictionary class]]) {
            [collectDataDict setValuesForKeysWithDictionary:infoDict];
        }
    }
    return collectDataDict;
}
@end
