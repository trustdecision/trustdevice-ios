//
//  TDMobRiskKeychainsHelper.m
//  TDMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TDMobRiskKeychainsHelper.h"
#import <Security/Security.h>

static NSString *keychainAccount = @"com.tongdun.mobrisk";
@implementation TDMobRiskKeychainsHelper
#pragma mark - function
+ (OSStatus)deleteValueForKey:(NSString *)key {
    if (!key) {
        return -1;
    }
    NSDictionary *keychainQuery = @{
        (__bridge id)kSecClass           : (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrService     : key,
        (__bridge id)kSecAttrAccount     : keychainAccount
    };
    OSStatus result = SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
    return result;
}

+ (OSStatus)saveValueForKey:(NSString *)key value:(id)value {
    if (!key) {
        return -1;
    }
    if (!value) {
        return -2;
    }
    NSMutableDictionary *keychainQuery = [[NSMutableDictionary alloc] initWithDictionary:@{
        (__bridge id)kSecClass           : (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrService     : key,
        (__bridge id)kSecAttrAccount     : keychainAccount,
        (__bridge id)kSecAttrAccessible  : (__bridge id)kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly
    }];
    [self deleteValueForKey:key];
    NSData *archiverData = [NSKeyedArchiver archivedDataWithRootObject:value];
    if (archiverData) {
        [keychainQuery setObject:archiverData forKey:(__bridge id)kSecValueData];
    }
    OSStatus result = SecItemAdd((__bridge CFDictionaryRef)keychainQuery, NULL);
    return result;
}

+ (id)loadValueForKey:(NSString *)key {
    id value = nil;
    if (!key) {
        return value;
    }
    NSMutableDictionary *keychainQuery = [[NSMutableDictionary alloc] initWithDictionary:@{
        (__bridge id)kSecClass           : (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrService     : key,
        (__bridge id)kSecAttrAccount     : keychainAccount,
        (__bridge id)kSecReturnData      : (__bridge id)kCFBooleanTrue,
        (__bridge id)kSecMatchLimit      : (__bridge id)kSecMatchLimitOne
    }];
    CFDataRef keyData = NULL;
    OSStatus result = SecItemCopyMatching((__bridge CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData);
    if (result == noErr) {
        @try {
            value = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        }
        @catch (NSException *e) {
            value = nil;
        }
        @finally {}
    }
    if (keyData) {
        CFRelease(keyData);
    }
    return value;
}

@end
