//
//  ViewController.m
//  Wave
//
//  Created by Peyton on 2018/5/17.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import "ViewController.h"
#import "WaveTool.h"

@interface ViewController ()
//iv
@property (nonatomic, strong)UIImageView *iv;
//backView
@property (nonatomic, strong)UIView *backView;
//frontIV
@property (nonatomic, strong)UIImageView *frontIV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WaveTool *tool1 = [WaveTool new];
    [tool1 addWaveAnimationToView:self.backView pathType:Sin withOriginPoint:CGPointMake(0, CGRectGetHeight(self.backView.frame) / 2.0) waveWidth:CGRectGetWidth(self.frontIV.frame) waveHeight:10 wavePeriod:200 offsetX:0 moveSpeed:0.15];
    WaveTool *tool = [WaveTool new];
    [tool addWaveAnimationToView:self.frontIV pathType:Cos withOriginPoint:CGPointMake(0, CGRectGetHeight(self.frontIV.frame) / 2.0) waveWidth:CGRectGetWidth(self.frontIV.frame) waveHeight:10 wavePeriod:200 offsetX:0 moveSpeed:0.15];
    
}


#pragma mark lazy
- (UIImageView *)iv {
    if (!_iv) {
        _iv = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
        [self.view addSubview:_iv];
        _iv.layer.cornerRadius = 100;
        _iv.layer.masksToBounds = YES;
        _iv.image = [UIImage imageNamed:@"1"];
    }
    return _iv;
}

- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.iv.frame), CGRectGetHeight(self.iv.frame))];
        [self.iv addSubview:_backView];
        _backView.backgroundColor = [UIColor colorWithRed:45 / 255.0 green:201 / 255.0 blue:250 / 255.0 alpha:1];
    }
    return _backView;
}

- (UIImageView *)frontIV {
    if (!_frontIV) {
        _frontIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.iv.frame), CGRectGetHeight(self.iv.frame))];
        [self.iv addSubview:_frontIV];
        _frontIV.image = [UIImage imageNamed:@"2"];
//        _frontIV.layer.masksToBounds = YES;
//        _frontIV.layer.cornerRadius = 100;
        _frontIV.backgroundColor = [UIColor colorWithRed:47 / 255.0 green:120 / 255.0 blue:238 / 255.0 alpha:1];
    }
    return _frontIV;
}
@end
