//
//  TDMobRiskManager.m
//  TDMobRisk
//
//  Created by zeinber on 2022/12/5.
//

#import "TDMobRiskManager.h"
#import "TDMobRiskSafeDictionary.h"
#import "TDMobRiskCollector.h"
#import "TDMobRiskIdCalculator.h"
#import "TDMobRiskCalculator.h"
#import "TDMobRiskHeader.h"

#pragma mark - Static Param
/// SDK Object
static TDMobRiskManager_t *riskManager;
/// SDKVersion
static NSString *sdkVersion = @"1.3";
/// CollectData Dictionary
static TDMobRiskSafeDictionary *infoDict;
/// Global Collect Queue
static dispatch_queue_t collectQueue;

#pragma mark - Output Function Define List
/// Initialization Function
void initWithOptions(NSDictionary *options);
/// Get BlackBox
NSDictionary *getBlackBox(void);
/// Get SDKVersion
NSString *getSDKVersion(void);

#pragma mark - Private Function Define List
/// Assert
static void TDMobRisk_assert(BOOL condition, const char *assertDescription);

@implementation TDMobRiskManager
#pragma mark - public methods
+ (TDMobRiskManager_t *)sharedManager {
    static dispatch_once_t deviceManager_once_token;
    dispatch_once(&deviceManager_once_token, ^{
        riskManager = malloc(sizeof(TDMobRiskManager_t));
        riskManager->initWithOptions = initWithOptions;
        riskManager->getBlackBox = getBlackBox;
        riskManager->getSDKVersion = getSDKVersion;
        collectQueue = dispatch_queue_create("com.tongdun.mobrisk.collector", DISPATCH_QUEUE_CONCURRENT);
    });
    return riskManager;
}

void initWithOptions(NSDictionary *options) {
    // protect judge
    /// Please use Dictionary！！！
    TDMobRisk_assert([options isKindOfClass:[NSDictionary class]], ("[TDMobRiskManager] - [INIT_ERROR] - options is not dictonary type"));
    // Async Collect
    dispatch_barrier_async(collectQueue, ^{
        // Response data
        NSMutableDictionary *dataDict = [[NSMutableDictionary alloc] init];
        // Collect data
        NSDictionary *collectInfo = [TDMobRiskCollector getCollectInfo];
        // Calculate and set deviceId
        NSString *deviceId = [TDMobRiskIdCalculator generateIdByInfo:collectInfo];
        if (deviceId) {
            [dataDict setObject:deviceId forKey:DeviceIdKey];
        }
        // Calculate and set deviceRisk
        NSDictionary *deviceRiskLabel = [TDMobRiskCalculator generateRiskLabelByInfo:collectInfo];
        if (deviceRiskLabel) {
            [dataDict setObject:deviceRiskLabel forKey:DeviceRiskLabelKey];
        }
        // Calculate and set deviceDetail
        if (collectInfo) {
            [dataDict setObject:collectInfo forKey:DeviceDetailKey];
        }
        infoDict = [[TDMobRiskSafeDictionary alloc] initWithDictionary:dataDict];
        // Copy Dictionary of infoDict
        NSDictionary *responseDict = [[NSDictionary alloc] initWithDictionary:infoDict];
        // Set parameters of response
        void (^responseCallback)(NSDictionary *blackBox) = [options objectForKey:@"callback"];
        // Response callback
        if (responseCallback) {
            responseCallback(responseDict);
        }
    });
}

NSDictionary *getBlackBox() {
    return [infoDict copy];
}

NSString *getSDKVersion() {
    return sdkVersion;
}

#pragma mark - Private Function List
/// Asset Error
static void TDMobRisk_assert(BOOL condition, const char *assertDescription) {
    if (!condition) {
        __assert_rtn(__func__, ("unknown"), 0, assertDescription);
    }
}
@end
