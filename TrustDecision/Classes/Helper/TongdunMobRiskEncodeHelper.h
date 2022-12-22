//
//  TongdunMobRiskEncodeHelper.h
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/6.
//

#import <Foundation/Foundation.h>

@interface TongdunMobRiskEncodeHelper : NSObject
/// sha256 Encode String
+ (NSString *)sha256WithSrc:(NSString *)src;
@end
