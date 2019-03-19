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

-(CAShapeLayer *)drawarcwith:(CGPoint)point withWidth:(CGFloat)Width;
-(void )drawLineWithArry:(NSArray *)arr with:(CGPoint)point withWidth:(CGFloat)Width;
-(void)drawArcWithArry:(NSArray *)arr with:(CGPoint)point withWidth:(CGFloat)Width withID:(NSString *)ID;
-(void)drawArcWithArry1:(NSArray *)arr WithArry2:(NSArray *)arr2 with:(CGPoint)point withWidth:(CGFloat)Width;
-(void)removelayer;
@end

NS_ASSUME_NONNULL_END
