//
//  TDMobRiskEncodeHelper.h
//  TDMobRisk
//
//  Created by zeinber on 2022/12/6.
//

#import <Foundation/Foundation.h>

@interface TDMobRiskEncodeHelper : NSObject
/// sha256 Encode String
+ (NSString *)sha256WithSrc:(NSString *)src;
@end
