//
//  imageCell.m
//  aboutCollectionview
//
//  Created by chensixin on 2025/9/9.
//

#import "imageCell.h"


@implementation imageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupFrame];
    }
    return self;
}


// 只有一个 uiview
- (void) setupFrame{
    self.imageView = [[UIImageView alloc]init];
    self.imageView.frame = CGRectMake(0,
                                      0,
                                      self.frame.size.width,
                                      self.frame.size.height);
//    self.imageView.frame = self.contentView.frame;
    self.imageView.contentMode = UIViewContentModeCenter; // 居中
    self.imageView.clipsToBounds = YES; // 超出的部分剪掉
    
    [self.contentView addSubview:self.imageView];
}

@end

