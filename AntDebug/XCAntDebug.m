//
//  XCAntDebug.m
//  AntDebug
//
//  Created by myxc on 2018/8/4.
//  Copyright © 2018 myxc. All rights reserved.
//

#import "XCAntDebug.h"
#import "XCPtrance.h"
#import <sys/sysctl.h>

@implementation XCAntDebug

static dispatch_source_t timer;


//检测是否被调试
BOOL isDebugger() {
    
    //控制码
    int name[4];//里面放字节码，查询信息
    name[0] = CTL_KERN;//内核查看
    name[1] = KERN_PROC;//查询进程
    name[2] = KERN_PROC_PID;//传递的参数是进程的ID(PID)
    name[3] = getpid();//PID的值
    
    struct kinfo_proc info; //接受进程查询结果的结构体
    
    size_t info_size = sizeof(info);//结构体的大小
    int error = sysctl(name, sizeof(name)/sizeof(*name), &info, &info_size, 0, 0);
    
    assert(error == 0);//0就是没有错误,其他就是错误码
    
    
    
    
    return ((info.kp_proc.p_flag & P_TRACED) != 0);
}


void debugCheck(){
    
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0.0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (isDebugger()) {
            //        exit(0);
            NSLog(@"有debugServer");
        } else {
            NSLog(@"无debugServer");
        }
    });
    dispatch_resume(timer);
    
}


+ (void)load {
    
    NSLog(@"XCAntDebug *************");
    
    debugCheck();

    ptrace(PT_DENY_ATTACH, getpid(), 0, 0);
    
}

@end
