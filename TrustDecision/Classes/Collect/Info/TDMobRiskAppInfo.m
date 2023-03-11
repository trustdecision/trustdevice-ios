//
//  TDMobRiskAppInfo.m
//  TDMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TDMobRiskAppInfo.h"
#import "TDMobRiskAPIHelper.h"
#import <UIKit/UIKit.h>

@implementation TDMobRiskAppInfo
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
    
    // teamName, applicationId
    {
        NSString *applicationId = nil;
        NSString *teamName = nil;
        NSString *embeddedPath = [[NSBundle mainBundle] pathForResource:@"embedded" ofType:@"mobileprovision"];
        const char *embeddedPathCStr = [embeddedPath UTF8String];
        if (embeddedPathCStr) {
            FILE *fp = fopen(embeddedPathCStr, "r");
            if (fp) {
                rewind(fp);
                char lineBuf[10000];
                int appidFlag = 0;
                int teamNameFlag = 0;
                NSString *string_0 = @"<string>";
                NSString *string_1 = @"</string>";
                while (fgets(lineBuf, sizeof(lineBuf), fp)) {
                    NSString *lineStr = [NSString stringWithFormat:@"%s",lineBuf ?: ""];
                    if (appidFlag == 1 && strstr(lineBuf, string_0.UTF8String) && strstr(lineBuf, string_1.UTF8String)) {
                        appidFlag = 2;
                        NSInteger fromPosition = [lineStr rangeOfString:string_0].location+8;
                        NSInteger toPosition = [lineStr rangeOfString:string_1].location;
                        NSRange range = NSMakeRange(fromPosition, toPosition - fromPosition);
                        applicationId = [lineStr substringWithRange:range];
                        applicationId = [applicationId stringByReplacingOccurrencesOfString:string_0 withString:@""];
                        applicationId = [applicationId stringByReplacingOccurrencesOfString:string_1 withString:@""];
                    }
                    if (teamNameFlag == 1 && strstr(lineBuf, string_0.UTF8String) && strstr(lineBuf, string_1.UTF8String)) {
                        teamNameFlag = 2;
                        NSInteger fromPosition = [lineStr rangeOfString:string_0].location+8;
                        NSInteger toPosition = [lineStr rangeOfString:string_1].location;
                        NSRange range = NSMakeRange(fromPosition, toPosition - fromPosition);
                        teamName = [lineStr substringWithRange:range];
                        teamName = [teamName stringByReplacingOccurrencesOfString:string_0 withString:@""];
                        teamName = [teamName stringByReplacingOccurrencesOfString:string_1 withString:@""];
                    }
                    if (appidFlag == 0 && strstr(lineBuf, "application-identifier")) {
                        appidFlag = 1;
                    }
                    if (teamNameFlag == 0 && strstr(lineBuf, "TeamName")) {
                        teamNameFlag = 1;
                    }
                    fclose(fp);
                }
            }
        }
        _applicationId = applicationId;
        _teamName = teamName;
    }
}
@end
