//
//  TitleBarView.m
//  iosapp
//
//  Created by chenhaoxiang on 14-10-20.
//  Copyright (c) 2014年 oschina. All rights reserved.
//

#import "TitleBarView.h"
#import "UIColor+Util.h"

@interface TitleBarView ()



@end

@implementation TitleBarView {
    CGFloat buttonWidth;
    CGFloat buttonHeight;
}

- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _currentIndex = 0;
        _titleButtons = [NSMutableArray new];
        
        buttonWidth = frame.size.width / titles.count;
        buttonHeight = frame.size.height;
        
        [titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL *stop) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = [UIColor colorWithHex:0xE1E1E1];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            [button setTitleColor:[UIColor colorWithHex:0x909090] forState:UIControlStateNormal];
            [button setTitle:title forState:UIControlStateNormal];
            
            button.frame = CGRectMake(buttonWidth * idx, 0, buttonWidth, buttonHeight);
            button.tag = idx;
            [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [_titleButtons addObject:button];
            [self addSubview:button];
            [self sendSubviewToBack:button];
        }];
        
        self.contentSize = CGSizeMake(frame.size.width, 25);
        self.showsHorizontalScrollIndicator = NO;
        UIButton *firstTitle = _titleButtons[0];
        [firstTitle setTitleColor:[UIColor colorWithHex:0x009000] forState:UIControlStateNormal];
        firstTitle.transform = CGAffineTransformMakeScale(1.15, 1.15);
        
        self.bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, buttonHeight-2, buttonWidth, 2)];
        self.bottomLine.backgroundColor = [UIColor colorWithHex:0x009000];
        [self addSubview:self.bottomLine];
        [self bringSubviewToFront:self.bottomLine];
    }
    
    return self;
}


- (void)onClick:(UIButton *)button
{
    if (_currentIndex != button.tag) {
        UIButton *preTitle = _titleButtons[_currentIndex];
        
        [preTitle setTitleColor:[UIColor colorWithHex:0x909090] forState:UIControlStateNormal];
        preTitle.transform = CGAffineTransformIdentity;
        
        [button setTitleColor:[UIColor colorWithHex:0x009000] forState:UIControlStateNormal];
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
        _currentIndex = button.tag;
        _titleButtonClicked(button.tag);
        
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0.7 options:UIViewAnimationOptionCurveLinear animations:^{
            [self bottomLineScrollToIndex:_currentIndex];
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)bottomLineScrollToIndex:(NSUInteger)index {
    self.bottomLine.frame = CGRectMake(index*buttonWidth, buttonHeight-2, buttonWidth, 2);
}

@end
