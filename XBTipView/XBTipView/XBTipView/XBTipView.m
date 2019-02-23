//
//  XBTipView.m
//  AnXin
//
//  Created by xxb on 2018/3/20.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "XBTipView.h"
#import "XBTipViewConfig.h"
#import "Masonry.h"

@interface XBTipView ()
@property (nonatomic,strong) UIImageView *imgV_icon;
@property (nonatomic,strong) UILabel *lb_tip;
@property (nonatomic,assign) CGFloat f_hiddenTime;
@property (nonatomic,copy) XBTipViewHiddenBlock bl_hidden;
@end

@implementation XBTipView

+ (void)showTipWithType:(XBTipViewType)type tip:(NSString *)tip onView:(UIView *)view hiddenTime:(CGFloat)hiddenTime hiddenBlock:(XBTipViewHiddenBlock)hiddenBlock
{
    if (view == nil)
    {
        view = [[UIApplication sharedApplication].delegate window];
    }
    XBTipView *tipView = [[XBTipView alloc] initWithDisplayView:view];
    tipView.imgV_icon.image = [XBTipView getImageWithType:type];
    tipView.lb_tip.text = tip;
    tipView.f_hiddenTime = hiddenTime;
    tipView.bl_hidden = hiddenBlock;
    [tipView show];
}
+ (UIImage *)getImageWithType:(XBTipViewType)type
{
    if (type == XBTipViewType_success)
    {
        return XBImage_tip成功;
    }
    if (type == XBTipViewType_failure)
    {
        return XBImage_tip失败;
    }
    if (type == XBTipViewType_busy)
    {
        return XBImage_tip繁忙;
    }
    if (type == XBTipViewType_warn)
    {
        return XBImage_tip警示;
    }
    return XBImage_tip成功;
}


+ (void)showSuccessTip:(NSString *)tip hiddenBlock:(XBTipViewHiddenBlock)hiddenBlock
{
    [XBTipView showTipWithType:XBTipViewType_success tip:tip onView:nil hiddenTime:k_tipHiddenTime hiddenBlock:hiddenBlock];
}

+ (void)showFailureTip:(NSString *)tip hiddenBlock:(XBTipViewHiddenBlock)hiddenBlock
{
    [XBTipView showTipWithType:XBTipViewType_failure tip:tip onView:nil hiddenTime:k_tipHiddenTime hiddenBlock:hiddenBlock];
}

+ (void)showBusyTip:(NSString *)tip hiddenBlock:(XBTipViewHiddenBlock)hiddenBlock
{
    [XBTipView showTipWithType:XBTipViewType_busy tip:tip onView:nil hiddenTime:k_tipHiddenTime hiddenBlock:hiddenBlock];
}

+ (void)showWarnTip:(NSString *)tip hiddenBlock:(XBTipViewHiddenBlock)hiddenBlock
{
    [XBTipView showTipWithType:XBTipViewType_warn tip:tip onView:nil hiddenTime:k_tipHiddenTime hiddenBlock:hiddenBlock];
}


+ (void)showSuccessTip:(NSString *)tip
{
    [XBTipView showSuccessTip:tip hiddenBlock:nil];
}

+ (void)showFailureTip:(NSString *)tip
{
    [XBTipView showFailureTip:tip hiddenBlock:nil];
}

+ (void)showBusyTip:(NSString *)tip
{
    [XBTipView showBusyTip:tip hiddenBlock:nil];
}

+ (void)showWarnTip:(NSString *)tip
{
    [XBTipView showWarnTip:tip hiddenBlock:nil];
}



- (void)dealloc
{
    NSLog(@"XBTipView销毁");
}

- (void)actionBeforeShow
{
    if (self.lb_tip.text.length == 0)
    {
        [self.imgV_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(32, 32));
        }];
    }
    self.fadeInFadeOut = YES;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    self.layer.cornerRadius = 8;
    self.layer.masksToBounds = YES;
    self.hideWhileTouchOtherArea = NO;
    self.backgroundViewColor = [UIColor clearColor];
    
    CGFloat selfWidth = 80;
    NSString *title = self.lb_tip.text;
    UIFont *font = self.lb_tip.font;
    CGFloat tipStrWidth = getWidthWith_title_font(title, font) + 20;
    if (tipStrWidth > selfWidth)
    {
        selfWidth = tipStrWidth;
    }
    
    self.showLayoutBlock = ^(XBAlertViewBase *alertView) {
        [alertView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(alertView.superview);
            make.size.mas_equalTo(CGSizeMake(selfWidth, 80));
        }];
    };
    
    self.hiddenLayoutBlock = ^(XBAlertViewBase *alertView) {
        [alertView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(alertView.superview);
            make.size.mas_equalTo(CGSizeMake(selfWidth, 80));
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


- (UIImageView *)imgV_icon
{
    if (_imgV_icon == nil)
    {
        _imgV_icon = [UIImageView new];
        [self addSubview:_imgV_icon];
        [_imgV_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(- 10);
            make.size.mas_equalTo(CGSizeMake(32, 32));
        }];
    }
    return _imgV_icon;
}
- (UILabel *)lb_tip
{
    if (_lb_tip == nil)
    {
        _lb_tip = [UILabel new];
        [self addSubview:_lb_tip];
        [_lb_tip mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(_imgV_icon.mas_bottom).offset(8.5);
        }];
        _lb_tip.font = UIFont(12);
        _lb_tip.textColor = [UIColor whiteColor];
    }
    return _lb_tip;
}
@end
