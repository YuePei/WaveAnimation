
//
//  WaveTool.m
//  Wave
//
//  Created by Peyton on 2018/5/18.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import "WaveTool.h"
@interface WaveTool()
//aimView
@property (nonatomic, strong)UIView *aimView;
//originPoint
@property (nonatomic, assign)CGPoint originPoint;
//layerWidth
@property (nonatomic, assign)CGFloat layerWidth;
//振幅
@property (nonatomic, assign)CGFloat amplitude;
//角速度
@property (nonatomic, assign)CGFloat polstance;
//偏移量
@property (nonatomic, assign)CGFloat offsetX;
//初相----我这里没有选择包含初相, 因为曲线的平移可以通过设置originPoint实现, 没有必要重复设置
//@property (nonatomic, assign)CGFloat originY;
//speed
@property (nonatomic, assign)CGFloat moveSpeed;

@end
@implementation WaveTool
- (void)addWaveAnimationToView:(UIView *)view pathType:(PathType)pathType withOriginPoint:(CGPoint)originPoint waveWidth:(CGFloat)waveWidth waveHeight:(CGFloat)waveHeight wavePeriod:(CGFloat)wavePeriod offsetX:(CGFloat)offsetX moveSpeed:(CGFloat)moveSpeed{
    
    self.aimView = view;
    self.originPoint = originPoint;
    self.layerWidth = waveWidth;
    self.amplitude = waveHeight;
    self.polstance = 2 * M_PI / wavePeriod;
    self.offsetX = offsetX;
    self.moveSpeed = moveSpeed;
    if (pathType == Sin) {
        CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(waveSinAnimation)];
        [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }else {
        CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(waveCosAnimation)];
        [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
}

//sin
- (void)waveSinAnimation {
    CGMutablePathRef path = CGPathCreateMutable();
    //移动到初始位置
    CGPathMoveToPoint(path, nil, self.originPoint.x, self.originPoint.y);
    //每次刷新屏幕向前移动0.2
    self.offsetX += self.moveSpeed;
    CGFloat y = self.originPoint.y;
    for (CGFloat x = self.originPoint.x; x < self.layerWidth; x ++) {
        y = self.amplitude * sin(self.polstance * x + self.offsetX) + self.originPoint.y;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    //使曲线闭合
    CGPathAddLineToPoint(path, nil, self.layerWidth, CGRectGetHeight(self.aimView.frame));
    CGPathAddLineToPoint(path, nil, self.originPoint.x, CGRectGetHeight(self.aimView.frame));
    CGPathCloseSubpath(path);
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path;
    self.aimView.layer.mask = layer;
}

//cos
- (void)waveCosAnimation {
    CGMutablePathRef path = CGPathCreateMutable();
    //移动到初始位置
    CGPathMoveToPoint(path, nil, self.originPoint.x, self.originPoint.y);
    //每次刷新屏幕向前移动0.2
    self.offsetX += self.moveSpeed;
    CGFloat y = self.originPoint.y;
    for (CGFloat x = self.originPoint.x; x < self.layerWidth; x ++) {
        y = self.amplitude * cos(self.polstance * x + self.offsetX) + self.originPoint.y;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    //使曲线闭合
    CGPathAddLineToPoint(path, nil, self.layerWidth, CGRectGetHeight(self.aimView.frame));
    CGPathAddLineToPoint(path, nil, self.originPoint.x, CGRectGetHeight(self.aimView.frame));
    CGPathCloseSubpath(path);
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path;
    self.aimView.layer.mask = layer;
}


@end
