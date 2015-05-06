//
//  LNGood.m
//  WaterfallFlowDemo
//
//  Created by Lining on 15/5/3.
//  Copyright (c) 2015年 Lining. All rights reserved.
//

#import "LNGood.h"

@implementation LNGood
/**
 *  字典转模型
 */
+ (instancetype)goodWithDict:(NSDictionary *)dict {
    id good = [[self alloc] init];
    [good setValuesForKeysWithDictionary:dict];
    return good;
}

/**
 *  根据索引返回商品数组
 */
+ (NSArray *)goodsWithIndex:(NSInteger)index {
    
    NSString *fileName = [NSString stringWithFormat:@"%ld.plist", index % 3 + 1];
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSArray *goodsArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:goodsArray.count];
    
    [goodsArray enumerateObjectsUsingBlock: ^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        [tmpArray addObject:[self goodWithDict:dict]];
    }];
    return tmpArray.copy;
}
@end
