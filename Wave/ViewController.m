//
//  ViewController.m
//  Wave
//
//  Created by Peyton on 2018/5/17.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//iv
@property (nonatomic, strong)UIImageView *iv;
//layerWidth
@property (nonatomic, assign)CGFloat layerWidth;
//振幅
@property (nonatomic, assign)CGFloat amplitude;
//角速度
@property (nonatomic, assign)CGFloat polstance;
//偏移量
@property (nonatomic, assign)CGFloat offsetX;
//初相
@property (nonatomic, assign)CGFloat originY;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI {
    self.layerWidth = CGRectGetWidth(self.iv.frame);
    //振幅
    self.amplitude = 9;
    self.polstance = 2 * M_PI / self.layerWidth;
    self.offsetX =0;
    self.originY = CGRectGetHeight(self.iv.frame) / 2.0;
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateWave1)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)updateWave1
{
    CGMutablePathRef path = CGPathCreateMutable();
    //初始位置
    CGPathMoveToPoint(path, nil, 0, self.originY);
    float y = self.originY;
    self.offsetX += 0.2;
    for (float x = 0.0f; x < self.layerWidth; x ++) {
        y = self.amplitude * sin(self.polstance * x + self.offsetX) + self.originY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil, CGRectGetWidth(self.iv.frame), CGRectGetHeight(self.iv.frame));
    CGPathAddLineToPoint(path, nil, 0, CGRectGetHeight(self.iv.frame));
    CGPathCloseSubpath(path);
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path;
    self.iv.layer.mask = layer;
}

#pragma mark lazy
- (UIImageView *)iv {
    if (!_iv) {
        _iv = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
        [self.view addSubview:_iv];
        _iv.backgroundColor = [UIColor blueColor];
    }
    return _iv;
}


@end
