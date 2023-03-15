//
//  PrivacyPolicyViewController.m
//  TrustDecision_Example
//
//  Copyright © 2023 zeinber. All rights reserved.
//

#import "PrivacyPolicyViewController.h"
#import "HomeViewController.h"
#import "TrustDecision_Example-Swift.h"
#import "MobRiskSDKOCAPI.h"
#import <WebKit/WebKit.h>

@interface PrivacyPolicyViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@end

@implementation PrivacyPolicyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Set Navigation Title
    self.navigationItem.title = @"Privacy Policy";
    // Load Local Privacy Policy Html
    NSString *privacyPolicyPath = [[NSBundle mainBundle] pathForResource:@"Privacy Policy" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:privacyPolicyPath encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlString baseURL:nil];
}

#pragma mark - IB Event
- (IBAction)acceptClick:(id)sender {
    [self initTrustDevice];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isAgreePrivacy"];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)refuseClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Init
- (void)initTrustDevice {
#ifdef SWIFT_TEST
    [MobRiskSDKSwiftAPI initWithOptions];
#else
    [MobRiskSDKOCAPI initWithOptions];
#endif
}

@end
