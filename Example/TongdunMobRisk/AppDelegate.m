//
//  AppDelegate.m
//  TrustDeviceApp
//
//  Created by zeinber on 2022/12/8.
//

#import "AppDelegate.h"
#import "HomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - UIApplicationDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // init window
    [self initWindow];
    return YES;
}

#pragma mark - Load Methods
- (void)initWindow {
    // Sleep to show Launch Screen
    sleep(1.0);
    // Window initialzation
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HomeViewController *homeViewController = [storyBoard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    UINavigationController *navViewController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    window.backgroundColor = [UIColor whiteColor];
    window.rootViewController = navViewController;
    [window makeKeyAndVisible];
    self.window = window;
}

@end
