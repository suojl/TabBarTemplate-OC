//
//  BasePresentationController.h
//  TabBarTemplate-OC
//
//  Created by issuser on 2016/11/1.
//  Copyright © 2016年 suojl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BasePresentationController;
@protocol PopPresentationControllerDelegate <NSObject>
@optional
/**
 *  Notifies the delegate that the dismissal transition due to tapping dimming are about to start.
 *
 *  @param controller the presentation controller
 */
- (void)presentationWillDismiss:(BasePresentationController *)presentationController;

/**
 *  Notifies the delegate that the dismissal transition due to tapping dimming finished.
 *
 *  @param controller the presentation controller
 */
- (void)presentationDidDismissed:(BasePresentationController *)presentationController;

/**
 *  ask the delegate for the frame of the presented view
 *
 *  @param controller the presentation controller
 *
 *  @return frame
 */
- (CGRect)frameOfPresentedViewForPresentationController:(BasePresentationController *)presentationController;
@end

@interface BasePresentationController : UIPresentationController

@property (nonatomic, assign) BOOL blur_Flag;
@property (nonatomic, assign) BOOL shouldDismissWhenTap;

@property (nonatomic, weak) id<PopPresentationControllerDelegate> popPresentDelegate;
@end
