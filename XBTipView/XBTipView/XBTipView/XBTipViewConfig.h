//
//  XBTipViewConfig.h
//  XBTipView
//
//  Created by xxb on 2018/5/3.
//  Copyright © 2018年 xxb. All rights reserved.
//

#ifndef XBTipViewConfig_h
#define XBTipViewConfig_h

//根据传入的文字和字体获取宽度 (CGFloat)
#define getWidthWith_title_font(title,font) ({\
UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];\
label.text = title;\
label.font = font;\
[label sizeToFit];\
label.frame.size.width;\
})

#define UIImageName(imageName) [UIImage imageNamed:imageName]

#define XBImage_tip成功                                     UIImageName(@"tip-成功")
#define XBImage_tip繁忙                                     UIImageName(@"tip-繁忙")
#define XBImage_tip加载                                     UIImageName(@"tip-加载")
#define XBImage_tip警示                                     UIImageName(@"tip-警示")
#define XBImage_tip失败                                     UIImageName(@"tip-失败")


#define k_tipHiddenTime (1)

#define UIFont(s)            [UIFont systemFontOfSize:s]


#endif /* XBTipViewConfig_h */
