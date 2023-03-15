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
        const char *embeddedPath_c = [embeddedPath UTF8String];
        FILE *fp = fopen(embeddedPath_c, "r");
        if (fp) {
            fseek(fp, 0L, SEEK_END);
            uint64_t sz = ftell(fp);
            rewind(fp);
            char *mobileProvisionContent = malloc(sz);
            memset(mobileProvisionContent, 0, sz);
            fread(mobileProvisionContent,sz,1, fp);
            
            char *plistBeginTag = "<plist version";
            bool isPlistBeginTagMatch = false;
            uint64_t plistBeginTagCount = 0;
            uint64_t plistBeginTagPos = 0;
            
            char* plistEndTag = "</plist>";
            bool isPlistEndTagMatch = false;
            uint64_t plistEndTagCount = 0;
            uint64_t plistEndTagPos = 0;
            
            for (int i = 0;i < sz;i++) {
                if (isPlistBeginTagMatch && isPlistEndTagMatch) {
                    break;
                }
                if (!isPlistBeginTagMatch) {
                    while (plistBeginTag[plistBeginTagCount] && i < sz && plistBeginTag[plistBeginTagCount++] == mobileProvisionContent[i++]);
                    if (plistBeginTag[plistBeginTagCount] == 0) {
                        isPlistBeginTagMatch = true;
                        plistBeginTagPos = i - plistBeginTagCount;
                    }else {
                        plistBeginTagCount = 0;
                    }
                }
                
                if (!isPlistEndTagMatch) {
                    while (plistEndTag[plistEndTagCount] && i < sz && plistEndTag[plistEndTagCount++] == mobileProvisionContent[i++]);
                    if(plistEndTag[plistEndTagCount] == 0) {
                        isPlistEndTagMatch = true;
                        plistEndTagPos = i;
                    }else{
                        plistEndTagCount = 0;
                    }
                }
            }
            mobileProvisionContent[plistEndTagPos] = 0;
            char *plistContent = mobileProvisionContent + plistBeginTagPos;
            if (plistEndTagPos > plistBeginTagPos) {
                uint64_t plistContent_len = plistEndTagPos - plistBeginTagPos;
                NSData *data = [NSData dataWithBytes:plistContent length:plistContent_len];
                NSError *error;
                NSDictionary * plistDic = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListWriteStreamError format:nil error:&error];
                
                if ([plistDic isKindOfClass:[NSDictionary class]]) {
                    teamName = plistDic[@"TeamName"];
                    NSDictionary *entitlementsDic = plistDic[@"Entitlements"];
                    if ([entitlementsDic isKindOfClass:[NSDictionary class]]) {
                        applicationId = entitlementsDic[@"application-identifier"];
                    }
                }
            }
            if (mobileProvisionContent) {
                free(mobileProvisionContent);
            }
            if (fp) {
                fclose(fp);
            }
        }
        
        _applicationId = applicationId;
        _teamName = teamName;
    }
}
@end
