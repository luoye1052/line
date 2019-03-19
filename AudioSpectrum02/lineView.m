//
//  tableView.m
//  study
//
//  Created by yubing on 2019/3/12.
//  Copyright © 2019 Emadata. All rights reserved.
//

#import "lineView.h"

@implementation lineView


-(void)drawRect:(CGRect)rect{
    
  
}

-(void)drawLineWithArry:(NSArray *)arr with:(CGPoint)point withWidth:(CGFloat)Width{
    
    int m=100;
    if (!self.layerArr) {
        self.layerArr=[NSMutableArray array];
    }
    for (CAShapeLayer *shapeLayer in self.layerArr) {
        [shapeLayer removeFromSuperlayer];
    }
    [self.layerArr removeAllObjects];
    
    if (!self.lineLayerArr) {
        self.lineLayerArr=[NSMutableArray array];
    }
    for (CAShapeLayer *shapeLayer in self.lineLayerArr) {
        [shapeLayer removeFromSuperlayer];
    }
    [self.lineLayerArr removeAllObjects];

    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(point.x+Width, point.y)];
    [path addArcWithCenter:point radius:Width startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    
    NSMutableArray * pointArr=[NSMutableArray arrayWithCapacity:arr.count];
    for (int i=0; i<arr.count; i++) {
        CGFloat secsAngle90 =  M_PI / 180.0 * (360/arr.count)*i;
        CGFloat starx;
        CGFloat stary;
        CGFloat endx;
        CGFloat endy;
        if (secsAngle90==0) {
           starx=point.x;
           stary=point.y-Width;
           endx=point.x;
           endy=stary-[arr[i] floatValue]*m;
        }else if (secsAngle90<=M_PI / 180.0 *90) {
           CGFloat secsAngle =  M_PI / 180.0 * 90 - M_PI/180.0 * (360/arr.count)*i;
           starx=point.x+Width*cos(secsAngle);
           stary=point.y-Width*sin(secsAngle);
           endx=cos(secsAngle)*[arr[i] floatValue]*m+starx;
           endy=-sin(secsAngle)*[arr[i] floatValue]*m+stary;
            NSDictionary * dic=@{@"endx":[NSNumber numberWithFloat:endx],@"endy":[NSNumber numberWithFloat:endy]};
            [pointArr addObject:dic];
//            NSLog(@"_________________%d_____________________",i);
        }else if ((secsAngle90<=M_PI / 180.0 *180)&&(secsAngle90>M_PI / 180.0 *90)){
            CGFloat secsAngle = M_PI/180.0 * (360/arr.count)*i-M_PI / 180.0 * 90;
            starx=point.x+Width*cos(secsAngle);
            stary=point.y+Width*sin(secsAngle);
            endx=cos(secsAngle)*[arr[i] floatValue]*m+starx;
            endy=sin(secsAngle)*[arr[i] floatValue]*m+stary;
            
            NSDictionary * dic=@{@"endx":[NSNumber numberWithFloat:endx],@"endy":[NSNumber numberWithFloat:endy]};
            [pointArr addObject:dic];
//             NSLog(@"_90_180_______________%d_____________________",i);
        }else if ((secsAngle90<=M_PI / 180.0 *270)&&(secsAngle90>M_PI / 180.0 *180)){
            CGFloat secsAngle = M_PI/180.0 * (360/arr.count)*i-M_PI / 180.0 * 180;
            starx=point.x-Width*sin(secsAngle);
            stary=point.y+Width*cos(secsAngle);
            endx=-sin(secsAngle)*[arr[i] floatValue]*m+starx;
            endy=cos(secsAngle)*[arr[i] floatValue]*m+stary;
            NSDictionary * dic=@{@"endx":[NSNumber numberWithFloat:endx],@"endy":[NSNumber numberWithFloat:endy]};
            [pointArr addObject:dic];
//            NSLog(@"__180_270______________%d_____________________",i);
        }else{//if ((secsAngle90<=M_PI / 180.0 *360)&&(secsAngle90>M_PI / 180.0 *270))
            CGFloat secsAngle =  M_PI / 180.0 * 90 - M_PI/180.0 * (360/arr.count)*i;
            starx=point.x+Width*cos(secsAngle);
            stary=point.y-Width*sin(secsAngle);
            endx=cos(secsAngle)*[arr[i] floatValue]*m+starx;
            endy=-sin(secsAngle)*[arr[i] floatValue]*m+stary;
            
            NSDictionary * dic=@{@"endx":[NSNumber numberWithFloat:endx],@"endy":[NSNumber numberWithFloat:endy]};
            [pointArr addObject:dic];
//        NSLog(@"270-360_%d_________________starx=%lf___stary=%lf______endx=%lf_______endy=%lf_____",i,starx,stary,endx,endy);
            
           
        }
        UIBezierPath *path1 = [[UIBezierPath alloc] init];
        [path1 moveToPoint:CGPointMake(starx, stary)];
        [path1 addLineToPoint:CGPointMake(endx, endy)];
//        [path1 moveToPoint:CGPointMake(endx, endy)];
//        [path1 addArcWithCenter:CGPointMake(endx, endy) radius:1 startAngle:0 endAngle:2*M_PI clockwise:YES];
        CAShapeLayer *shapeLayer1 = [CAShapeLayer layer];
//        shapeLayer1.strokeColor =[UIColor colorWithRed:(arc4random() % 255)/255.f green:(arc4random() % 255)/255.f blue:(arc4random() % 255)/255.f alpha:1].CGColor;
        shapeLayer1.strokeColor =[UIColor cyanColor].CGColor;
        shapeLayer1.fillColor = [UIColor clearColor].CGColor;
        shapeLayer1.lineWidth = 5;
        shapeLayer1.lineJoin = kCALineJoinRound;
        shapeLayer1.lineCap = kCALineCapRound;
        shapeLayer1.path = path1.CGPath;
        [self.layerArr addObject:shapeLayer1];
        [self.layer addSublayer:shapeLayer1];
    }
  
}

