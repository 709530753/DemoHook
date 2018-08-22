//
//  ViewController.m
//  DemoHook
//
//  Created by myxc on 2018/7/26.
//  Copyright © 2018 myxc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController


+ (void)load {
    NSLog(@"app ViewController");
}

- (void)viewDidLoad {
    [super viewDidLoad];


    
    
    
//    arg1
    
//#define    PT_TRACE_ME    0    /* child declares it's being traced */
//#define    PT_READ_I    1    /* read word in child's I space */
//#define    PT_READ_D    2    /* read word in child's D space */
//#define    PT_READ_U    3    /* read word in child's user structure */
//#define    PT_WRITE_I    4    /* write word in child's I space */
//#define    PT_WRITE_D    5    /* write word in child's D space */
//#define    PT_WRITE_U    6    /* write word in child's user structure */
//#define    PT_CONTINUE    7    /* continue the child */
//#define    PT_KILL        8    /* kill the child process */
//#define    PT_STEP        9    /* single step the child */
//#define    PT_ATTACH    ePtAttachDeprecated    /* trace some running process */
//#define    PT_DETACH    11    /* stop tracing a process */
//#define    PT_SIGEXC    12    /* signals as exceptions for current_proc */
//#define PT_THUPDATE    13    /* signal for thread# */
//#define PT_ATTACHEXC    14    /* attach to running process with signal exception */
    
//#define    PT_FORCEQUOTA    30    /* Enforce quota for root */
//#define    PT_DENY_ATTACH    31 拒绝访问
//
//#define    PT_FIRSTMACH    32    /* for machine-specific requests */


    /* 作用反调试 不能进行debug 和 使用debugserver
        arg1 ptrace 要做的事情
        arg2 要操作的进程id
        arg3 地址
        arg4 数据 取决于arg1
     */

}

- (IBAction)clickRightBtn:(id)sender {
    NSLog(@"点击右边");
    
}
- (IBAction)clickLeftBtn:(id)sender {
    NSLog(@"点击左边");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
