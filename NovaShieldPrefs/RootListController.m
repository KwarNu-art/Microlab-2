#import "RootListController.h"
#import <notify.h>

@implementation NovaShieldRootListController

- (NSArray *)specifiers {
    if (!_specifiers) {
        _specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
    }
    return _specifiers;
}

- (void)testHUD {
    // Notify SpringBoard to display a test HUD preview
    notify_post("com.novashield.testhud");
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"⚡️ NovaHUD Triggered"
                                                                   message:@"The blurred glassmorphism HUD has been dispatched to SpringBoard. Swipe up on the HUD or tap 'Boost & Cool' to interact."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)openGitHub {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/KwarNu-art/Microlab-2"] options:@{} completionHandler:nil];
}

- (void)respring {
    pid_t pid;
    const char *args[] = {"killall", "-9", "SpringBoard", NULL};
    posix_spawn(&pid, "/var/jb/usr/bin/killall", NULL, NULL, (char *const *)args, NULL);
}

@end
