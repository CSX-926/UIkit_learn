//
//  ViewController.m
//  aboutAutoLayout
//
//  Created by chensixin on 2025/9/11.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *yellowView;
@property (nonatomic, strong) UIButton *animateButton;
@property (nonatomic, strong) NSLayoutConstraint *redViewWidthConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景色
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    // 创建示例视图
    [self createViews];
    
    // 1. 基础Auto Layout示例
    [self setupBasicAutoLayout];
    
    // 2. 相对位置约束示例
    [self setupRelativeConstraints];
    
    // 3. 尺寸约束示例
    [self setupSizeConstraints];
    
    // 4. 复杂布局示例
    [self setupComplexLayout];
    
    // 5. 动画按钮
    [self setupAnimationButton];
}

#pragma mark - 创建视图

- (void)createViews {
    // 红色视图
    self.redView = [[UIView alloc] init];
    self.redView.backgroundColor = [UIColor systemRedColor];
    self.redView.translatesAutoresizingMaskIntoConstraints = NO; // 重要：必须设置为NO
    [self.view addSubview:self.redView];
    
    // 蓝色视图
    self.blueView = [[UIView alloc] init];
    self.blueView.backgroundColor = [UIColor systemBlueColor];
    self.blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.blueView];
    
    // 绿色视图
    self.greenView = [[UIView alloc] init];
    self.greenView.backgroundColor = [UIColor systemGreenColor];
    self.greenView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.greenView];
    
    // 黄色视图
    self.yellowView = [[UIView alloc] init];
    self.yellowView.backgroundColor = [UIColor systemYellowColor];
    self.yellowView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.yellowView];
    
    // 动画按钮
    self.animateButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.animateButton setTitle:@"点击动画" forState:UIControlStateNormal];
    self.animateButton.backgroundColor = [UIColor systemPurpleColor];
    [self.animateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.animateButton.layer.cornerRadius = 8;
    self.animateButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.animateButton addTarget:self action:@selector(animateViews) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.animateButton];
}

#pragma mark - 1. 基础Auto Layout示例

- (void)setupBasicAutoLayout {
    /*
     Auto Layout基础概念：
     1. translatesAutoresizingMaskIntoConstraints = NO 是必须的
     2. 使用NSLayoutConstraint创建约束
     3. 约束需要添加到父视图上
     4. 每个视图需要足够的约束来确定位置和大小
     */
    
    // 红色视图的基础约束：距离顶部100点，距离左边50点，宽度200点，高度100点
    [NSLayoutConstraint activateConstraints:@[
        // 位置约束
        [self.redView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:100],
        [self.redView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:50],
        
        // 尺寸约束
        [self.redView.widthAnchor constraintEqualToConstant:200],
        [self.redView.heightAnchor constraintEqualToConstant:100]
    ]];
}

#pragma mark - 2. 相对位置约束示例

- (void)setupRelativeConstraints {
    /*
     相对约束概念：
     1. 视图之间的相对关系
     2. 使用其他视图的锚点作为参考
     3. 可以设置间距和倍数关系
     */
    
    // 蓝色视图：在红色视图下方，左边对齐，宽度是红色视图的0.8倍
    [NSLayoutConstraint activateConstraints:@[
        [self.blueView.topAnchor constraintEqualToAnchor:self.redView.bottomAnchor constant:20],
        [self.blueView.leadingAnchor constraintEqualToAnchor:self.redView.leadingAnchor],
        [self.blueView.widthAnchor constraintEqualToAnchor:self.redView.widthAnchor multiplier:0.8],
        [self.blueView.heightAnchor constraintEqualToConstant:80]
    ]];
}

#pragma mark - 3. 尺寸约束示例

