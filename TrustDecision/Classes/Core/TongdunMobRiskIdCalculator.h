//
//  TongdunMobRiskIdCalculator.h
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import <Foundation/Foundation.h>

@interface TongdunMobRiskIdCalculator : NSObject
/// Generate ID according to the collected information
+ (NSString *)generateIdByInfo:(NSDictionary *)info;
@end
