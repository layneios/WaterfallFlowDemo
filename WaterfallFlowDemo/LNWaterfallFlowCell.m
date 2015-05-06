//
//  LNWaterfallFlowCell.m
//  WaterfallFlowDemo
//
//  Created by Lining on 15/5/3.
//  Copyright (c) 2015年 Lining. All rights reserved.
//

#import "LNWaterfallFlowCell.h"
#import "LNGood.h"
#import "UIImageView+WebCache.h"

@interface LNWaterfallFlowCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *priceView;
@end

@implementation LNWaterfallFlowCell

- (void)setGood:(LNGood *)good {
    _good = good;
    NSURL *url = [NSURL URLWithString:good.img];
    [self.iconView sd_setImageWithURL:url];
    self.priceView.text = good.price;
}

@end
