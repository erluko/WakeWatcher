//
//  WakeWatcher.m
//  WakeWatcher
//
//  Created by Eric Kobrin on 7/23/16.
//  Updated by John Peterson on 5/1/20
//  Released under CC0 1.0 (Public Domain)
//    https://creativecommons.org/publicdomain/zero/1.0/


#import <Foundation/Foundation.h>

@interface WakeWatcher : NSObject
@property (nonatomic, copy) NSString *home;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSString *executable;


- (void) registerNotifications;

@end

