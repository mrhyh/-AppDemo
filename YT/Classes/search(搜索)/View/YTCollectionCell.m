//
//  YTCollectionCell.m
//  YT
//
//  Created by wangzhenhai on 15/10/19.
//  Copyright (c) 2015年 wangzhenhai. All rights reserved.
//

#import "YTCollectionCell.h"
#import "goodsModel.h"
#define priceF kFont(14)
@interface YTCollectionCell()

@property (nonatomic, weak) UIImageView *imageview;

@property (nonatomic, weak) UIView *coverlabel;


@property (nonatomic, weak) UILabel *productName;

@property (nonatomic, weak) UILabel *pricelabel;

@end
@implementation YTCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *imageview = [[UIImageView alloc] init];
        [self addSubview:imageview];
        self.imageview = imageview;
        
        UIView *coverLabel = [[UIView alloc] init];
        coverLabel.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.7];
        [self addSubview:coverLabel];
        self.coverlabel = coverLabel;
        
        UILabel *productName = [[UILabel alloc] init];
        productName.font = priceF;
        productName.textAlignment = NSTextAlignmentCenter;
        [self.coverlabel addSubview:productName];
        self.productName = productName;
        
        UILabel *pricelabel = [[UILabel alloc] init];
        pricelabel.font = priceF;
        pricelabel.textColor = YTRed;
        pricelabel.textAlignment = NSTextAlignmentCenter;
        [self.coverlabel addSubview:pricelabel];
        self.pricelabel = pricelabel;

    }
    return self;
}

- (void)layoutSubviews
{
    self.imageview.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    self.coverlabel.frame = CGRectMake(0, self.bounds.size.height - kFont(14).lineHeight*2 - 10, self.bounds.size.width, kFont(14).lineHeight * 2 + 10);
    
    CGFloat margin = 5;
    CGFloat productnamex = margin;
    CGFloat productnamey = margin;
    CGFloat productnamew = self.bounds.size.width - 2 * margin;
    CGFloat productnameh = priceF.lineHeight;
    self.productName.frame = CGRectMake(productnamex, productnamey, productnamew, productnameh);
    
    self.pricelabel.x = (self.bounds.size.width - self.pricelabel.size.width) * 0.5;
    self.pricelabel.y = CGRectGetMaxY(self.productName.frame);
    
}

- (void)setModel:(goodsModel *)model
{
    _model = model;
    
    [self.imageview setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"holder-item"]];
    
    NSString *priceStr = [NSString stringWithFormat:@"￥%@",model.shopprice];
    CGSize pricesize = [priceStr sizeWithFont:priceF maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    self.pricelabel.text = priceStr;
    self.pricelabel.size = pricesize;
    self.productName.text = model.productname;
}
@end
