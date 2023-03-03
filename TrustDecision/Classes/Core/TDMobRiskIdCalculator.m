//
//  TDMobRiskIdCalculator.m
//  TDMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TDMobRiskIdCalculator.h"
#import "TDMobRiskEncodeHelper.h"

@implementation TDMobRiskIdCalculator
+ (NSString *)generateIdByInfo:(NSDictionary *)info {
    // Calculate DeviceId
    NSString *idfv = info[@"idfv"];
    NSString *deviceId = nil;
    if (idfv && [idfv isKindOfClass:[NSString class]]) {
        deviceId = [TDMobRiskEncodeHelper sha256WithSrc:idfv];
    }
    return deviceId;
}
@end
