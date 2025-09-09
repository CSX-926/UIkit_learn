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
#import "FlowLayout1.h"
#import "imageCell.h"

@interface ViewController () <UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) FlowLayout1 *layout;
// 
@property (nonatomic, strong) UICollectionView *collectionView;
// 数据源数据
@property (nonatomic, strong) NSArray<UIImage*> *imagesData;

@end




@implementation ViewController

static NSString* const identifier_cell = @"identifier_cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemGrayColor];
    
    [self setupLayout];
    [self setupCollectionView];
    [self loadData];
}

- (void)setupLayout{
    self.layout = [[FlowLayout1 alloc]init];
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 宽度充满屏幕，高度和 collectionview 一样
    self.layout.itemSize = CGSizeMake(self.view.frame.size.width, 400);
    self.layout.minimumLineSpacing = 0;
    
}

- (void)setupCollectionView{
//    // safeArea,用 safeAreaInsets 计算
//    CGFloat top = self.view.safeAreaInsets.top;
    
    // 这个 collectionview 的大小
    CGRect frame = CGRectMake(0, 300,  self.view.frame.size.width, 400);
    self.collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:self.layout];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.backgroundColor = [UIColor systemCyanColor];
    
    // CGPoint 中心
//    self.collectionView.center = self.view.center;
//    self.collectionView.bounds = CGRectMake(0, 300, self.view.frame.size.width, 400);
    
//    NSLog(@" 1 collectionview 的父控件: %@", self.collectionView.superview);
    
    // 注册
    [self.collectionView registerClass:[imageCell class] forCellWithReuseIdentifier:identifier_cell];
    
//    NSLog(@" 2 collectionview 的父控件: %@", self.collectionView.superview);
//    NSLog(@"collectionview 的子控件: %@", self.collectionView.subviews);
    [self.view addSubview:self.collectionView];
}




//- (void)viewDidLayoutSubviews{
//    NSLog(@" 3 collectionview 的大小和位置: %@",
//          NSStringFromCGRect(self.collectionView.frame)); 
//}





#pragma mark -系统自动调用的方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击了外层的控制器");
}



- (void)loadData{
    // 创建数据
    NSArray *namesArr = [NSArray arrayWithObjects:@"image_01", @"image_02", @"image_03", @"image_04", @"image_05", @"image_06", nil];
    
//    NSArray *namesArr1 = @[@"image_01", @"image_02", @"image_03", @"image_04", @"image_05", @"image_06"];
//    NSArray *_arr = [[NSArray alloc]initWithObjects:@"image_01", @"image_02", @"image_03", @"image_04", @"image_05", @"image_06", nil];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for(int i=0; i< namesArr.count; i++){
        UIImage *image = [UIImage imageNamed:namesArr[i]];
        if(image){
            [tempArray addObject:image];
        }
    }
    
    self.imagesData = tempArray;
    
//    NSLog(@"%@", self.imagesData);
}




#pragma mark - uicollectionview 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imagesData.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    imageCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:identifier_cell forIndexPath:indexPath];
    
    // 设置
    cell.imageView.image = self.imagesData[indexPath.item];
    
    return cell;
}

@end
