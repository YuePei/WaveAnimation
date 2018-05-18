//
//  WaveTool.h
//  Wave
//
//  Created by Peyton on 2018/5/18.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    Sin = 0,
    Cos = 1
}PathType;
@interface WaveTool : NSObject

/*参数解释:
 view: 要将该动画添加到哪个View上面
 originPoint: 初始点, 该动画从view上的哪一点开始
 waveWidth: 动画的宽度
 waveHeight: 动画的高度(正弦函数的振幅)
 wavePeriod: 动画的周期, 对应正弦函数的2PI/ω
 offsetX: 动画在x轴的偏移量, 对应正弦函数的φ, 一般设为0即可
 moveSpeed: 动画的移动速度
*/
- (void)addWaveAnimationToView:(UIView *)view pathType:(PathType)pathType withOriginPoint:(CGPoint)originPoint waveWidth:(CGFloat)waveWidth waveHeight:(CGFloat)waveHeight wavePeriod:(CGFloat)wavePeriod offsetX:(CGFloat)offsetX moveSpeed:(CGFloat)moveSpeed;

@end
