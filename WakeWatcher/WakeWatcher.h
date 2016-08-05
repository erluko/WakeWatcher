//
//  WakeWatcher.h
//  WakeWatcher
//
//  Created by Eric Kobrin on 7/23/16.
//  Released under CC0 1.0 (Public Domain)
//    https://creativecommons.org/publicdomain/zero/1.0/
//

#import <Foundation/Foundation.h>

@interface WakeWatcher : NSObject
@property (nonatomic, retain) NSString *home;
@property (nonatomic, retain) NSString *path;
@property (nonatomic, retain) NSString *executable;


- (void) registerNotifications;

@end
