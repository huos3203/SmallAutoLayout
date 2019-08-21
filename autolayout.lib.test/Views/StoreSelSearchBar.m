//
//  StoreSelSearchBar.m
//  autolayout.lib.test
//
//  Created by admin on 2019/8/21.
//  Copyright © 2019 clcw. All rights reserved.
//

#import "StoreSelSearchBar.h"
#import <Masonry/Masonry.h>

@interface StoreSelSearchBar()
@property (strong, nonatomic) UISearchBar *searchBar;
@end


@implementation StoreSelSearchBar

-(instancetype)init
{
    self = [super init];
    [self addSubview:self.searchBar];
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(@0);
        make.left.equalTo(@-8);
    }];
    return self;
}

#pragma mark - getter
-(UISearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [UISearchBar new];
        // 设置搜索框放大镜图标
        UIImage *searchIcon = [UIImage imageNamed:@"searchicon"];
        [_searchBar setImage:searchIcon forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        [_searchBar setImage:[UIImage imageNamed:@"clearicon"] forSearchBarIcon:UISearchBarIconClear state:UIControlStateNormal];
        _searchBar.placeholder = @"搜索门店名称";
        //搜索框背景色
        _searchBar.barTintColor = [UIColor clearColor];
        // 风格颜色，可用于修改输入框的光标颜色，取消按钮和选择栏被选中时候都会变成设置的颜色
        _searchBar.tintColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        
        [self clearType];
    }
    return _searchBar;
}

-(void)clearType
{
    for (UIView *view in _searchBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UIView")] && view.subviews.count > 1) {
            if ( [[view.subviews objectAtIndex:1] isKindOfClass:[UITextField class]]) {
                UITextField *searchBarTextField = (UITextField *)[view.subviews objectAtIndex:1];
                [searchBarTextField setBackgroundColor:[UIColor clearColor]];
                searchBarTextField.layer.masksToBounds = YES;
                searchBarTextField.layer.cornerRadius = 20;
                searchBarTextField.font = [UIFont systemFontOfSize:14];
                searchBarTextField.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
                searchBarTextField.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
            }
            break;
        }
    }
    [[[[_searchBar.subviews objectAtIndex:0] subviews] objectAtIndex:0] removeFromSuperview];
}

@end
