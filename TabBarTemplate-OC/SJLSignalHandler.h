//
//  SJLSignalHandler.h
//  TabBarTemplate-OC
//
//  Created by 索静龙 on 2018/10/24.
//  Copyright © 2018 suojl. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <sys/signal.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJLSignalHandler : NSObject

+ (instancetype)Instance;
//注册捕获信号的方法
+ (void)RegisterSignalHandler;
- (void)HandleException:(NSException *)exception;
@end

NS_ASSUME_NONNULL_END