-(CAShapeLayer *)drawarcwith:(CGPoint)point withWidth:(CGFloat)Width{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(point.x+Width, point.y)];
    [path addArcWithCenter:point radius:Width startAngle:0 endAngle:2*M_PI clockwise:YES];

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    shapeLayer.fillColor = [UIColor orangeColor].CGColor;
    shapeLayer.lineWidth = 1;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
//    [self.layer addSublayer:shapeLayer];
    return shapeLayer;
    
}

-(NSArray *)drawWithArry:(NSArray *)arr with:(CGPoint)point withWidth:(CGFloat)Width m:(int)m{
    
//    int m=100;
    
    NSMutableArray * pointArr=[NSMutableArray arrayWithCapacity:arr.count];
    for (int i=0; i<arr.count; i++) {
        CGFloat secsAngle90 =  M_PI / 180.0 * (360/arr.count)*i;
        if (secsAngle90==0) {
            
        }else if (secsAngle90<=M_PI / 180.0 *90) {
            CGFloat secsAngle =  M_PI / 180.0 * 90 - M_PI/180.0 * (360/arr.count)*i;
            
            CGFloat starx=point.x+Width*cos(secsAngle);
            CGFloat stary=point.y-Width*sin(secsAngle);
            CGFloat endx=cos(secsAngle)*[arr[i] floatValue]*m+starx;
            CGFloat endy=-sin(secsAngle)*[arr[i] floatValue]*m+stary;
            
            NSDictionary * dic=@{@"endx":[NSNumber numberWithFloat:endx],@"endy":[NSNumber numberWithFloat:endy]};
            [pointArr addObject:dic];
            //            NSLog(@"_________________%d_____________________",i);
        }else if ((secsAngle90<=M_PI / 180.0 *180)&&(secsAngle90>M_PI / 180.0 *90)){
            CGFloat secsAngle = M_PI/180.0 * (360/arr.count)*i-M_PI / 180.0 * 90;
            CGFloat starx=point.x+Width*cos(secsAngle);
            CGFloat stary=point.y+Width*sin(secsAngle);
            CGFloat endx=cos(secsAngle)*[arr[i] floatValue]*m+starx;
            CGFloat endy=sin(secsAngle)*[arr[i] floatValue]*m+stary;
            
            NSDictionary * dic=@{@"endx":[NSNumber numberWithFloat:endx],@"endy":[NSNumber numberWithFloat:endy]};
            [pointArr addObject:dic];
            
            
            //            NSLog(@"_90_180_______________%d_____________________",i);
        }else if ((secsAngle90<=M_PI / 180.0 *270)&&(secsAngle90>M_PI / 180.0 *180)){
            CGFloat secsAngle = M_PI/180.0 * (360/arr.count)*i-M_PI / 180.0 * 180;
            CGFloat starx=point.x-Width*sin(secsAngle);
            CGFloat stary=point.y+Width*cos(secsAngle);
            CGFloat endx=-sin(secsAngle)*[arr[i] floatValue]*m+starx;
            CGFloat endy=cos(secsAngle)*[arr[i] floatValue]*m+stary;
            
            NSDictionary * dic=@{@"endx":[NSNumber numberWithFloat:endx],@"endy":[NSNumber numberWithFloat:endy]};
            [pointArr addObject:dic];
            
        }else if ((secsAngle90<=M_PI / 180.0 *360)&&(secsAngle90>M_PI / 180.0 *270)){
            
            CGFloat secsAngle =  M_PI / 180.0 * 90 - M_PI/180.0 * (360/arr.count)*i;
            CGFloat starx=point.x+Width*cos(secsAngle);
            CGFloat stary=point.y-Width*sin(secsAngle);
            CGFloat endx=cos(secsAngle)*[arr[i] floatValue]*m+starx;
            CGFloat endy=-sin(secsAngle)*[arr[i] floatValue]*m+stary;
            
            NSDictionary * dic=@{@"endx":[NSNumber numberWithFloat:endx],@"endy":[NSNumber numberWithFloat:endy]};
            [pointArr addObject:dic];
            
        }
    }
    
    return  [pointArr copy];
}

