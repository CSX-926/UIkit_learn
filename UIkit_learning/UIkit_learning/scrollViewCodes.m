//
//  scrollViewCodes.m
//  UIkit_learning
//
//  Created by chensixin on 2025/9/8.
//
//
//#import "ViewController.h"
//
//@interface ViewController () <UIScrollViewDelegate>
//
//@property (nonatomic, strong) UIScrollView *scrollView;
//
//@end
//
//
//
//
//@implementation ViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    self.scrollView = [[UIScrollView alloc] init];
//    self.scrollView.frame = CGRectMake(50, 80, 200, 300);
//    self.scrollView.backgroundColor = [UIColor systemRedColor];
//    [self.view addSubview:self.scrollView];
//    
//
//    UIImage *image = [UIImage imageNamed:@"dog_puppy"];
//    if(!image){
//        NSLog(@"图片加载失败");
//        return;
//    }
//    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
//    imageView.backgroundColor = [UIColor systemCyanColor];
//    [self.scrollView addSubview:imageView];
//    
//    // 图片的显示的区域
////    self.scrollView.contentSize = image.size;
//    // 值一般得大于 scrollview 的frame 的设置值才行，才有滚动的效果
//    self.scrollView.contentSize = CGSizeMake(500, 800); // 设置这个
//    
//    
//    self.scrollView.bounces = YES; // 弹簧的效果打开
//    
//    // 设置和获取，内容图片的偏移量
//    // 图片在最开始的时候，显示的位置（contentView 在 scrollView 的位置）
//    self.scrollView.contentOffset = CGPointZero;
//    
//}
//
//
//
//// 点击到最外层的控制器的时候，系统自动的调用这个函数
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"点击了外层的控制器 view");
//}
//




//@end
