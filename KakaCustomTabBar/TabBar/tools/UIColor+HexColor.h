//
//  UIColor+HexColor.h
//  TradeUnion
//
//  Created by 林郴 on 2017/2/8.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

// 十六进制颜色
+ (UIColor*)colorWithHexString:(NSString*)hex;

+ (UIColor*)colorWithHexString:(NSString*)hex withAlpha:(CGFloat)alpha;

@end