-(void)removelayer{
    
    for (CAShapeLayer *shapeLayer in self.lineLayerArr) {
        [shapeLayer removeFromSuperlayer];
    }
    [self.lineLayerArr removeAllObjects];
    
    for (CAShapeLayer *shapeLayer in self.layerArr) {
        [shapeLayer removeFromSuperlayer];
    }
    [self.layerArr removeAllObjects];
    
    
    for (NSString *key in self.IDDic.allKeys) {
        CAShapeLayer *removeShapeLayer=self.IDDic[key][@"layer"];
        if (removeShapeLayer) {
            [removeShapeLayer removeFromSuperlayer];
        }
        
        [self.IDDic removeObjectForKey:key];
    }
    
}

-(void) getControlPointx0:(CGFloat)x0 andy0:(CGFloat)y0
                       x1:(CGFloat)x1 andy1:(CGFloat)y1
                       x2:(CGFloat)x2 andy2:(CGFloat)y2
                       x3:(CGFloat)x3 andy3:(CGFloat)y3
                     path:(UIBezierPath*) path
{
    CGFloat smooth_value =0.6;
    CGFloat ctrl1_x;
    CGFloat ctrl1_y;
    CGFloat ctrl2_x;
    CGFloat ctrl2_y;
    CGFloat xc1 = (x0 + x1) /2.0;
    CGFloat yc1 = (y0 + y1) /2.0;
    CGFloat xc2 = (x1 + x2) /2.0;
    CGFloat yc2 = (y1 + y2) /2.0;
    CGFloat xc3 = (x2 + x3) /2.0;
    CGFloat yc3 = (y2 + y3) /2.0;
    CGFloat len1 = sqrt((x1-x0) * (x1-x0) + (y1-y0) * (y1-y0));
    CGFloat len2 = sqrt((x2-x1) * (x2-x1) + (y2-y1) * (y2-y1));
    CGFloat len3 = sqrt((x3-x2) * (x3-x2) + (y3-y2) * (y3-y2));
    CGFloat k1 = len1 / (len1 + len2);
    CGFloat k2 = len2 / (len2 + len3);
    CGFloat xm1 = xc1 + (xc2 - xc1) * k1;
    CGFloat ym1 = yc1 + (yc2 - yc1) * k1;
    CGFloat xm2 = xc2 + (xc3 - xc2) * k2;
    CGFloat ym2 = yc2 + (yc3 - yc2) * k2;
    ctrl1_x = xm1 + (xc2 - xm1) * smooth_value + x1 - xm1;
    ctrl1_y = ym1 + (yc2 - ym1) * smooth_value + y1 - ym1;
    ctrl2_x = xm2 + (xc2 - xm2) * smooth_value + x2 - xm2;
    ctrl2_y = ym2 + (yc2 - ym2) * smooth_value + y2 - ym2;
    [path addCurveToPoint:CGPointMake(x2, y2) controlPoint1:CGPointMake(ctrl1_x, ctrl1_y)controlPoint2:CGPointMake(ctrl2_x, ctrl2_y)];
}

