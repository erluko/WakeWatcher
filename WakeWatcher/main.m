//
//  main.m
//  WakeWatcher
//
//  Created by Eric Kobrin on 7/23/16.
//  Copyright (c) 2016 Eric Kobrin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WakeWatcher.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Starting Wake Watcher!");
        @try {
            id watcher = [[WakeWatcher alloc] init];
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
