//
//  PanGestureInteractiveTransition.m
//  TabBarTemplate-OC
//
//  Created by issuser on 16/7/19.
//
//

#import "PanGestureInteractiveTransition.h"

@implementation PanGestureInteractiveTransition
{
    BOOL _shouldComplete;
}


- (void)writeToViewController:(UIViewController*)viewController{
    self.presentingVC = viewController;
    [self prepareGestureRecognizerInView:viewController.view];
}

- (void)prepareGestureRecognizerInView:(UIView*)view {
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
}

-(CGFloat)completionSpeed
{
    return 1 - self.percentComplete;
}

- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
//    NSLog(@"------------------X:%f,Y:%f",translation.x,translation.y);
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            // 1. Mark the interacting flag. Used when supplying it in delegate.
            self.interacting = YES;
            [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
            break;
        case UIGestureRecognizerStateChanged: {
            // 2. Calculate the percentage of guesture
            if (self.interacting) {
                
                CGFloat fraction = fabs(translation.y / 400.0);
                //Limit it between 0 and 1
                fraction = fminf(fmaxf(fraction, 0.0), 1.0);
                NSLog(@"----%lf",fraction);
                self->_shouldComplete = (fraction > 0.5);
                if (fraction >= 1.0)
                    fraction = 0.99;
                [self updateInteractiveTransition:fraction];
            }
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            // 3. Gesture over. Check if the transition should happen or not
            if (self.interacting) {
                self.interacting = NO;
                if (!self->_shouldComplete || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
                    [self cancelInteractiveTransition];
                } else {
                    [self finishInteractiveTransition];
                }
            }
            break;
        }
        default:
            break;
    }
}
@end
