//
//  ButtonList.m
//  buttonList
//
//  Created by ycd9 on 16/2/14.
//  Copyright © 2016年 ycd9. All rights reserved.
//

#import "ButtonListView.h"

#define btnSpace 8

#define layerCornerRadius 5

#define buttonTag 10 + 11 + 4

@implementation ButtonListView

{
    NSInteger _count;
    NSInteger _currentCount;
    NSInteger _sizeCount;
    
    CGFloat _minX;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        _count = 0;
        _currentCount = 0;
        _sizeCount = 0;
        
        _minX = frame.origin.x + frame.size.width;
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
//    for (int i = 0; i < _count; i ++) {
//        UIButton * button = [self viewWithTag:buttonTag + i];
//        CGPoint point = CGPointMake(button.center.x, self.center.y);
//        button.center = point;
//    }
}

- (void)setBtnTitleArray:(NSArray *)btnTitleArray {
    _btnTitleArray = btnTitleArray;
    
    for (NSString * string in btnTitleArray) {
        NSDictionary * dic = @{@"title":string};
        UIButton * button = [self createBtnList:dic];
        button.tag = buttonTag + _count++;
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

/**
 *  从右向左样式(字体大小，字体颜色，字体下划线否，背景色，边框，边框颜色)
 */
- (void)setNormalStyle:(NSArray *)normalStyle {
    _normalStyle = normalStyle;
    
    //从右向左样式(字体大小，字体颜色，字体下划线否，背景色，边框，边框颜色)
    if (_currentCount > _count || !self.btnTitleArray.count || !normalStyle) {
        return;
    }
    UIButton * button = [self viewWithTag:buttonTag + _currentCount++];
    if (self.normalStyle[0]) {
        //字体大小
        button.titleLabel.font = [UIFont systemFontOfSize:[normalStyle[0] intValue]];
    }
    if (self.normalStyle[1]) {
        //字体颜色
        [button setTitleColor:normalStyle[1] forState:UIControlStateNormal];
    }
    
    if (self.normalStyle[2]|| self.btnTitleArray[_currentCount - 1]) {
        //字体下划线否
        if (![self.normalStyle[2] isEqualToString:@"0"]) {
            NSMutableAttributedString * content = [[NSMutableAttributedString alloc] initWithString:self.btnTitleArray[_currentCount - 1]];
            [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, content.length)];
            button.titleLabel.attributedText = content;
        }
    }
    
    
    //设置默认大小
    CGSize size = [self.btnTitleArray[_currentCount - 1] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:[normalStyle[0] intValue]]}];
    
    button.frame = CGRectMake(_minX - size.width - btnSpace , 0, size.width, size.height);
    
    //    NSLog(@"Old:-->%f\nOldFrame:%@\n",_minX,NSStringFromCGRect(button.frame));
    
    _minX -= size.width + btnSpace;
    
    
    //带边框的设置,没有的话就返回
    if (normalStyle.count == 3) {
        return;
    }
    
    if (self.normalStyle[3]) {
        //背景色
        [button setBackgroundColor:self.normalStyle[3]];
    }
    
    if (self.normalStyle[4]) {
        //边框
        button.layer.borderWidth = [self.normalStyle[4] intValue];
    }
    
    if (self.normalStyle[5]) {
        //边框颜色
        button.layer.borderColor = [(UIColor*)self.normalStyle[5] CGColor];
    }
    
}

- (void)setBtnSize:(CGSize)btnSize {
    _btnSize = btnSize;
    
    
    UIButton * button = (UIButton *)[self viewWithTag:buttonTag + _sizeCount];
    CGFloat disSpace = btnSize.width - button.frame.size.width;
    
    CGFloat oldMinX = button.frame.origin.x;
    
    button.frame = CGRectMake(oldMinX - disSpace, 0, btnSize.width, btnSize.height);
    
    for (NSInteger i = ++_sizeCount; i < _count; i++) {
        UIButton * newFramBtn = (UIButton *)[self viewWithTag:buttonTag + i];
        newFramBtn.frame = CGRectMake(newFramBtn.frame.origin.x - disSpace, newFramBtn.frame.origin.y, newFramBtn.frame.size.width, newFramBtn.frame.size.height);
//        NSLog(@"new:-->%f\nframe:%@\n",newFramBtn.frame.origin.x - disSpace,NSStringFromCGRect(newFramBtn.frame));
        CGPoint point = CGPointMake(newFramBtn.center.x, button.center.y);
        newFramBtn.center = point;
    }
}

- (UIButton *)createBtnList:(NSDictionary *)dic {
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:dic[@"title"] forState:UIControlStateNormal];
    
    button.layer.cornerRadius = layerCornerRadius;
    
    return button;
}

- (void)buttonAction:(UIButton *)button {
    for (NSInteger i = 0; i < self.btnTitleArray.count; i++) {
        if ([button.titleLabel.text isEqualToString:self.btnTitleArray[i]]) {
            if (self.buttonListTouchActionBlock) {
                self.buttonListTouchActionBlock(i);
            }
        }
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
