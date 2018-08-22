//
//  Hook.h
//  XCHook
//
//  Created by myxc on 2018/8/4.
//  Copyright © 2018 myxc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hook : NSObject

+ (void)hookClass:(Class)cla
        oldMethod:(SEL)oldMethod
        newMethod:(SEL)newMethod;

@end
