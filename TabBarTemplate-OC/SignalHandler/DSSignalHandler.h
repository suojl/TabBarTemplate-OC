//
//  DSSignalHandler.h
//  DSSignalHandler
//
//  Created by dasheng on 16/4/13.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSSignalHandler : NSObject{
    
    BOOL dismissed;
}

//注册捕获信号的方法
+ (void)RegisterSignalExceptionHandler;
@end

void HandleException(NSException *exception);
void SignalHandler(int signal);


void InstallUncaughtExceptionHandler(void);

void InstallSignalHandler(void);
