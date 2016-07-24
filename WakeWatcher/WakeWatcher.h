//
//  WakeWatcher.h
//  WakeWatcher
//
//  Created by Eric Kobrin on 7/23/16.
//  Copyright (c) 2016 Eric Kobrin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WakeWatcher : NSObject
@property (nonatomic, retain) NSString *home;
@property (nonatomic, retain) NSString *path;
@property (nonatomic, retain) NSString *executable;


- (void) registerNotifications;

@end
