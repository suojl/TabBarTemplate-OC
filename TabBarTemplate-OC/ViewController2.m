//
//  ViewController2.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/6/13.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "ViewController2.h"
#import "SKPSMTPMessage.h"
#import "NSData+Base64Additions.h"


@interface ViewController2 () <SKPSMTPMessageDelegate>

@end

@implementation ViewController2


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)sendBtnAction:(id)sender {
    SKPSMTPMessage *testSend = [[SKPSMTPMessage alloc]init];
    testSend.fromEmail = @"suojlgood@163.com";
    testSend.toEmail = @"laosuogood@163.com";
    testSend.relayHost = @"smtp.163.com";
    testSend.requiresAuth = YES;
    testSend.login = @"suojlgood@163.com";
    testSend.pass = @"sjl163.com";
    testSend.subject = [NSString stringWithCString:"testtesttest" encoding:NSUTF8StringEncoding];
    // testSend.ccEmail = @"抄送人邮箱"; // 可不填
    testSend.wantsSecure = YES;
    testSend.delegate = self;
//    testSend.ccEmail = @"1072106249@qq.com"; // 抄送邮件

    NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/plain; charset=UTF-8",kSKPSMTPPartContentTypeKey,
                               @"This is a test message.",kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];

    // 添加附件
    NSString *vcfPath = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSData *vcfData = [NSData dataWithContentsOfFile:vcfPath];

    NSDictionary *vcfPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/directory;\r\n\tx-unix-mode=0644;\r\n\tname=\"test.vcf\"",kSKPSMTPPartContentTypeKey,
                             @"attachment;\r\n\tfilename=\"Info.plist\"",kSKPSMTPPartContentDispositionKey,[vcfData encodeBase64ForData],kSKPSMTPPartMessageKey,@"base64",kSKPSMTPPartContentTransferEncodingKey,nil];

    testSend.parts = [NSArray arrayWithObjects:plainPart,vcfPart,nil];
    [testSend send];
    
}

- (void)messageSent:(SKPSMTPMessage *)message
{
    NSLog(@"messageSuccessed-----%@", message);
}

- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error
{
    NSLog(@"messageFailed-----message - %@\nerror - %@", message, error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindSegue2:(UIStoryboardSegue *)sender{
    NSLog(@"unwindSegue %@", sender);
}
@end
