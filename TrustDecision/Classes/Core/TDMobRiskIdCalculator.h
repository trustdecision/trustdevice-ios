//
//  TDMobRiskIdCalculator.h
//  TDMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import <Foundation/Foundation.h>

@interface TDMobRiskIdCalculator : NSObject
/// Generate ID according to the collected information
+ (NSString *)generateIdByInfo:(NSDictionary *)info;
@end
