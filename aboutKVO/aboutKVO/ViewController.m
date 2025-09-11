//
//  ViewController.m
//  aboutKVO
//
//  Created by chensixin on 2025/9/11.
//

#import "ViewController.h"
#import "PersonModel.h"
/*
    Key Value Observer：键值观察
 */

@interface ViewController()

@property (nonatomic, strong) PersonModel *person1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    PersonModel *person2 = [[PersonModel alloc]init];
    
    // 1. name
    [person2 setValue:@"chensixin" forKeyPath:@"name"];
    
    /*
     addObserver: 观察者是谁，一般这里写控制器  self
     forKeyPath: 要监听的字段
     options: 监听修改和以前的旧值还是只监听新值
        NSKeyValueObservingOptionNew
        NSKeyValueObservingOptionOld
     context:
     */
    // 添加监听对象
    [person2 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    // 修改
    [person2 setValue:@"chris jin" forKeyPath:@"name"];
    [person2 setValue:@"jinsaheun" forKeyPath:@"name"];
    
    
    
    // 2. age
    [person2 setValue:@"20" forKeyPath:@"age"];
    [person2 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    // 修改
    [person2 setValue:@"21" forKeyPath:@"age"];
    [person2 setValue:@"22" forKeyPath:@"age"];
    
    
    // 3. 建议在这里移除一下
    [person2 removeObserver:self forKeyPath:@"name"];
    [person2 removeObserver:self forKeyPath:@"age"];
}



// 这一个函数可以对于所有的监听对象做出反应，这里就是打印
// 不管是 name 属性的修改监听，还是 age 属性的，这里这一个函数就都输出出来了
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@ --- %@ --- %@", keyPath, object, change);
}





- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
