//
//  ButtonList.h
//  buttonList
//
//  Created by ycd9 on 16/2/14.
//  Copyright © 2016年 ycd9. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  说明：
 
 格式样例：
    1.alloc init
    2.btnTitleArray,normalStyle,btnSize(前两个必须都有值)
    3.block
    4.addSubView
 
 样式示例:
 @[@"15",[UIColor blackColor],@"1"]
 OR:(带边框样式)
 @[@"15",[UIColor whiteColor],@"0",[UIColor orangeColor],@1,[UIColor orangeColor]]
 */



@interface ButtonListView : UIView

/**
 *  从右向左
 */
@property (nonatomic, strong) NSArray * btnTitleArray;

/**
 *  从右向左样式,一个一个赋值(字体大小，字体颜色，字体下划线否，背景色，边框，边框颜色)
 */
@property (nonatomic, strong) NSArray * normalStyle;

/**
 *  按钮大小Arr
 */
@property (nonatomic, assign) CGSize btnSize;

//点击事件
@property (nonatomic, copy) void (^buttonListTouchActionBlock) (NSInteger );

@end
