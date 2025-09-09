//
//  FlowLayout1.m
//  aboutCollectionview
//
//  Created by chensixin on 2025/9/9.
//

/*
    1. 每个 flowlayout 布局对象可以拿到自己的偏移量
 */

#import "FlowLayout1.h"



@implementation FlowLayout1


// 作用
// 调用时间：collectionview 布局的时候就会调用这个函数，或者 reload 的时候
- (void)prepareLayout{
    
    
}




// 作用：确定 cell 的尺寸，详细根据给定的范围 rect 返回这个区域内的所有 cell 的尺寸
// 
- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
//    NSLog(@"%s", __func__);
    
    // 取出
    NSArray *attrs = [super layoutAttributesForElementsInRect:rect];
    
    // 可以对这些 cell 的尺寸进行修改
    
    return attrs;
}



// 作用：在滚动的时候是否允许刷新布局
// 时间
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
//    NSLog(@"%s", __func__);
    
//    return YES;
    return YES;
}



// 作用：确定最终的偏移量
// 时间：用户的手指停止滑动并松开的时候，用户触发
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    
    NSLog(@"%s", __func__);
    
    // 获取最终的偏移量，有缓冲的
    CGPoint theLastOffset = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    NSLog(@"%@", NSStringFromCGPoint(theLastOffset));
    
    // 获取 collectionview 的偏移
    CGPoint theCollectionViewOffset = self.collectionView.contentOffset;
    NSLog(@"%@", NSStringFromCGPoint(theCollectionViewOffset));
    
    
    // 直接调用父类的返回
    return [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
}


@end
