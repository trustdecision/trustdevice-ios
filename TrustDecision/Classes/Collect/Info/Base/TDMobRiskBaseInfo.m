//
//  TDMobRiskBaseInfo.m
//  TDMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TDMobRiskBaseInfo.h"
#import <objc/runtime.h>

@implementation TDMobRiskBaseInfo
#pragma mark - Initialization Methods
- (instancetype)init {
    if (self = [super init]) {
        [self getInfo];
    }
    return self;
}

#pragma mark - Base Methods
- (void)getInfo {
    
}

- (NSDictionary *)getJsonDict {
    NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];
    unsigned int propertyCount = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &propertyCount);
    for (int i = 0; i < propertyCount; i++) {
        objc_property_t property = propertyList[i];
        const char *propertyCName = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:propertyCName];
        id propertyValue = [self valueForKey:propertyName];
        if (propertyName && propertyValue) {
            [jsonDict setObject:propertyValue forKey:propertyName];
        }else {
#ifdef DEBUG
        NSLog(@"[%s] - [Error] - propertyName[%@] or propertyValue[%@] is nil",__func__,propertyName,propertyValue);
#endif
        }
    }
    free(propertyList);
    return jsonDict;
}

@end
