#import "ESTRootListController.h"
#import <spawn.h>
#import <Preferences/PSSpecifier.h>

@implementation ESTRootListController

- (NSArray *)specifiers {
    if (!_specifiers) {
        _specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
    }

    return _specifiers;
}

- (void)apply {
    // Respring
    [self respring];
}

- (void)openGitHub {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/dleovl/"] options:@{} completionHandler:nil];
}

- (void)openTwitter {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/dleovl/"] options:@{} completionHandler:nil];
}

- (void)respring {
    pid_t pid;
    const char* args[] = {"killall", "backboardd", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
}

@end
