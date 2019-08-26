//
//  StoreSelSearchBar.h
//  autolayout.lib.test
//
//  Created by admin on 2019/8/21.
//  Copyright © 2019 clcw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StoreSelSearchBar : UIView

/**
 自定义UISearchBar
 支持:传入原始对象数组,和匹配的字段属性名. 可以返回筛选后的数组
 样式:参考https://www.jianshu.com/p/fe9e13a39352
 @param origin 原属组
 @param property 属性名:用于断言的匹配语法
 @param handler 返回筛选的结果数组
 @return 实例
 */
-(instancetype)initOriginArr:(NSArray *)origin filterBy:(NSString *)property handler:(void(^)(NSArray *result))handler;
@end

NS_ASSUME_NONNULL_END
