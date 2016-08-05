//
//  WakeWatcher.m
//  WakeWatcher
//
//  Created by Eric Kobrin on 7/23/16.
//  Released under CC0 1.0 (Public Domain)
//    https://creativecommons.org/publicdomain/zero/1.0/
//

#import "WakeWatcher.h"

@implementation WakeWatcher
@import AppKit;


- (void) receiveWakeNote: (NSNotification*) note
{
    NSLog(@"receiveWakeNote: %@", [note name]);
    if([[NSFileManager defaultManager] isExecutableFileAtPath:self.path]){
        NSLog(@"Attempting to execute: '%@'", self.path);
        NSTask *task;
        @try {
            [[NSFileManager defaultManager]
             changeCurrentDirectoryPath:self.home];
            task = [NSTask launchedTaskWithLaunchPath:self.path arguments:[NSArray arrayWithObject:self.executable]];
        }
        @catch (NSException *exception) {
            NSLog(@"Error executing: '%@': %@", self.path, exception.reason);
        }
    } else {
        NSLog(@"No executable file at: '%@'", self.path);
    }
}

- (void) registerNotifications
{
    if(self.executable == nil){
        self.executable = @".onwake";
    }
    if(self.home == nil){
        self.home = NSHomeDirectory();
    }

    if(self.path == nil){
        self.path = [self.home stringByAppendingPathComponent:self.executable];
    }
    [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver: self
                                                           selector: @selector(receiveWakeNote:)
                                                               name: NSWorkspaceDidWakeNotification object: NULL];
}

@end
