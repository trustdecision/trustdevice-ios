//
//  TongdunMobRiskDeviceStatusInfo.m
//  TongdunMobRisk
//
//  Created by zeinber on 2022/12/7.
//

#import "TongdunMobRiskDeviceStatusInfo.h"
#import <UIKit/UIKit.h>
#import <assert.h>
#import <stdbool.h>
#import <sys/types.h>
#import <unistd.h>
#import <sys/sysctl.h>
#import <sys/stat.h>

@implementation TongdunMobRiskDeviceStatusInfo
#pragma mark - Collect Methods
- (void)getInfo {
    // jailbreak
    {
        BOOL jailbreak = [self isJailbreak];
        _jailbreak = jailbreak;
    }
    
    // debug
    {
        int debug = [self checkdebug];
        _debug = debug;
    }
    
    // simulator
    {
        int simulator = [self isSimulator];
        _simulator = simulator;
    }
}

#pragma mark - Private Collect Methods
- (int)isJailbreak {
    NSArray *jailBreakFileList = @[
        @"/Applications/Cydia.app",
        @"/private/var/lib/apt/",
        @"/User/Applications/",
        @"/Library/MobileSubstrate/MobileSubstrate.dylib",
        @"/bin/bash",
        @"/usr/sbin/sshd",
        @"/etc/apt"
    ];
    for (NSString *filePath in jailBreakFileList) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            return YES;
        }
    }
    char *env = getenv("DYLD_INSERT_LIBRARIES");
    if (env != NULL) {
        return YES;
    }
    if (!access("/Library/MobileSubstrate/DynamicLibraries/",R_OK)) {
        return YES;
    }
    //symlink verification check
    NSArray *symlinkList = @[
        @"/Applications",
        @"/var/stash/Library/Ringtones",
        @"/var/stash/Library/Wallpaper",
        @"/var/stash/usr/include",
        @"/var/stash/usr/libexec",
        @"/var/stash/usr/share",
        @"/var/stash/usr/arm-apple-darwin9"
    ];
    for (NSString *symlinkPath in symlinkList) {
        struct stat sym;
        int f = lstat(symlinkPath.UTF8String, &sym);
        if (f == 0 && (sym.st_mode & S_IFLNK)) {
            return YES;
        }
    }
    return NO;
}

- (int)checkdebug {
    int debug = -1;
    // check sysctl antidebug
    struct kinfo_proc info;
    size_t size;
    info.kp_proc.p_flag = 0;
    int mib[4];
    mib[0] = CTL_KERN;
    mib[1] = KERN_PROC;
    mib[2] = KERN_PROC_PID;
    mib[3] = getpid();
    size = sizeof(info);
    int status = sysctl(mib, sizeof(mib) / sizeof(*mib), &info, &size, NULL, 0);
    if (status == 0) {
        debug = (info.kp_proc.p_flag & P_TRACED) != 0;
    }
    // check isatty antidebug
    if (debug < 1) {
        debug = isatty(1);
    }
    return debug;
}

- (int)isSimulator {
    int simulator = -1;
#if TARGET_IPHONE_SIMULATOR
    simulator = 1;
#else
    simulator = 0;
#endif
    return simulator;
}
@end
