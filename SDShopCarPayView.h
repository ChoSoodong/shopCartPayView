//
//  SDShopCarPayView.h
//  PeskoeJSQ
//
//  Created by ZHAO on 2019/3/17.
//  Copyright © 2019 Peskoe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SDShopCarPayView;

@protocol SDShopCarPayViewDelegate<NSObject>

//全选
-(void)shopCarPayView:(SDShopCarPayView *)payView allSelectBtn:(UIButton *)sender;

//结算
-(void)shopCarPayView:(SDShopCarPayView *)payView paymentBtn:(UIButton *)sender;

@end

@interface SDShopCarPayView : UIView



/** 全选按钮是否选中 */
@property (nonatomic, assign) BOOL allSelectBtnIsSelected;
/** 选中商品的总价 */
@property (nonatomic, copy) NSString *totalPrice;
/** 结算 选中的商品数量 */
@property (nonatomic, assign) NSInteger paymentBtnCount;

/** 代理属性 */
@property (nonatomic, weak) id<SDShopCarPayViewDelegate> delegate;

@end


