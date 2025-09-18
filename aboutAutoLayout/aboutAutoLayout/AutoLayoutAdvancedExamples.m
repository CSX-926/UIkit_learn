//
//  AutoLayoutAdvancedExamples.m
//  aboutAutoLayout
//
//  Created by chensixin on 2025/9/11.
//

#import "AutoLayoutAdvancedExamples.h"

@implementation AutoLayoutAdvancedExamples

#pragma mark - 1. 使用UIStackView简化布局

+ (UIStackView *)createHorizontalStackView {
    /*
     UIStackView是Auto Layout的高级封装，可以简化复杂布局
     优点：
     1. 自动管理子视图的约束
     2. 支持分布和对齐方式
     3. 可以嵌套使用
     4. 支持动画
     */
    
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.axis = UILayoutConstraintAxisHorizontal; // 水平排列
    stackView.distribution = UIStackViewDistributionFillEqually; // 等宽分布
    stackView.alignment = UIStackViewAlignmentFill; // 填充对齐
    stackView.spacing = 10; // 间距
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 添加子视图
    for (int i = 0; i < 3; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0
                                               green:arc4random_uniform(255)/255.0
                                                blue:arc4random_uniform(255)/255.0
                                               alpha:1.0];
        [stackView addArrangedSubview:view];
    }
    
    return stackView;
}

+ (UIStackView *)createVerticalStackView {
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.axis = UILayoutConstraintAxisVertical; // 垂直排列
    stackView.distribution = UIStackViewDistributionFillProportionally; // 按比例分布
    stackView.alignment = UIStackViewAlignmentCenter; // 居中对齐
    stackView.spacing = 15;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    return stackView;
}

#pragma mark - 2. 动态约束管理

+ (void)addDynamicConstraintsToView:(UIView *)view inContainer:(UIView *)container {
    /*
     动态约束管理：
     1. 创建约束引用
     2. 动态激活/停用约束
     3. 修改约束常量
     4. 处理约束冲突
     */
    
    // 创建约束引用
    NSLayoutConstraint *widthConstraint = [view.widthAnchor constraintEqualToConstant:100];
    NSLayoutConstraint *heightConstraint = [view.heightAnchor constraintEqualToConstant:100];
    NSLayoutConstraint *centerXConstraint = [view.centerXAnchor constraintEqualToAnchor:container.centerXAnchor];
    NSLayoutConstraint *centerYConstraint = [view.centerYAnchor constraintEqualToAnchor:container.centerYAnchor];
    
    // 设置约束标识符（用于调试）
    widthConstraint.identifier = @"DynamicWidth";
    heightConstraint.identifier = @"DynamicHeight";
    centerXConstraint.identifier = @"DynamicCenterX";
    centerYConstraint.identifier = @"DynamicCenterY";
    
    // 激活约束
    [NSLayoutConstraint activateConstraints:@[
        widthConstraint, heightConstraint, centerXConstraint, centerYConstraint
    ]];
}

#pragma mark - 3. 约束优先级和冲突处理

+ (void)setupPriorityConstraintsForView:(UIView *)view inContainer:(UIView *)container {
    /*
     约束优先级：
     - UILayoutPriorityRequired (1000): 必需约束
     - UILayoutPriorityDefaultHigh (750): 高优先级
     - UILayoutPriorityDefaultLow (250): 低优先级
     - UILayoutPriorityFittingSizeLevel (50): 适应尺寸
     */
    
    // 创建多个可能冲突的约束
    NSLayoutConstraint *preferredWidth = [view.widthAnchor constraintEqualToConstant:200];
    NSLayoutConstraint *maxWidth = [view.widthAnchor constraintLessThanOrEqualToConstant:300];
    NSLayoutConstraint *minWidth = [view.widthAnchor constraintGreaterThanOrEqualToConstant:100];
    
    // 设置优先级
    preferredWidth.priority = UILayoutPriorityDefaultHigh; // 优先满足
    maxWidth.priority = UILayoutPriorityRequired; // 必须满足
    minWidth.priority = UILayoutPriorityRequired; // 必须满足
    
    // 位置约束
    NSLayoutConstraint *centerX = [view.centerXAnchor constraintEqualToAnchor:container.centerXAnchor];
    NSLayoutConstraint *centerY = [view.centerYAnchor constraintEqualToAnchor:container.centerYAnchor];
    NSLayoutConstraint *height = [view.heightAnchor constraintEqualToConstant:100];
    
    [NSLayoutConstraint activateConstraints:@[
        preferredWidth, maxWidth, minWidth, centerX, centerY, height
    ]];
}

