#import <XCTest/XCTest.h>
 #import <TrustDecision/TDMobRisk.h>

@interface trustdevice_iosTests : XCTestCase

@end

@implementation trustdevice_iosTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    TDMobRiskManager_t *manager = [TDMobRiskManager sharedManager];
    NSMutableDictionary *options = [[NSMutableDictionary alloc] init];
    [options setObject:^(NSDictionary *response) {
        // Response in sub-thread, do something with the response
        // Get DeviceId
        NSString *deviceId = response[@"device_id"];
        // Get DeviceRiskLabel
        NSDictionary *deviceRisk = response[@"device_risk_label"];
        // Get DeviceDetail
        NSDictionary *deviceDetail = response[@"device_detail"];
    } forKey:@"callback"];
    manager->initWithOptions(options);
}
@end
