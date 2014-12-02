//
//  XJTransition.h
//  XJTransitionDemo
//
//  Created by jimi on 2014/12/2.
//  Copyright (c) 2014年 XJIMI. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XJTransitonDirection) {
    XJTransitonDirectionBottom,
    XJTransitonDirectionLeft,
    XJTransitonDirectionRight,
};

@interface XJTransition : UIPercentDrivenInteractiveTransition <UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate>

@property (nonatomic, assign) CGFloat transitionDuration;
@property (nonatomic, assign) XJTransitonDirection transitionDirection;

@end
