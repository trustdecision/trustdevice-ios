//
//  TongdunMobRiskKeychainsHelper.h
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import <Foundation/Foundation.h>

@interface TongdunMobRiskKeychainsHelper : NSObject
+ (OSStatus)deleteValueForKey:(NSString *)key;
+ (OSStatus)saveValueForKey:(NSString *)key value:(id)value;
+ (id)loadValueForKey:(NSString *)key;
@end