#pragma mark - 4. 响应式布局（支持不同屏幕尺寸）

+ (void)setupResponsiveLayoutForView:(UIView *)view inContainer:(UIView *)container {
    /*
     响应式布局技巧：
     1. 使用Safe Area
     2. 设置最小/最大约束
     3. 使用优先级处理不同屏幕尺寸
     4. 考虑横竖屏切换
     */
    
    // 基础约束
    [NSLayoutConstraint activateConstraints:@[
        [view.topAnchor constraintEqualToAnchor:container.safeAreaLayoutGuide.topAnchor constant:20],
        [view.leadingAnchor constraintEqualToAnchor:container.safeAreaLayoutGuide.leadingAnchor constant:20],
        [view.trailingAnchor constraintEqualToAnchor:container.safeAreaLayoutGuide.trailingAnchor constant:-20],
        [view.heightAnchor constraintEqualToConstant:100]
    ]];
    
    // 响应式宽度约束
    NSLayoutConstraint *minWidth = [view.widthAnchor constraintGreaterThanOrEqualToConstant:200];
    NSLayoutConstraint *maxWidth = [view.widthAnchor constraintLessThanOrEqualToConstant:400];
    
    minWidth.priority = UILayoutPriorityRequired;
    maxWidth.priority = UILayoutPriorityDefaultHigh;
    
    [NSLayoutConstraint activateConstraints:@[minWidth, maxWidth]];
}

#pragma mark - 5. 约束动画和过渡效果

+ (void)animateConstraintChanges:(NSLayoutConstraint *)constraint 
                      newConstant:(CGFloat)newConstant 
                         duration:(NSTimeInterval)duration 
                       completion:(void(^)(BOOL finished))completion {
    /*
     约束动画最佳实践：
     1. 修改约束常量
     2. 在动画块中调用layoutIfNeeded
     3. 使用Spring动画获得更好的效果
     4. 处理动画完成回调
     */
    
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        constraint.constant = newConstant;
        [constraint.firstItem.superview layoutIfNeeded];
    } completion:completion];
}

#pragma mark - 6. 约束调试和验证

+ (void)debugConstraintsForView:(UIView *)view {
    /*
     约束调试技巧：
     1. 使用约束标识符
     2. 检查约束冲突
     3. 验证约束完整性
     4. 使用可视化调试工具
     */
    
    NSLog(@"=== 约束调试信息 ===");
    NSLog(@"视图: %@", view);
    NSLog(@"是否有模糊布局: %@", view.hasAmbiguousLayout ? @"是" : @"否");
    NSLog(@"约束数量: %lu", (unsigned long)view.constraints.count);
    
    // 打印所有约束
    for (NSLayoutConstraint *constraint in view.constraints) {
        NSLog(@"约束: %@", constraint);
    }
    
    // 检查父视图的约束
    if (view.superview) {
        NSLog(@"父视图约束数量: %lu", (unsigned long)view.superview.constraints.count);
    }
}

#pragma mark - 7. 性能优化技巧

+ (void)optimizeAutoLayoutPerformance {
    /*
     Auto Layout性能优化：
     1. 避免过度约束
     2. 使用UIStackView简化布局
     3. 合理使用优先级
     4. 避免频繁修改约束
     5. 使用约束缓存
     */
    
    // 示例：批量更新约束
    NSArray *constraints = @[]; // 你的约束数组
    
    // 先停用所有约束
    [NSLayoutConstraint deactivateConstraints:constraints];
    
    // 修改约束常量
    for (NSLayoutConstraint *constraint in constraints) {
        constraint.constant += 10; // 示例修改
    }
    
    // 重新激活约束
    [NSLayoutConstraint activateConstraints:constraints];
}

#pragma mark - 8. 自定义约束

+ (NSLayoutConstraint *)createCustomConstraint {
    /*
     自定义约束示例：
     1. 继承NSLayoutConstraint
     2. 重写约束计算方法
     3. 实现自定义约束逻辑
     */
    
    // 这里是一个简单的自定义约束示例
    // 实际项目中可能需要更复杂的逻辑
    
    NSLayoutConstraint *customConstraint = [NSLayoutConstraint constraintWithItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:0];
    
    return customConstraint;
}

@end
