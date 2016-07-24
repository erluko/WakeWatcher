//
//  WakeWatcher.m
//  WakeWatcher
//
//  Created by Eric Kobrin on 7/23/16.
//  Copyright (c) 2016 Eric Kobrin. All rights reserved.
//

#import "WakeWatcher.h"

@implementation WakeWatcher
@import AppKit;



- (void) receiveSleepNote: (NSNotification*) note
{
    NSLog(@"receiveSleepNote: %@", [note name]);
}

- (void) receiveWakeNote: (NSNotification*) note
{
    NSLog(@"receiveWakeNote: %@", [note name]);
    if([[NSFileManager defaultManager] isExecutableFileAtPath:self.path]){
        NSLog(@"Attempting to execute: '%@'", self.path);
        NSTask *task;
        @try {
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
    if(self.path == nil){
        self.path = [NSHomeDirectory() stringByAppendingPathComponent:self.executable];
    }
    //These notifications are filed on NSWorkspace's notification center, not the default
    // notification center. You will not receive sleep/wake notifications if you file
    //with the default notification center.
    [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver: self
                                                           selector: @selector(receiveSleepNote:)
                                                               name: NSWorkspaceWillSleepNotification object: NULL];
    
    [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver: self
                                                           selector: @selector(receiveWakeNote:)
                                                               name: NSWorkspaceDidWakeNotification object: NULL];
}

@end
