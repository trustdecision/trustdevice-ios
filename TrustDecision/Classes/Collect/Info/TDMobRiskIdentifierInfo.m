//
//  TDMobRiskIdentifierInfo.m
//  TDMobRisk
//
//  Created by zeinber on 2022/12/6.
//

#import "TDMobRiskIdentifierInfo.h"
#import "TDMobRiskKeychainsHelper.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@implementation TDMobRiskIdentifierInfo
#pragma mark - Collect Methods
- (void)getInfo {
    // idfv
    {
        NSString *idfvCache = [TDMobRiskKeychainsHelper loadValueForKey:@"idfv"];
        // Read the keychains cache first. If the cache does not exist, regenerate the IDFV and write it to the keychains cache
        if (!idfvCache || idfvCache.length == 0) {
            UIDevice *device = [UIDevice currentDevice];
            idfvCache = [[device identifierForVendor] UUIDString];
        }
        _idfv = idfvCache;
    }
    
    //cloudid need to iCloud Key-Value storage Capability
    NSString  *cloudid = [[NSUbiquitousKeyValueStore defaultStore] stringForKey:@"td_cloudid"];
    if(!cloudid) {
        cloudid = [NSUUID UUID].UUIDString;
        [[NSUbiquitousKeyValueStore defaultStore] setString:cloudid forKey:@"td_cloudid"];
        [[NSUbiquitousKeyValueStore defaultStore] synchronize];
    }
    _cloudid = cloudid;
    
}
@end
