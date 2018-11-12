//
//  SJLCustomFormatterLog.m
//  TabBarTemplate-OC
//
//  Created by 索静龙 on 2018/11/5.
//  Copyright © 2018 suojl. All rights reserved.
//

#import "SJLCustomFormatterLog.h"
#import <libkern/OSAtomic.h>

static NSString *const KdateFormatString = @"yyyy/MM/dd HH:mm:ss";

@implementation SJLCustomFormatterLog

- (NSString *)stringFromDate:(NSDate *)date {
    int32_t loggerCount = OSAtomicAdd32(0, &atomicLoggerCount);
    
    if (loggerCount <= 1) {
        // Single-threaded mode.
        
        if (threadUnsafeDateFormatter == nil) {
            threadUnsafeDateFormatter = [[NSDateFormatter alloc] init];
            [threadUnsafeDateFormatter setDateFormat:KdateFormatString];
        }
        
        return [threadUnsafeDateFormatter stringFromDate:date];
    } else {
        // Multi-threaded mode.
        // NSDateFormatter is NOT thread-safe.
        
        NSString *key = @"MyCustomFormatter_NSDateFormatter";
        
        NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
        NSDateFormatter *dateFormatter = [threadDictionary objectForKey:key];
        
        if (dateFormatter == nil) {
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:KdateFormatString];
            
            [threadDictionary setObject:dateFormatter forKey:key];
        }
        
        return [dateFormatter stringFromDate:date];
    }
}

#pragma mark - DDLogFormatter 代理方法

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *logLevel; // 日志等级
    switch (logMessage->_flag) {
        case DDLogFlagError    : logLevel = @"❗️❗️❗️";   break;
        case DDLogFlagWarning  : logLevel = @"⚠️"; break;
        case DDLogFlagInfo     : logLevel = @"ℹ️";    break;
        case DDLogFlagDebug    : logLevel = @"Debug";   break;
        default                : logLevel = @"Verbose"; break;
    }
    
    NSString *dateAndTime = [self stringFromDate:(logMessage.timestamp)]; // 日期和时间
    NSString *logFileName = logMessage -> _fileName; // 文件名
    NSString *logFunction = logMessage -> _function; // 方法名
    NSUInteger logLine = logMessage -> _line;        // 行号
    NSString *logMsg = logMessage->_message;         // 日志消息
    
    // 日志格式：日期和时间 文件名 方法名 : 行数 <日志等级> 日志消息
    return [NSString stringWithFormat:@"%@ %@ %@ : %lu <%@> %@", dateAndTime, logFileName, logFunction, logLine, logLevel, logMsg];
}

- (void)didAddToLogger:(id <DDLogger>)logger {
    OSAtomicIncrement32(&atomicLoggerCount);
}

- (void)willRemoveFromLogger:(id <DDLogger>)logger {
    OSAtomicDecrement32(&atomicLoggerCount);
}

@end
