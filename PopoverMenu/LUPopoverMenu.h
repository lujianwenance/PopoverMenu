//
//  LUPopoverMenu.h
//  PopoverMenu
//
//  Created by lujianwen on 15/8/29.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  <#Description#>
 *
 *  @param buttonIndex 回调buttonIndex
 */
typedef void(^PopoverMenuClicked)(NSInteger buttonIndex);

@interface LUPopoverMenu : UIView

@property (nonatomic, assign) CGFloat buttonHeight;
@property (nonatomic, assign) UIColor *titleNormalColor;
@property (nonatomic, assign) UIColor *titleHighlightedColor;
/**
 *  <#Description#>
 *
 *  @param frame      PopoverMenu的frame
 *  @param titles     ButtonTitles
 *  @param completion 点击回调
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray *)titles
                   completion:(PopoverMenuClicked)completion;

- (void)show;
/**
 *  设置自定义buttonHeight、titleColor 需要调用这个刷新方法
 */
- (void)reLayoutSubViews;

@end
