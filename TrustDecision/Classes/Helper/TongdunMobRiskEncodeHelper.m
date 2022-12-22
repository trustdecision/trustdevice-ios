//
//  TongdunMobRiskEncodeHelper.m
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/6.
//

#import "TongdunMobRiskEncodeHelper.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation TongdunMobRiskEncodeHelper
#pragma mark - SHA256
+ (NSString *)sha256WithSrc:(NSString *)src {
    const char *c = [src UTF8String];
    if (!c) {
#ifdef DEBUG
        NSLog(@"[%s] - [Error] - src[%@] is nil",__func__,src);
#endif
        return nil;
    }
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(c, (CC_LONG)strlen(c), result);
    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return [hash lowercaseString];

}
@end
