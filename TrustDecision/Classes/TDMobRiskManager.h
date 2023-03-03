//
//  TDMobRiskManager.h
//  TDMobRisk
//
//  Created by zeinber on 2022/12/5.
//

#import <Foundation/Foundation.h>

typedef struct _TDMobRiskVoid {
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
} TDMobRiskManager_t;

@interface TDMobRiskManager : NSObject
/**
 * get  a singleton object
 */
+ (TDMobRiskManager_t *)sharedManager;
@end
