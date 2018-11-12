//
//  SJLCustomFormatterLog.h
//  TabBarTemplate-OC
//
//  Created by 索静龙 on 2018/11/5.
//  Copyright © 2018 suojl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DDLog.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJLCustomFormatterLog : NSObject <DDLogFormatter> {
    int atomicLoggerCount;
    NSDateFormatter *threadUnsafeDateFormatter;
}

@end

NS_ASSUME_NONNULL_END
