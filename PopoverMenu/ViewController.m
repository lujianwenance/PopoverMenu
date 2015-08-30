//
//  ViewController.m
//  PopoverMenu
//
//  Created by lujianwen on 15/8/29.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Addition.h"
#import "LUPopoverMenu.h"

static CGFloat kMenuWidth = 100.f;
static CGFloat kMargin = 10.f;

@interface ViewController ()

@property (nonatomic, strong) LUPopoverMenu *menu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonItemClicked:)];
    
}

- (LUPopoverMenu *)menu {
    if (!_menu) {
        
        CGRect rect = CGRectMake(self.view.width - kMenuWidth - kMargin, 64, kMenuWidth, 0);
        NSArray *titlesArray = @[@"好友动态",@"附近的群",@"兴趣部落",@"空间",@"朋友圈"];
        
        _menu = [[LUPopoverMenu alloc] initWithFrame:rect titles:titlesArray completion:^(NSInteger buttonIndex) {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"点击了%ld",buttonIndex] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
        }];
        
        _menu.buttonHeight = 50;
        [_menu reLayoutSubViews];
    }
    return _menu;
}

- (void)barButtonItemClicked:(UIBarButtonItem *)item {
    [self.menu show];
    
    
}

@end
