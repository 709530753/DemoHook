//
//  XCInject.m
//  inject
//
//  Created by myxc on 2018/8/4.
//  Copyright © 2018 myxc. All rights reserved.
//

#import "XCInject.h"
//#import "XCPtrace.h"
#import "fishhook.h"
#import <sys/sysctl.h>

@implementation XCInject

//int (*ptrace_p)(int _request, pid_t _pid, caddr_t _addr, int _data);
//
//int myPtrace(int _request, pid_t _pid, caddr_t _addr, int _data) {
//
//    if (_request != PT_DENY_ATTACH) {
//        return ptrace(PT_DENY_ATTACH, _pid, _addr,_data);
//    }
//
//    return 0;
//}
//
//
//+ (void)load {
//
//    NSLog(@"XCInject ***********");
//
//    struct rebinding ptranceBd;
//    ptranceBd.name = "ptrace";
//    ptranceBd.replacement = myPtrace;
//    ptranceBd.replaced = (void *)&ptrace_p;
//
//
//    struct rebinding rebinds[] = {ptranceBd};
//
//
//    rebind_symbols(rebinds, 1);
//
//}

//原始函数的地址
int (*sysctl_p)(int *, u_int, void *, size_t *, void *, size_t);

//自定义函数
int mySysctl(int *name, u_int namelen, void *info, size_t *infosize,void *newInfo, size_t newinfosize) {
    
    if (namelen == 4 &&
        name[0] == CTL_KERN &&
        name[1] == KERN_PROC &&
        name[3] == KERN_PROC_PID &&
        info && (int)*infosize == sizeof(struct kinfo_proc)) {
        
        int err = sysctl_p(name, namelen, info, infosize, newInfo, newinfosize);
        //拿出info 做判断
        struct kinfo_proc *myInfo = (struct kinfo_proc *)info;
        if ((myInfo ->kp_proc.p_flag & P_TRACED) != 0) {
            //使用异或反
            myInfo->kp_proc.p_flag ^= P_TRACED;
            return err;
        }
    }
    return sysctl_p(name, namelen, info, infosize, newInfo, newinfosize);
}

+ (void)load {
    

    rebind_symbols((struct rebinding[1]){{"sysctl",mySysctl,(void *)&sysctl_p}}, 1);
    
}





@end
