//
//  LUPopoverMenu.m
//  PopoverMenu
//
//  Created by lujianwen on 15/8/29.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import "LUPopoverMenu.h"
#import "UIView+Addition.h"
#import "UIColor+Addition.h"

@interface LUPopoverMenu()

@property (nonatomic, strong) PopoverMenuClicked block;
@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) UIImageView *containerView;

@end

@implementation LUPopoverMenu
@synthesize buttonHeight = _buttonHeight;
@synthesize titleNormalColor = _titleNormalColor;
@synthesize titleHighlightedColor = _titleHighlightedColor;

- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray *)titles
                   completion:(PopoverMenuClicked)completion {
    
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.05];
        UITapGestureRecognizer *tapGesgure = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:tapGesgure];
        
        self.containerView = [[UIImageView alloc] initWithFrame:frame];
        self.containerView.image = [UIImage imageNamed:@"popovermenu"];
        self.containerView.userInteractionEnabled = YES;
        self.containerView.layer.anchorPoint = CGPointMake(0.6, 0);
        [self addSubview:self.containerView];
        
        self.titles = titles;
        self.block = completion;
    }
    
    return self;
}

- (void)setTitleNormalColor:(UIColor *)titleNormalColor {
    _titleNormalColor = titleNormalColor;
    self.titles = self.titles;
}

- (void)setTitleHighlightedColor:(UIColor *)titleHighlightedColor {
    _titleHighlightedColor = titleHighlightedColor;
}

- (UIColor *)titleNormalColor {
    return _titleNormalColor != NULL ? _titleNormalColor : [UIColor colorWithHex:@"#333333"];
}

- (UIColor *)titleHighlightedColor {
    return _titleHighlightedColor != NULL ? _titleHighlightedColor : [UIColor colorWithHex:@"#a8a8a8"];
}

- (void)setButtonHeight:(CGFloat)buttonHeight {
    _buttonHeight = buttonHeight;
}

- (CGFloat)buttonHeight {
    return _buttonHeight == 0 ? 30 : _buttonHeight;
}

- (void)setTitles:(NSArray *)titles {
    
    _titles = titles;
    
    for (int i = 0; i < titles.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(5, 10 + i * (self.buttonHeight + 6), self.containerView.width - 10, self.buttonHeight);
        button.tag = i;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:self.titleNormalColor forState:UIControlStateNormal];
        [button setTitleColor:self.titleHighlightedColor forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.containerView addSubview:button];
        
        if (i != titles.count - 1) {
            
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(5, button.bottom + 3, button.width, 1)];
            lineView.backgroundColor = [UIColor lightGrayColor];
            [self.containerView addSubview:lineView];
        }
        
        self.containerView.height = button.bottom + 1;
    }
}

- (void)reLayoutSubViews {
    
    [self.containerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.titles = _titles;
}

- (void)buttonClicked:(UIButton *)button {
    
    [self removeFromSuperview];
    
    if (self.block) {
        self.block(button.tag);
    }
}

- (void)show {
    
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    
    __weak UIView *weakContainerView = self.containerView;
    
    self.containerView.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    
    [UIView animateWithDuration:.2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        
        weakContainerView.transform = CGAffineTransformIdentity;
        
    }
                     completion:^(BOOL finished) {
        
    }];
}

- (void)dismiss {
    
    __weak __typeof(self)weakSelf = self;
    __weak UIView *weakContainerView = self.containerView;
    
    [UIView animateWithDuration:.2
                     animations:^{
        
        weakContainerView.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
        
    }
                     completion:^(BOOL finished) {
        
        [weakSelf removeFromSuperview];
    }];
    
}



@end
