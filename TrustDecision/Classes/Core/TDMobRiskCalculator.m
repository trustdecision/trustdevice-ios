//
//  TDMobRiskCalculator.m
//  TDMobRisk
//
//  Created by zeinber on 2022/12/12.
//

#import "TDMobRiskCalculator.h"

@implementation TDMobRiskCalculator
+ (NSDictionary *)generateRiskLabelByInfo:(NSDictionary *)info {
    NSMutableDictionary *riskDict = [[NSMutableDictionary alloc] init];
    NSArray *riskArray = @[
        @"jailbreak",@"simulator",@"debug"
    ];
    for (id riskLabel in riskArray) {
        id riskInfo = info[riskLabel];
        if (riskInfo) {
            [riskDict setObject:riskInfo forKey:riskLabel];
        }
    }
    return [riskDict copy];
}
@end
