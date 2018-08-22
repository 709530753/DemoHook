//
//  Hook.m
//  XCHook
//
//  Created by myxc on 2018/8/4.
//  Copyright © 2018 myxc. All rights reserved.
//

#import "Hook.h"
#import <objc/runtime.h>

@implementation Hook

+ (void)load {
    
    NSLog(@"aaaaaaaaaaaaa");
//    [Hook hookClass:NSClassFromString(@"ViewController") oldMethod:@selector(clickLeftBtn:) newMethod:@selector(clickRightBtn:)];
    
    
    Method old = class_getInstanceMethod(NSClassFromString(@"ViewController"), @selector(clickLeftBtn:));
    Method new = class_getClassMethod([Hook class], @selector(hookClass));
    
    method_exchangeImplementations(old, new);
    
}

+ (void)hookClass {
    
    NSLog(@"hookClass到了");

}

- (void)hook {
    
    NSLog(@"hook到了");
    
}

+ (void)hookClass:(Class)cla
        oldMethod:(SEL)oldMethod
        newMethod:(SEL)newMethod {
 
    Method old = class_getInstanceMethod(cla, oldMethod);
    Method new = class_getInstanceMethod(cla, newMethod);
    
    method_exchangeImplementations(old, new);

}

@end

