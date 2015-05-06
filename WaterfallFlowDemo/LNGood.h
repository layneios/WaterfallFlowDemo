//
//  LNGood.h
//  WaterfallFlowDemo
//
//  Created by Lining on 15/5/3.
//  Copyright (c) 2015年 Lining. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNGood : NSObject
@property (nonatomic, assign) NSInteger h; // 商品图片高
@property (nonatomic, assign) NSInteger w; // 商品图片宽
@property (nonatomic, copy) NSString *img; // 商品图片地址
@property (nonatomic, copy) NSString *price; // 商品价格

+ (instancetype)goodWithDict:(NSDictionary *)dict; // 字典转模型
+ (NSArray *)goodsWithIndex:(NSInteger)index; // 根据索引返回商品数组
@end
