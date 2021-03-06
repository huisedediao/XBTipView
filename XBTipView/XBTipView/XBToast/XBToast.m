//
//  XBToast.m
//  WDB80
//
//  Created by xxb on 2019/5/16.
//  Copyright © 2019 DreamCatcher. All rights reserved.
//

#import "XBToast.h"
#import "Masonry.h"
#import "XBToastConfig.h"

@interface XBToast ()
@property (nonatomic,strong) UILabel *lb_tip;
@property (nonatomic,assign) CGFloat f_hiddenTime;
@property (nonatomic,copy) XBToastHiddenBlock bl_hidden;
@end

@implementation XBToast

+ (void)showToast:(NSString *)toast
{
    [XBToast showToast:toast hiddenBlock:nil];
}

+ (void)showToast:(NSString *)toast hiddenBlock:(XBToastHiddenBlock __nullable)hiddenBlock
{
    [XBToast showToast:toast hiddenTime:0 hiddenBlock:hiddenBlock];
}

+ (void)showToast:(NSString *)toast hiddenTime:(CGFloat)hiddenTime hiddenBlock:(XBToastHiddenBlock __nullable)hiddenBlock
{
    XBToast *tipView = [[XBToast alloc] initWithDisplayView:[UIApplication sharedApplication].keyWindow];
    tipView.lb_tip.text = toast;
    tipView.bl_hidden = hiddenBlock;
    tipView.f_hiddenTime = hiddenTime;
    [tipView show];
}

- (void)dealloc
{
    NSLog(@"XBToast销毁");
}

- (void)actionBeforeShow
{
    self.fadeInFadeOut = YES;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    self.layer.cornerRadius = 8;
    self.layer.masksToBounds = YES;
    self.hideWhileTouchOtherArea = NO;
    self.backgroundViewColor = [UIColor clearColor];
    
    self.showLayoutBlock = ^(XBAlertViewBase *alertView) {
        [alertView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(alertView.superview).offset(XBToast_kStatusBarHeight);
            make.centerX.equalTo(alertView.superview);
        }];
    };
    
    self.hiddenLayoutBlock = ^(XBAlertViewBase *alertView) {
        [alertView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(alertView.superview).offset(XBToast_kStatusBarHeight);
            make.centerX.equalTo(alertView.superview);
        }];
    };
    
    [self hiddenAfterSecond:self.f_hiddenTime];
}

- (void)hidden
{
    if (self.bl_hidden)
    {
        self.bl_hidden();
    }
    [super hidden];
}

- (UILabel *)lb_tip
{
    if (_lb_tip == nil)
    {
        _lb_tip = [UILabel new];
        [self addSubview:_lb_tip];
        [_lb_tip mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.left.greaterThanOrEqualTo(self).offset(spaceOfTextAndBorder);
            make.right.lessThanOrEqualTo(self).offset(- spaceOfTextAndBorder);
            make.top.greaterThanOrEqualTo(self).offset(spaceOfTextAndBorder);
            make.bottom.lessThanOrEqualTo(self).offset(- spaceOfTextAndBorder);
            make.width.mas_lessThanOrEqualTo(XBToast_kScreenWidth - 100);
        }];
        _lb_tip.textAlignment = NSTextAlignmentCenter;
        _lb_tip.numberOfLines = 0;
        _lb_tip.textColor = [UIColor whiteColor];
    }
    return _lb_tip;
}

- (CGFloat)f_hiddenTime
{
    if (_f_hiddenTime != 0)
    {
        return _f_hiddenTime;
    }
    return 5;
}
@end
