//
//  AutoLayController.m
//  autolayout.lib.test
//
//  Created by admin on 2019/8/21.
//  Copyright © 2019 clcw. All rights reserved.
//

#import "AutoLayController.h"
#import <Masonry/Masonry.h>
#import "StoreSelSearchBar.h"

@interface AutoLayController()
@end

@implementation AutoLayController

-(void)viewDidLoad
{
    [super viewDidLoad];
    StoreSelSearchBar *searchBar = [StoreSelSearchBar new];
    [self.view addSubview:searchBar];
    [searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(@0);
        make.height.equalTo(@30);
        make.width.equalTo(@250);
    }];
}

@end
