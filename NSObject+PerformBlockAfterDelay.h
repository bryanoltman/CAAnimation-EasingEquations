//
//  NSObject+Util.h
//  Bouncy Tables
//
//  Created by Bryan Oltman on 5/24/13.
//  Copyright (c) 2013 Bryan Oltman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PerformBlockAfterDelay)
- (void)performBlock:(void (^)(void))block
          afterDelay:(NSTimeInterval)delay;

@end
