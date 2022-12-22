//
//  TongdunMobRiskIdCalculator.m
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TongdunMobRiskIdCalculator.h"
#import "TongdunMobRiskEncodeHelper.h"

@implementation TongdunMobRiskIdCalculator
+ (NSString *)generateIdByInfo:(NSDictionary *)info {
    // Calculate DeviceId
    NSString *idfv = info[@"idfv"];
    NSString *deviceId = nil;
    if (idfv && [idfv isKindOfClass:[NSString class]]) {
        deviceId = [TongdunMobRiskEncodeHelper sha256WithSrc:idfv];
    }
    return deviceId;
}
@end
