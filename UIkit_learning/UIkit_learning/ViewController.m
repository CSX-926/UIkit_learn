//
//  ViewController.m
//  UIkit_learning
//
//  Created by chensixin on 2025/9/1.
//

/*
        collectionView
        1. 布局参数
        2. 自定义的 cell 注册
 
 */

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@property (nonatomic, strong) UICollectionView *collectionView;

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemGrayColor];
    
    [self setupLayout];
    [self setupCollectionView];
    
    
//    NSLog(@" 1 collectionview 的大小和位置: %@",
//          NSStringFromCGRect(self.collectionView.frame)); 
}

- (void)setupLayout{
    self.layout = [[UICollectionViewFlowLayout alloc]init];
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.layout.itemSize = CGSizeMake(200, 200);
    self.layout.minimumLineSpacing = 10;
    
}

- (void)setupCollectionView{
//    // safeArea,用 safeAreaInsets 计算
//    CGFloat top = self.view.safeAreaInsets.top;
    
    // 这个 collectionview 的大小
    CGRect frame = CGRectMake(0,
                              300,
                              self.view.frame.size.width,
                              400);
    self.collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:self.layout];
    
    
    self.collectionView.backgroundColor = [UIColor systemCyanColor];
    // CGPoint 中心
    self.collectionView.center = self.view.center;
    self.collectionView.bounds = CGRectMake(0, 300, self.view.frame.size.width,
                                            400);
    
//    NSLog(@" 1 collectionview 的父控件: %@", self.collectionView.superview);

    
    [self.view addSubview:self.collectionView];
    
    NSLog(@" 2 collectionview 的父控件: %@", self.collectionView.superview);
    
//    NSLog(@"collectionview 的子控件: %@", self.collectionView.subviews);
    
    NSLog(@" 2 collectionview 的大小和位置: %@",
          NSStringFromCGRect(self.collectionView.frame)); 
    
}




- (void)viewDidLayoutSubviews{
//    NSLog(@" 3 collectionview 的大小和位置: %@",
//          NSStringFromCGRect(self.collectionView.frame)); 
}





#pragma mark -系统自动调用的方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击了外层的控制器");
}


@end