- (void)setupSizeConstraints {
    /*
     尺寸约束类型：
     1. 固定尺寸：constant
     2. 相对尺寸：multiplier
     3. 宽高比：aspectRatio
     4. 优先级：priority
     */
    
    // 绿色视图：在蓝色视图右侧，高度是蓝色视图的1.5倍，宽高比1:1
    [NSLayoutConstraint activateConstraints:@[
        [self.greenView.topAnchor constraintEqualToAnchor:self.blueView.topAnchor],
        [self.greenView.leadingAnchor constraintEqualToAnchor:self.blueView.trailingAnchor constant:20],
        [self.greenView.trailingAnchor constraintLessThanOrEqualToAnchor:self.view.trailingAnchor constant:-20],
        
        // 高度是蓝色视图的1.5倍
        [self.greenView.heightAnchor constraintEqualToAnchor:self.blueView.heightAnchor multiplier:1.5],
        
        // 宽高比1:1（正方形）
        [self.greenView.widthAnchor constraintEqualToAnchor:self.greenView.heightAnchor]
    ]];
}

#pragma mark - 4. 复杂布局示例

- (void)setupComplexLayout {
    /*
     复杂布局技巧：
     1. 使用优先级处理约束冲突
     2. 组合多种约束类型
     3. 使用StackView简化布局
     */
    
    // 黄色视图：在绿色视图下方，水平居中，最小宽度100，最大宽度200
    NSLayoutConstraint *yellowTop = [self.yellowView.topAnchor constraintEqualToAnchor:self.greenView.bottomAnchor constant:20];
    NSLayoutConstraint *yellowCenterX = [self.yellowView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor];
    NSLayoutConstraint *yellowMinWidth = [self.yellowView.widthAnchor constraintGreaterThanOrEqualToConstant:100];
    NSLayoutConstraint *yellowMaxWidth = [self.yellowView.widthAnchor constraintLessThanOrEqualToConstant:200];
    NSLayoutConstraint *yellowHeight = [self.yellowView.heightAnchor constraintEqualToConstant:60];
    
    // 设置优先级
    yellowMinWidth.priority = UILayoutPriorityDefaultHigh;
    yellowMaxWidth.priority = UILayoutPriorityDefaultLow;
    
    [NSLayoutConstraint activateConstraints:@[
        yellowTop, yellowCenterX, yellowMinWidth, yellowMaxWidth, yellowHeight
    ]];
}

#pragma mark - 5. 动画按钮设置

- (void)setupAnimationButton {
    // 动画按钮：在黄色视图下方，水平居中
    [NSLayoutConstraint activateConstraints:@[
        [self.animateButton.topAnchor constraintEqualToAnchor:self.yellowView.bottomAnchor constant:30],
        [self.animateButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.animateButton.widthAnchor constraintEqualToConstant:120],
        [self.animateButton.heightAnchor constraintEqualToConstant:44]
    ]];
}

#pragma mark - 动画示例

- (void)animateViews {
    /*
     Auto Layout动画：
     1. 修改约束的constant值
     2. 在动画块中调用layoutIfNeeded
     3. 可以创建和删除约束
     */
    
    // 保存红色视图的宽度约束用于动画
    if (!self.redViewWidthConstraint) {
        self.redViewWidthConstraint = [self.redView.widthAnchor constraintEqualToConstant:200];
        self.redViewWidthConstraint.active = YES;
    }
    
    // 切换宽度
    CGFloat newWidth = (self.redViewWidthConstraint.constant == 200) ? 300 : 200;
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.redViewWidthConstraint.constant = newWidth;
        [self.view layoutIfNeeded]; // 重要：触发布局更新
    } completion:nil];
}

#pragma mark - 约束调试方法

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // 调试约束冲突（仅在Debug模式下）
    #ifdef DEBUG
    [self checkForConstraintConflicts];
    #endif
}

- (void)checkForConstraintConflicts {
    // 检查约束冲突
    for (UIView *subview in self.view.subviews) {
        if (subview.hasAmbiguousLayout) {
            NSLog(@"⚠️ 视图 %@ 存在模糊布局", subview);
        }
    }
}

@end
