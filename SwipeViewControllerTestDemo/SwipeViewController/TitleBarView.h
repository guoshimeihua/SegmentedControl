//
//  TitleBarView.h
//  iosapp
//
//  Created by chenhaoxiang on 14-10-20.
//  Copyright (c) 2014年 oschina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleBarView : UIScrollView

@property (nonatomic, strong) NSMutableArray *titleButtons;
@property (nonatomic, assign) NSUInteger currentIndex;
@property (nonatomic, copy) void (^titleButtonClicked)(NSUInteger index);

@property (nonatomic, strong) UIView *bottomLine;

- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray*)titles;

- (void)bottomLineScrollToIndex:(NSUInteger)index;

@end
