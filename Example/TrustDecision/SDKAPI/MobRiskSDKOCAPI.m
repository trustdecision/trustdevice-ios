//
//  MobRiskSDKOCAPI.m
//  TrustDeviceApp
//
//  Created by zeinber on 2022/12/8.
//

#import "MobRiskSDKOCAPI.h"
#import <TrustDecision/TDMobRisk.h>

@implementation MobRiskSDKOCAPI
+ (void)initWithOptions {
    TDMobRiskManager_t *manager = [TDMobRiskManager sharedManager];
    NSMutableDictionary *options = [[NSMutableDictionary alloc] init];
    [options setObject:^(NSDictionary *response) {
        [NSNotificationCenter.defaultCenter postNotificationName:@"MobRiskSDK_InitWithOptions_Response" object:response userInfo:nil];
    } forKey:@"callback"];
    manager->initWithOptions(options);
}
@end
