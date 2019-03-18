//
//  SDShopCarPayView.m
//  PeskoeJSQ
//
//  Created by ZHAO on 2019/3/17.
//  Copyright © 2019 Peskoe. All rights reserved.
//

#import "SDShopCarPayView.h"

@interface SDShopCarPayView()

/** 结算 */
@property (nonatomic, strong) UIButton *payButton;

/** 合计 */
@property (nonatomic, strong) UILabel *totalTitleLabel;
/** 价格符号 */
@property (nonatomic, strong) UILabel *priceTitleLabel;
/** 合计总价 */
@property (nonatomic, strong) UILabel *totalPriceLabel;
/** 全选 */
@property (nonatomic, strong) UIButton *allSelectButton;
@end

@implementation SDShopCarPayView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _allSelectButton = [[UIButton alloc] init];
        [_allSelectButton setTitle:@"全选" forState:UIControlStateNormal];
        [_allSelectButton setTitle:@"全选" forState:UIControlStateSelected];
        
        [_allSelectButton setTitleColor:KRGB_36 forState:UIControlStateNormal];
        [_allSelectButton setTitleColor:KRGB_36 forState:UIControlStateSelected];
        
        _allSelectButton.titleLabel.font = [UIFont systemFontOfSize:AdjustFont(14)];
        
        [_allSelectButton setImage:[UIImage imageNamed:@"ShoppingCart_selBtn_nor"] forState:UIControlStateNormal];
        [_allSelectButton setImage:[UIImage imageNamed:@"ShoppingCart_selBtn_sel"] forState:UIControlStateSelected];
        
        [_allSelectButton setImagePosition:ImagePositionLeft spacing:AdjustX(4)];
        [_allSelectButton addTarget:self action:@selector(allSelectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_allSelectButton];
        [_allSelectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AdjustX(12));
            make.centerY.offset(0);
        }];
        
        _payButton = [[UIButton alloc] init];
        _payButton.backgroundColor = RGB(71, 101, 255);
        [_payButton setTitle:@"结算(0)" forState:UIControlStateNormal];
        [_payButton setTitleColor:white_color forState:UIControlStateNormal];
        _payButton.titleLabel.font = [UIFont systemFontOfSize:AdjustFont(16)];
        [_payButton addTarget:self action:@selector(payButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_payButton];
        [_payButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.offset(0);
            make.width.offset(AdjustX(120));
        }];
        
        _totalPriceLabel = [UILabel labelWithTextColor:RGB(71, 101, 255) boldFontSize:AdjustFont(16) numblerOfLines:1 text:@"1599.00"];
        [self addSubview:_totalPriceLabel];
        [_totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.right.equalTo(self.payButton.mas_left).offset(-AdjustX(16));
        }];
        
        _priceTitleLabel = [UILabel labelWithTextColor:RGB(71, 101, 255) boldFontSize:AdjustFont(11) numblerOfLines:1 text:@"¥"];
        [_priceTitleLabel sizeToFit];
        [self addSubview:_priceTitleLabel];
        [_priceTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.right.equalTo(self.totalPriceLabel.mas_left).offset(-AdjustX(4));
            make.size.mas_equalTo(self.priceTitleLabel.size);
        }];
        
        _totalTitleLabel = [UILabel labelWithTextColor:KRGB_36 andTextFontSize:AdjustFont(14) andNumblerOfLines:1 andText:@"合计:"];
        [self addSubview:_totalTitleLabel];
        [_totalTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.right.equalTo(self.priceTitleLabel.mas_left).offset(-AdjustX(6));
        }];
        
        
        
        
        
        
        
    }
    return self;
}
#pragma mark - 全选
-(void)allSelectButtonClick:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(shopCarPayView:allSelectBtn:)]) {
        [self.delegate shopCarPayView:self allSelectBtn:sender];
    }
}
#pragma mark - 结算
-(void)payButtonClick:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(shopCarPayView:paymentBtn:)]) {
        [self.delegate shopCarPayView:self paymentBtn:sender];
    }
}

#pragma mark - set
-(void)setPaymentBtnCount:(NSInteger)paymentBtnCount{
    _paymentBtnCount = paymentBtnCount;
    
    [_payButton setTitle:[NSString stringWithFormat:@"结算(%zd)",paymentBtnCount] forState:UIControlStateNormal];
}
-(void)setTotalPrice:(NSString *)totalPrice{
    _totalPrice = totalPrice;
    
//    _totalPriceLabel.text = totalPrice;
    
    [_totalPriceLabel setText:totalPrice frontFont:AdjustFont(16) behindFont:AdjustFont(10) textColor:RGB(71, 101, 255)];
    
//    //分隔字符串
//    NSString *lastStr;
//    NSString *firstStr;
//    
//   if ([totalPrice containsString:@"."]) {
//        NSRange range = [totalPrice rangeOfString:@"."];
//        lastStr = [totalPrice substringFromIndex:range.location];
//        firstStr = [totalPrice substringToIndex:range.location];
//   }
//
//    
//    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:totalPrice];
//    
//    [AttributedStr addAttribute:NSFontAttributeName
//     
//                          value:[UIFont boldSystemFontOfSize:AdjustFont(16)]
//     
//                          range:NSMakeRange(0, firstStr.length)];
//    
//    [AttributedStr addAttribute:NSFontAttributeName
//     
//                          value:[UIFont boldSystemFontOfSize:AdjustFont(10)]
//     
//                          range:NSMakeRange(firstStr.length, lastStr.length)];
//    
//    [AttributedStr addAttribute:NSForegroundColorAttributeName
//     
//                          value:RGB(71, 101, 255)
//                          range:NSMakeRange(0, totalPrice.length)];
//    
//    _totalPriceLabel.attributedText = AttributedStr;
    
}

-(void)setAllSelectBtnIsSelected:(BOOL)allSelectBtnIsSelected{
    _allSelectBtnIsSelected = allSelectBtnIsSelected;
    
    _allSelectButton.selected = allSelectBtnIsSelected;
}

@end
