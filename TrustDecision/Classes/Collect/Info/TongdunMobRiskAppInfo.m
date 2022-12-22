//
//  TongdunMobRiskAppInfo.m
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TongdunMobRiskAppInfo.h"
#import "TongdunMobRiskAPIHelper.h"
#import <UIKit/UIKit.h>

@implementation TongdunMobRiskAppInfo
#pragma mark - Initialization Methods
- (instancetype)init {
    if (self = [super init]) {
        [self getInfo];
    }
    return self;
}
#pragma mark - Collect Methods
- (void)getInfo {
    // bundleId
    {
        NSString *bundleId = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
        _bundleId = bundleId;
    }
    
    // appVersion
    {
        NSString *appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        _appVersion = appVersion;
    }
}
@end