-(void)drawArcWithArry:(NSArray *)arr with:(CGPoint)point withWidth:(CGFloat)Width withID:(NSString *)ID{

    if (!self.IDDic) {
        self.IDDic=[NSMutableDictionary dictionary];
    }
    CAShapeLayer *removeShapeLayer=self.IDDic[ID][@"layer"];
    if (removeShapeLayer) {
        [removeShapeLayer removeFromSuperlayer];
    }
    [self.IDDic removeObjectForKey:ID];
    NSArray * pointArr=[self drawWithArry:arr with:point withWidth:Width m:0];
    UIBezierPath *path1 = [[UIBezierPath alloc] init];
    for (int i=0; i<pointArr.count; i++) {
        CGFloat x0;
        CGFloat y0;
        CGFloat x1;
        CGFloat y1;
        CGFloat x2;
        CGFloat y2;
        CGFloat x3;
        CGFloat y3;
        if (i==0) {
            x0=point.x;
            y0=point.y-Width-[arr[0] floatValue];
            NSDictionary *starDic=pointArr[1];
            [path1 moveToPoint:CGPointMake([starDic[@"endx"] floatValue], [starDic[@"endy"] floatValue])];
        }else{
            NSDictionary *starDic=pointArr[i];
            x0=[starDic[@"endx"] floatValue];
            y0=[starDic[@"endy"] floatValue];
            
        }

        int m1;
        if (i+1>=pointArr.count) {
            m1=i+1-(int)pointArr.count;
        }else{
            m1=i+1;
        }

        NSDictionary *endDic1=pointArr[m1];
        x1=[endDic1[@"endx"] floatValue];
        y1=[endDic1[@"endy"] floatValue];

        int m2;
        if (i+2>=pointArr.count) {
            m2=i+2-(int)pointArr.count;
        }else{
            m2=i+2;
        }
        NSDictionary *endDic2=pointArr[m2];
        x2=[endDic2[@"endx"] floatValue];
        y2=[endDic2[@"endy"] floatValue];


        int m3;
        if (i+3>=pointArr.count) {
            m3=i+3-(int)pointArr.count;
            
        }else{
            m3=i+3;
        }
        NSDictionary *endDic3=pointArr[m3];
        x3=[endDic3[@"endx"] floatValue];
        y3=[endDic3[@"endy"] floatValue];
        [self getControlPointx0:x0 andy0:y0 x1:x1 andy1:y1 x2:x2 andy2:y2 x3:x3 andy3:y3 path:path1];
    }
    CAShapeLayer *shapeLayer1 = [CAShapeLayer layer];
    shapeLayer1.strokeColor =[UIColor colorWithRed:(arc4random() % 255)/255.f green:(arc4random() % 255)/255.f blue:(arc4random() % 255)/255.f alpha:1].CGColor;
//    shapeLayer1.fillColor = [UIColor colorWithRed:(arc4random() % 255)/255.f green:(arc4random() % 255)/255.f blue:(arc4random() % 255)/255.f alpha:1].CGColor;
    shapeLayer1.fillColor =[UIColor clearColor].CGColor;
    shapeLayer1.lineWidth = 1;
    shapeLayer1.lineJoin = kCALineJoinRound;
    shapeLayer1.lineCap = kCALineCapRound;
    shapeLayer1.path = path1.CGPath;
    [self.layer addSublayer:shapeLayer1];
    self.IDDic[ID]=@{@"point":pointArr,@"layer":shapeLayer1};
    
}



