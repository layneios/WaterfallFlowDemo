//
//  ViewController.m
//  WaterfallFlowDemo
//
//  Created by Lining on 15/5/3.
//  Copyright (c) 2015年 Lining. All rights reserved.
//

#import "ViewController.h"
#import "LNGood.h"
#import "LNWaterfallFlowCell.h"
#import "LNWaterfallFlowLayout.h"
#import "LNWaterfallFlowFooterView.h"

@interface ViewController ()
// 商品列表数组
@property (nonatomic, strong) NSMutableArray *goodsList;
// 当前的数据索引
@property (nonatomic, assign) NSInteger index;
// 瀑布流布局
@property (weak, nonatomic) IBOutlet LNWaterfallFlowLayout *waterfallFlowLayout;
// 底部视图
@property (nonatomic, weak) LNWaterfallFlowFooterView *footerView;
// 是否正在加载数据标记
@property (nonatomic, assign, getter=isLoading) BOOL loading;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

/**
 *  加载数据
 */
- (void)loadData {
    NSArray *goods = [LNGood goodsWithIndex:self.index];
    [self.goodsList addObjectsFromArray:goods];
    self.index++;
    // 设置布局的属性
    self.waterfallFlowLayout.columnCount = 3;
    self.waterfallFlowLayout.goodsList = self.goodsList;
    // 刷新数据
    [self.collectionView reloadData];
}

#pragma mark - 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.goodsList.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 创建可重用的cell
    LNWaterfallFlowCell *cell = [collectionView
                                  dequeueReusableCellWithReuseIdentifier:@"CellCache"
                                                            forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0)
//                                           green:((float)arc4random_uniform(256) / 255.0)
//                                            blue:((float)arc4random_uniform(256) / 255.0)
//                                           alpha:1.0];
    cell.good = self.goodsList[indexPath.item];
    return cell;
}

#pragma mark - FooterView
/**
 *  追加视图
 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionFooter) {
        self.footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"FooterViewCache" forIndexPath:indexPath];
        return self.footerView;
    }
    return nil;
}

#pragma mark - scrollView代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.footerView == nil || self.isLoading) {
        return;
    }
    
    if (self.footerView.frame.origin.y < (scrollView.contentOffset.y + scrollView.bounds.size.height)) {
        NSLog(@"开始刷新");
        // 如果正在刷新数据，不需要再次刷新
        self.loading = YES;
        [self.footerView.indicator startAnimating];
        // 模拟数据刷新
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.footerView = nil;
            [self loadData];
            self.loading = NO;
        });
    }
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - 懒加载
- (NSMutableArray *)goodsList {
    if (_goodsList == nil) {
        _goodsList = [NSMutableArray array];
    }
    return _goodsList;
}
@end
