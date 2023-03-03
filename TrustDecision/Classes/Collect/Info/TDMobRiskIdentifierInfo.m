//
//  TDMobRiskIdentifierInfo.m
//  TDMobRisk
//
//  Created by zeinber on 2022/12/6.
//

#import "TDMobRiskIdentifierInfo.h"
#import "TDMobRiskKeychainsHelper.h"
#import <UIKit/UIKit.h>

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
}
@end
