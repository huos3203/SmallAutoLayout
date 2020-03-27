//
//  AutoLayController.m
//  autolayout.lib.test
//
//  Created by admin on 2019/8/21.
//  Copyright © 2019 clcw. All rights reserved.
//

#import "AutoLayController.h"

@interface AutoLayController()<UISearchBarDelegate>
@end

@implementation AutoLayController

-(void)viewDidLoad
{
    [super viewDidLoad];
    StoreSelSearchBar *searchBar = [[StoreSelSearchBar alloc] initOriginArr:@[] filterBy:@"test" handler:^(NSArray * result) {
        
    }];
    [self.view addSubview:searchBar];
    [searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@80);
        make.centerX.equalTo(@0);
        make.height.equalTo(@20);
        make.width.equalTo(@250);
    }];
}

#pragma mark - searchBar代理
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
}

-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}


@end
