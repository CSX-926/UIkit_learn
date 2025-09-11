//
//  myButton.m
//  aboutButton
//
//  Created by chensixin on 2025/9/10.
//

#import "myButton.h"

NS_ASSUME_NONNULL_BEGIN

@implementation myButton


// 在里买呢
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 文本居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 图片居中
//        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}




// 重写这个 Button 控件内部的子控件的位置
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(80+10, 14, 80, 80);
    self.titleLabel.frame = CGRectMake(10, 14, 80, 60);
}



//// 重写这个 title 的位置和大小的函数
//- (CGRect)titleRectForContentRect:(CGRect)contentRect{
//    CGRect frame = CGRectMake(10, 14, 80, 60);
//    return frame;
//}
//
//- (CGRect)imageRectForContentRect:(CGRect)contentRect{
//    CGRect frmae = CGRectMake(80+10, 14, 80, 80);
//    return frmae;
//}

@end

NS_ASSUME_NONNULL_END
