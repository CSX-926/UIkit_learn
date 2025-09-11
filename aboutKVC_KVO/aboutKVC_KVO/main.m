//
//  main.m
//  aboutKVC_KVO
//
//  Created by chensixin on 2025/9/10.
//

#import <Foundation/Foundation.h>
#import "PersonModel.h"
#import "puppyModel.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        PersonModel *human1 = [[PersonModel alloc]init];
        // 初始化方式 1:
        human1.name = @"chensixin";
        human1.age = 20;
        human1.height = 161.3;
//        NSLog(@"%@  %ld  %.2f \n", human1.name, human1.age, human1.height);
        
        
        // 2. KVC 初始化
        PersonModel *human2 = [[PersonModel alloc]init];
        [human2 setValue:@"siyicheng" forKey:@"name"];
        [human2 setValue:@"21" forKey:@"age"];
        [human2 setValue:@"182.1" forKey:@"height"];
//        NSLog(@"%@  %ld  %.2f", human2.name, human2.age, human2.height);
        
        
        // 3. 使用 forKeyPath， 访问内部点语法
        human1.puppy = [[puppyModel alloc]init]; // 不要忘了初始化
        [human1 setValue:@"福财" forKeyPath:@"puppy.puppyName"];
//        NSLog(@"%@", human1.puppy.puppyName);
        
        
        
        // 4. KVC 方式访问私有成员变量   **********************************重要，修改的特性很有用
//        [human1 print_privateVar]; // 0
        [human1 setValue:@"926" forKeyPath:@"privateVar"];
//        [human1 print_privateVar]; // 926
        
        
        
        // 5. KVC 方式，直接传入字典传模型
        NSDictionary *dic = @{
            @"name":@"jinsaheun",
            @"age":@"20"
        };
        [human1 setValuesForKeysWithDictionary:dic];
//        NSLog(@"%@  %ld", human1.name, human1.age);
        
        
        
        // 6. 还可以实现模型转字典
        NSDictionary *dict = [human1 dictionaryWithValuesForKeys:@[@"name", @"age"]];
//        NSLog(@"%@", dict);
        
        
        // 7. 还可以将数组中的所有模型的某种属性全部 提取出来
        PersonModel *human3 = [[PersonModel alloc]init];
        [human3 setValue:@"chris jin" forKeyPath:@"name"];
        [human3 setValue:@"20" forKeyPath:@"age"];
        
        NSArray *personArray = @[human1, human2, human3];
        NSArray *presonNames = [personArray valueForKeyPath:@"name"];
        
        NSLog(@"%@", presonNames); // 成功输出
    }
    return 0;
}
