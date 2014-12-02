//
//  XJTransition.m
//  XJTransitionDemo
//
//  Created by jimi on 2014/12/2.
//  Copyright (c) 2014年 XJIMI. All rights reserved.
//

#import "XJTransition.h"

@interface XJTransition ()

@property (nonatomic, strong) id<UIViewControllerContextTransitioning> transitionContext;
@property (nonatomic, assign) BOOL isDismiss;

@end


@implementation XJTransition

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _transitionDirection = XJTransitonDirectionBottom;
        _transitionDuration = 0.8f;
    }
    return self;
}

- (void)animationEnded:(BOOL)transitionCompleted
{
    self.transitionContext = nil;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.transitionDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    
    if (!self.isDismiss)
    {
        [[transitionContext containerView] addSubview:toViewController.view];
        toViewController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        CGFloat vw = CGRectGetWidth(toViewController.view.bounds);
        CGFloat vh = CGRectGetHeight(toViewController.view.bounds);

        CGRect startRect;
        if (self.transitionDirection == XJTransitonDirectionBottom) {
                startRect = CGRectMake(0, CGRectGetHeight(toViewController.view.frame), vw, vh);
        } else if (self.transitionDirection == XJTransitonDirectionLeft) {
                startRect = CGRectMake(-CGRectGetWidth(toViewController.view.frame), 0, vw, vh);
        } else if (self.transitionDirection == XJTransitonDirectionRight) {
                startRect = CGRectMake(CGRectGetWidth(toViewController.view.frame), 0, vw, vh);
        }
        
        CGPoint transformedPoint = CGPointApplyAffineTransform(startRect.origin, toViewController.view.transform);
        toViewController.view.frame = CGRectMake(transformedPoint.x, transformedPoint.y, startRect.size.width, startRect.size.height);
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0
             usingSpringWithDamping:0.8
              initialSpringVelocity:0.1
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             toViewController.view.frame = CGRectMake(0,0,
                                                                      CGRectGetWidth(toViewController.view.frame),
                                                                      CGRectGetHeight(toViewController.view.frame));
                         } completion:^(BOOL finished) {
                             [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         }];
    }
    else
    {
        
        [[transitionContext containerView] bringSubviewToFront:fromViewController.view];

        CGFloat vw = CGRectGetWidth(fromViewController.view.frame);
        CGFloat vh = CGRectGetHeight(fromViewController.view.frame);
        
        CGRect endRect;
        if (self.transitionDirection == XJTransitonDirectionBottom) {
            endRect = CGRectMake(0, CGRectGetHeight(fromViewController.view.bounds), vw, vh);
        } else if (self.transitionDirection == XJTransitonDirectionLeft) {
            endRect = CGRectMake(-CGRectGetWidth(fromViewController.view.bounds), 0, vw, vh);
        } else if (self.transitionDirection == XJTransitonDirectionRight) {
            endRect = CGRectMake(CGRectGetWidth(fromViewController.view.bounds), 0, vw, vh);
        }
        
        CGPoint transformedPoint = CGPointApplyAffineTransform(endRect.origin, fromViewController.view.transform);
        endRect = CGRectMake(transformedPoint.x, transformedPoint.y, endRect.size.width, endRect.size.height);
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0
             usingSpringWithDamping:0.8
              initialSpringVelocity:0.1
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             toViewController.view.alpha = 1.0f;
                             fromViewController.view.frame = endRect;
                         } completion:^(BOOL finished) {
                             [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                             
                         }];
    }
}

#pragma mark - UIViewControllerTransitioningDelegate Methods

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.isDismiss = NO;
    return self;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.isDismiss = YES;
    return self;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator
{
    return nil;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator
{
    return nil;
}

@end


