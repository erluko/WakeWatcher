//
//  WakeWatcher.m
//  WakeWatcher
//
//  Created by Eric Kobrin on 7/23/16.
//  Updated by John Peterson on 5/1/20
//  Released under CC0 1.0 (Public Domain)
//    https://creativecommons.org/publicdomain/zero/1.0/

#import "wakeWatcher.h"
@import AppKit;

@implementation WakeWatcher


- (void) receiveWakeNote: (NSNotification*) note
{
    NSFileManager *filemgr;
    NSArray *filelist;

    filemgr = [NSFileManager defaultManager];
    filelist = [filemgr contentsOfDirectoryAtPath: @"/opt/wake" error: nil];

    NSLog(@"receiveWakeNote: %@", [note name]);
    
    for (id object in filelist) {

        self.executable = object;
        self.home = @"/opt/wake";
        self.path = [self.home stringByAppendingPathComponent:self.executable];
        
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

}

- (void) registerNotifications
{

    [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver: self
                                                           selector: @selector(receiveWakeNote:)
                                                               name: NSWorkspaceDidWakeNotification object: NULL];
}

@end
