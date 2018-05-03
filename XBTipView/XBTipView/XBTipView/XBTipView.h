//
//  XBTipView.h
//  AnXin
//
//  Created by xxb on 2018/3/20.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "XBAlertViewBase.h"

@interface XBTipView : XBAlertViewBase

+ (void)showSuccessTip:(NSString *)tip;

+ (void)showFailureTip:(NSString *)tip;

+ (void)showBusyTip:(NSString *)tip;

+ (void)showWarnTip:(NSString *)tip;

+ (void)showSuccessTip:(NSString *)tip onView:(UIView *)view;

+ (void)showFailureTip:(NSString *)tip onView:(UIView *)view;

+ (void)showBusyTip:(NSString *)tip onView:(UIView *)view;

+ (void)showWarnTip:(NSString *)tip onView:(UIView *)view;


@end
