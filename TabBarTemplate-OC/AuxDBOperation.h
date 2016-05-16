//
//  AuxDBOperation.h
//  TabBarTemplate-OC
//
//  Created by issuser on 16/5/11.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface AuxDBOperation : NSObject
@property (nonatomic, strong) FMDatabase *fmdb;

+(instancetype) sharedISSDBWIthPath;

-(id) initWithPath:(NSString *)path;

/**添加信息
 * @parameter (arr)
 * return BOOL
 */
-(BOOL) addInfo:(NSArray *)arr;
-(BOOL) deleteInfo:(NSArray *)arr;
-(BOOL) updateInfo:(NSArray *)arr;
-(NSArray *) searchInfo:(NSArray *)arr;

@end
