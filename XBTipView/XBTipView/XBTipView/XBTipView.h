//
//  XBTipView.h
//  AnXin
//
//  Created by xxb on 2018/3/20.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "XBAlertViewBase.h"

typedef enum : NSUInteger {
    XBTipViewType_success,
    XBTipViewType_failure,
    XBTipViewType_busy,
    XBTipViewType_warn
} XBTipViewType;

typedef void (^XBTipViewHiddenBlock)(void);

@interface XBTipView : XBAlertViewBase


+ (void)showTipWithType:(XBTipViewType)type tip:(NSString *)tip onView:(UIView *)view hiddenTime:(CGFloat)hiddenTime hiddenBlock:(XBTipViewHiddenBlock)hiddenBlock;


+ (void)showSuccessTip:(NSString *)tip hiddenBlock:(XBTipViewHiddenBlock)hiddenBlock;

+ (void)showFailureTip:(NSString *)tip hiddenBlock:(XBTipViewHiddenBlock)hiddenBlock;

+ (void)showBusyTip:(NSString *)tip hiddenBlock:(XBTipViewHiddenBlock)hiddenBlock;

+ (void)showWarnTip:(NSString *)tip hiddenBlock:(XBTipViewHiddenBlock)hiddenBlock;


+ (void)showSuccessTip:(NSString *)tip;

+ (void)showFailureTip:(NSString *)tip;

+ (void)showBusyTip:(NSString *)tip;

+ (void)showWarnTip:(NSString *)tip;


@end
