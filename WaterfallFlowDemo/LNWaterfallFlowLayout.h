//
//  LNWaterfallFlowLayout.h
//  WaterfallFlowDemo
//
//  Created by Lining on 15/5/3.
//  Copyright (c) 2015年 Lining. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LNWaterfallFlowLayout : UICollectionViewFlowLayout
// 总列数
@property (nonatomic, assign) NSInteger columnCount;
// 商品数据数组
@property (nonatomic, strong) NSArray *goodsList;
@end