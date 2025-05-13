//
//  TDMobRiskCalculator.h
//  TDMobRisk
//
//  Created by zeinber on 2022/12/12.
//

#import <Foundation/Foundation.h>

@interface TDMobRiskCalculator : NSObject
/// Generate risk label according to the collected information
+ (NSDictionary *)generateRiskLabelByInfo:(NSDictionary *)info;
@end
