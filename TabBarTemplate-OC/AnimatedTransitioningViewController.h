//
//  AnimatedTransitioningViewController.h
//  TabBarTemplate-OC
//
//  Created by issuser on 2016/11/1.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import "ViewController.h"
#import "BasePresentationController.h"
#import "BaseAnimatedTransitioningControll.h"

@interface AnimatedTransitioningViewController : ViewController<UIViewControllerTransitioningDelegate,PopPresentationControllerDelegate>

@property (nonatomic, weak) BasePresentationController *presentController;
@property (nonatomic, strong) NSString *animateControllerClass;

@property (nonatomic,assign) BOOL blurBackground;
@end