-(void)drawArcWithArry1:(NSArray *)arr WithArry2:(NSArray *)arr2 with:(CGPoint)point withWidth:(CGFloat)Width{
    
    if (!self.IDDic) {
        self.IDDic=[NSMutableDictionary dictionary];
    }
    CAShapeLayer *removeShapeLayer=self.IDDic[@"1"][@"layer"];
    if (removeShapeLayer) {
        [removeShapeLayer removeFromSuperlayer];
    }
    [self.IDDic removeObjectForKey:@"1"];
    
    CAShapeLayer *removeShapeLayer2=self.IDDic[@"2"][@"layer"];
    if (removeShapeLayer2) {
        [removeShapeLayer2 removeFromSuperlayer];
    }
    [self.IDDic removeObjectForKey:@"2"];
    
    NSMutableArray *LA=self.IDDic[@"3"][@"layers"];
    for (CAShapeLayer *removeShapeLayer3  in LA) {
        if (removeShapeLayer3) {
            [removeShapeLayer3 removeFromSuperlayer];
        }
    }
    [self.IDDic removeObjectForKey:@"3"];
    
    
    NSArray * pointArr=[self drawWithArry:arr with:point withWidth:Width m:100];
    UIBezierPath *path1 = [[UIBezierPath alloc] init];
    for (int i=0; i<pointArr.count; i++) {
        CGFloat x0;
        CGFloat y0;
        CGFloat x1;
        CGFloat y1;
        CGFloat x2;
        CGFloat y2;
        CGFloat x3;
        CGFloat y3;
        if (i==0) {
            x0=point.x;
            y0=point.y-Width-[arr[0] floatValue];
            NSDictionary *starDic=pointArr[1];
            [path1 moveToPoint:CGPointMake([starDic[@"endx"] floatValue], [starDic[@"endy"] floatValue])];
            //             [path1 moveToPoint:CGPointMake(x0, y0)];
        }else{
            NSDictionary *starDic=pointArr[i];
            x0=[starDic[@"endx"] floatValue];
            y0=[starDic[@"endy"] floatValue];
            
        }
        
        int m1;
        if (i+1>=pointArr.count) {
            m1=i+1-(int)pointArr.count;
        }else{
            m1=i+1;
        }
        
        NSDictionary *endDic1=pointArr[m1];
        x1=[endDic1[@"endx"] floatValue];
        y1=[endDic1[@"endy"] floatValue];
        
        int m2;
        if (i+2>=pointArr.count) {
            m2=i+2-(int)pointArr.count;
        }else{
            m2=i+2;
        }
        NSDictionary *endDic2=pointArr[m2];
        x2=[endDic2[@"endx"] floatValue];
        y2=[endDic2[@"endy"] floatValue];
        
        
        int m3;
        if (i+3>=pointArr.count) {
            m3=i+3-(int)pointArr.count;
            
        }else{
            m3=i+3;
        }
        NSDictionary *endDic3=pointArr[m3];
        x3=[endDic3[@"endx"] floatValue];
        y3=[endDic3[@"endy"] floatValue];
        [self getControlPointx0:x0 andy0:y0 x1:x1 andy1:y1 x2:x2 andy2:y2 x3:x3 andy3:y3 path:path1];
        
    }
    CAShapeLayer *shapeLayer1 = [CAShapeLayer layer];
    shapeLayer1.strokeColor =[UIColor yellowColor].CGColor;
    shapeLayer1.fillColor =[UIColor clearColor].CGColor;
    shapeLayer1.lineWidth = 2;
    shapeLayer1.lineJoin = kCALineJoinRound;
    shapeLayer1.lineCap = kCALineCapRound;
    shapeLayer1.path = path1.CGPath;
    [self.layer addSublayer:shapeLayer1];
    self.IDDic[@"1"]=@{@"point":pointArr,@"layer":shapeLayer1};
    
    NSMutableArray *a=[NSMutableArray array];
    for (int i=(int)arr2.count-1; i>=0; i--) {
        [a addObject:arr2[i]];
    }

    NSArray * pointArr2=[self drawWithArry:a with:point withWidth:Width m:100];
    UIBezierPath *path2 = [[UIBezierPath alloc] init];
    for (int i=0; i<pointArr2.count; i++) {
        CGFloat x0;
        CGFloat y0;
        CGFloat x1;
        CGFloat y1;
        CGFloat x2;
        CGFloat y2;
        CGFloat x3;
        CGFloat y3;
        if (i==0) {
            x0=point.x;
            y0=point.y-Width-[arr2[0] floatValue];
            NSDictionary *starDic=pointArr2[1];
            [path2 moveToPoint:CGPointMake([starDic[@"endx"] floatValue], [starDic[@"endy"] floatValue])];
        }else{
            NSDictionary *starDic=pointArr2[i];
            x0=[starDic[@"endx"] floatValue];
            y0=[starDic[@"endy"] floatValue];
            
        }
        
        int m1;
        if (i+1>=pointArr2.count) {
            m1=i+1-(int)pointArr2.count;
        }else{
            m1=i+1;
        }
        
        NSDictionary *endDic1=pointArr2[m1];
        x1=[endDic1[@"endx"] floatValue];
        y1=[endDic1[@"endy"] floatValue];
        
        int m2;
        if (i+2>=pointArr.count) {
            m2=i+2-(int)pointArr2.count;
        }else{
            m2=i+2;
        }
        NSDictionary *endDic2=pointArr2[m2];
        x2=[endDic2[@"endx"] floatValue];
        y2=[endDic2[@"endy"] floatValue];
        
        
        int m3;
        if (i+3>=pointArr2.count) {
            m3=i+3-(int)pointArr2.count;
            
        }else{
            m3=i+3;
        }
        NSDictionary *endDic3=pointArr2[m3];
        x3=[endDic3[@"endx"] floatValue];
        y3=[endDic3[@"endy"] floatValue];
        [self getControlPointx0:x0 andy0:y0 x1:x1 andy1:y1 x2:x2 andy2:y2 x3:x3 andy3:y3 path:path2];
        
        }
    
        CAShapeLayer *shapeLayer2 = [CAShapeLayer layer];
        shapeLayer2.strokeColor =[UIColor yellowColor].CGColor;
        shapeLayer2.fillColor =[UIColor clearColor].CGColor;
        shapeLayer2.lineWidth = 2;
        shapeLayer2.lineJoin = kCALineJoinRound;
        shapeLayer2.lineCap = kCALineCapRound;
        shapeLayer2.path = path2.CGPath;
        [self.layer addSublayer:shapeLayer2];
        self.IDDic[@"2"]=@{@"point":pointArr2,@"layer":shapeLayer2};
    
    NSMutableArray *lineArr=[NSMutableArray array];
    for (int i=0; i<pointArr2.count; i++) {
        NSArray *pArr1=self.IDDic[@"1"][@"point"];
        NSArray *pArr2=self.IDDic[@"2"][@"point"];
        NSDictionary *pdic1=pArr1[i];
        NSDictionary *pdic2=pArr2[i];
        int px1=[pdic1[@"endx"] floatValue];
        int py1=[pdic1[@"endy"] floatValue];
        int px2=[pdic2[@"endx"] floatValue];
        int py2=[pdic2[@"endy"] floatValue];
        if ((px1!=px2)&&(py1!=py2)) {
            UIBezierPath *path2 = [[UIBezierPath alloc] init];
            [path2 moveToPoint:CGPointMake(px1, py1)];
            [path2 addLineToPoint:CGPointMake(px2, py2)];
            CAShapeLayer *shapeLayer1 = [CAShapeLayer layer];
            shapeLayer1.strokeColor =[UIColor yellowColor].CGColor;
            shapeLayer1.fillColor =[UIColor clearColor].CGColor;
            shapeLayer1.lineWidth = 2;
            shapeLayer1.lineJoin = kCALineJoinRound;
            shapeLayer1.lineCap = kCALineCapRound;
            shapeLayer1.path = path2.CGPath;
            [self.layer addSublayer:shapeLayer1];
            [lineArr addObject:shapeLayer1];
            self.IDDic[@"3"]=@{@"layers":lineArr};
        }
    }
}


@end
