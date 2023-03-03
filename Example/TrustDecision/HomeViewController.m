//
//  HomeViewController.m
//  TrustDeviceApp
//
//  Created by zeinber on 2022/12/8.
//

#import "HomeViewController.h"
#import <TrustDecision/TDMobRisk.h>
#import "DetailsViewController.h"
#import "TrustDecision_Example-Swift.h"
#import "MobRiskSDKOCAPI.h"

@interface HomeViewController ()
/** IBOutlet */
@property (weak, nonatomic) IBOutlet UITextView *fingerprintTextView;
@property (weak, nonatomic) IBOutlet UIButton *showDetailsButton;

/** Data */
@property (nonatomic, strong) NSDictionary *dataSource;

@end

@implementation HomeViewController
#pragma mark - View Func
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [TDMobRiskManager sharedManager]->getSDKVersion();
    self.showDetailsButton.enabled = NO;
    
    // Add Observer For MobRiskSDK Response
    __weak typeof(self) weakSelf = self;
    [NSNotificationCenter.defaultCenter addObserverForName:@"MobRiskSDK_InitWithOptions_Response" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        // Response in sub-thread
        NSDictionary *response = note.object;
        NSLog(@"Trust Device Response: %@",response);
        dispatch_async(dispatch_get_main_queue(), ^{
            __weak typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.dataSource = [[NSDictionary alloc] initWithDictionary:response];
            if (strongSelf.dataSource) {
                // Set DetailsButton Enable
                strongSelf.showDetailsButton.enabled = YES;
                // Show DeviceId
                strongSelf.fingerprintTextView.text = response[@"device_id"];
            }
        });
    }];
}

#pragma mark - Sender Events
- (IBAction)showDetailsClick:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailsViewController *detailsViewController = [storyBoard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    detailsViewController.dataSource = self.dataSource;
    [self.navigationController pushViewController:detailsViewController animated:YES];
}

// If you want to know how to use SDK API by swift, please switch SWIFT_TEST on.
#define SWIFT_TEST 1
- (IBAction)getDeviceFingerprintClick:(id)sender {
#ifdef SWIFT_TEST
    [MobRiskSDKSwiftAPI initWithOptions];
#else
    [MobRiskSDKOCAPI initWithOptions];
#endif
}


@end
