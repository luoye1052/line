//
//  tableView.h
//  study
//
//  Created by yubing on 2019/3/12.
//  Copyright © 2019 Emadata. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface lineView : UIView

@property (nonatomic,assign)int lineWidth;
@property (nonatomic,strong)NSMutableArray *layerArr;
@property (nonatomic,strong)NSMutableDictionary *IDDic;
@property (nonatomic,strong)NSMutableArray *lineLayerArr;

/**
 返回一个CAShapeLayer的圆型图。

 @param point 圆心
 @param Width 半径
 @return 返回一个CAShapeLayer的圆型图。
 */
-(CAShapeLayer *)drawarcwith:(CGPoint)point withWidth:(CGFloat)Width;

/**
 添加一个柱形图

 @param arr 储存着柱形图的长度的数组
 @param point 圆心
 @param Width 圆的宽度
 */
-(void )drawLineWithArry:(NSArray *)arr with:(CGPoint)point withWidth:(CGFloat)Width;

/**
 添加一个折线图

 @param arr 存储着折线图坐标的数组
 @param point 圆心
 @param Width 圆的宽度
 @param ID 折线ID
 */
-(void)drawArcWithArry:(NSArray *)arr with:(CGPoint)point withWidth:(CGFloat)Width withID:(NSString *)ID;

/**
 添加两个有链接的折线图

 @param arr 存储着折线图1坐标的数组
 @param arr2 存储着折线图2坐标的数组
 @param point 圆心
 @param Width 圆的宽度
 */
-(void)drawArcWithArry1:(NSArray *)arr WithArry2:(NSArray *)arr2 with:(CGPoint)point withWidth:(CGFloat)Width;
-(void)removelayer;
@end

NS_ASSUME_NONNULL_END
