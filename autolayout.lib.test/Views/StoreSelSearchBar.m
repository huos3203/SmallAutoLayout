//
//  StoreSelSearchBar.m
//  autolayout.lib.test
//
//  Created by admin on 2019/8/21.
//  Copyright © 2019 clcw. All rights reserved.
//

#import "StoreSelSearchBar.h"
#import <Masonry/Masonry.h>

@interface StoreSelSearchBar()<UISearchBarDelegate>
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *searchArray;
@end


@implementation StoreSelSearchBar

{
    NSArray *_originArray;
    NSString *_property;
    NSString *_rexStr;
    void(^SearchHandler)(NSArray *result);
}

-(instancetype)init
{
    self = [super init];
    self.userInteractionEnabled = true;
    self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    self.layer.cornerRadius = 15;
    
    [self addSubview:self.searchBar];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"搜索门店名称";
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(@0);
        make.left.equalTo(@-8);
    }];
    return self;
}

-(instancetype)initOriginArr:(NSArray *)origin filterBy:(NSString *)property handler:(void(^)(NSArray *result))handler
{
    self = [self init];
    _originArray = origin;
    _property = property;
    SearchHandler = handler;
    return self;
}

#pragma mark - searchBar 代理
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];//释放第一响应者
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length > 0) {
        _rexStr = [NSString stringWithFormat:@"%@ contains [cd] '%@'",_property,searchText];
    }else{
        _rexStr = @"";
        self.searchArray = nil;
    }
    if (SearchHandler) {
        SearchHandler(self.searchArray);
    }
}

-(NSArray *)searchArray
{
    if (_rexStr.length == 0) {
        if (_searchArray.count > 0) {
            return _searchArray;
        }else{
            return _originArray;
        }
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:_rexStr];
    _searchArray = [_originArray filteredArrayUsingPredicate:predicate];
    return _searchArray;
}

#pragma mark - getter
-(UISearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [UISearchBar new];
        // 设置搜索框放大镜图标
        UIImage *searchIcon = [UIImage imageNamed:@"searchhicon"];
        [_searchBar setImage:searchIcon forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        [_searchBar setImage:[UIImage imageNamed:@"clearricon"] forSearchBarIcon:UISearchBarIconClear state:UIControlStateNormal];
        [self clearType];
    }
    return _searchBar;
}

-(void)clearType
{
    //搜索框背景色
    _searchBar.barTintColor = [UIColor clearColor];
    // 风格颜色，可用于修改输入框的光标颜色，取消按钮和选择栏被选中时候都会变成设置的颜色
    _searchBar.tintColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    
    for (UIView *view in _searchBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UIView")] && view.subviews.count > 1) {
            if ( [[view.subviews objectAtIndex:1] isKindOfClass:[UITextField class]]) {
                UITextField *searchBarTextField = (UITextField *)[view.subviews objectAtIndex:1];
                [searchBarTextField setBackgroundColor:[UIColor clearColor]];
                searchBarTextField.layer.masksToBounds = YES;
                searchBarTextField.layer.cornerRadius = 20;
                searchBarTextField.font = [UIFont systemFontOfSize:14];
                searchBarTextField.backgroundColor = [UIColor clearColor];
                searchBarTextField.textColor = [UIColor colorWithRed:47/255.0 green:56/255.0 blue:86/255.0 alpha:1.0];
                
                //修改placeholder字体颜色和大小
                [searchBarTextField setValue:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
                [searchBarTextField setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
            }
            break;
        }
    }
    [[[[_searchBar.subviews objectAtIndex:0] subviews] objectAtIndex:0] removeFromSuperview];
}

@end
