//
//  TongdunMobRiskAPIHelper.h
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/6.
//

#import <Foundation/Foundation.h>

@interface TongdunMobRiskAPIHelper : NSObject
/// get SystemInfo by Name.
+ (NSString *)sysctlByName:(const char *)name isObject:(BOOL)isObject;
@end
