//
//  XBToastConfig.h
//  XBTipView
//
//  Created by xxb on 2019/5/16.
//  Copyright © 2019 xxb. All rights reserved.
//

#ifndef XBToastConfig_h
#define XBToastConfig_h


static const CGFloat spaceOfTextAndBorder = 15;

//屏幕宽高
#define XBToast_kScreenWidth                        [UIScreen mainScreen].bounds.size.width
#define XBToast_kScreenHeight                       [UIScreen mainScreen].bounds.size.height

//转屏的时候使用
#define XBToast_kFullWidth                          MIN(XBToast_kScreenWidth, XBToast_kScreenHeight) //满屏宽
#define XBToast_kFullHeight                         MAX(XBToast_kScreenWidth, XBToast_kScreenHeight) //满屏高

//状态栏高度
#define XBToast_kStatusBarHeight    ((XBToast_kFullHeight >= 812.f) ? 44 : 20)


#endif /* XBToastConfig_h */
