//
//  TongdunMobRiskManager.h
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/5.
//

#import <Foundation/Foundation.h>

typedef struct _tongdunMobRiskVoid {
/**
 * Initialization method
 * @param options Initialization parameters，please see the document for details.
 */
void (*initWithOptions)(NSDictionary *);
/**
 * get device info, you should make sure that method calls after initWithOptions.
 */
NSDictionary *(*getBlackBox)(void);
/**
 * get sdkVersion，currentVersion is 1.0
 */
NSString *(*getSDKVersion)(void);
} TongdunMobRiskManager_t;

@interface TongdunMobRiskManager : NSObject
/**
 * get  a singleton object
 */
+ (TongdunMobRiskManager_t *)sharedManager;
@end
