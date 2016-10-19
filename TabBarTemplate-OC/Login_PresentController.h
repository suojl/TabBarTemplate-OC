//
//  Login_PresentController.h
//  TabBarTemplate-OC
//
//  Created by issuser on 2016/10/18.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FrameOfViewControllerPresentedProtocol <NSObject>
/**
 *  ask the delegate for the frame of the presented view
 *
 *  @param controller the presentation controller
 *
 *  @return frame
 */
- (CGRect)frameOfPresentedViewForPresentationController:(UIPresentationController *)presentationController;
@end

@interface Login_PresentController : UIPresentationController

@property (nonatomic, strong) id<FrameOfViewControllerPresentedProtocol> frameDelegate;
@end
