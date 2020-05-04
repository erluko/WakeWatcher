//
//  WakeWatcher.m
//  WakeWatcher
//
//  Created by Eric Kobrin on 7/23/16.
//  Updated by John Peterson on 5/1/20
//  Released under CC0 1.0 (Public Domain)
//    https://creativecommons.org/publicdomain/zero/1.0/



#import <Foundation/Foundation.h>
#import "wakeWatcher.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Starting Wake Watcher!");
        @try {
            id watcher = [[wakeWatcher alloc] init];
            NSLog(@"Watcher %@", watcher);
            [watcher registerNotifications];
            [[NSRunLoop currentRunLoop] run];
        }
        @catch (NSException *exception) {
            NSLog(@"Watcher failed: %@", exception);
        }
        NSLog(@"Exiting Wake Watcher!");
    }
    return EXIT_SUCCESS;
}
