//
//  highPointCode.m
//  UIkit_learning
//
//  Created by chensixin on 2025/9/8.
//

#import "highPointCode.h"

NS_ASSUME_NONNULL_BEGIN

@implementation highPointCode


// 点击到最外层的控制器的时候，系统自动的调用这个函数
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击了外层的控制器 view");
}





@end

NS_ASSUME_NONNULL_END
