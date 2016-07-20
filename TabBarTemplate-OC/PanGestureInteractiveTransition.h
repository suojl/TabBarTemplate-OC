//
//  PanGestureInteractiveTransition.h
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/19.
//
//

#import <UIKit/UIKit.h>

@interface PanGestureInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign)  BOOL interacting;
@property (nonatomic, strong) UIViewController* presentingVC;

- (void)writeToViewController:(UIViewController*)viewController;

@end
