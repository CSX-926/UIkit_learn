//
//  PersonModel.m
//  ClassMethod_Learn
//
//  Created by chensixin on 2025/9/23.
//

#import "PersonModel.h"

NS_ASSUME_NONNULL_BEGIN

@implementation PersonModel


+ (instancetype)personWithName:(NSString *)name paramAge:(NSInteger)age{
    PersonModel *p = [[PersonModel alloc] init];
    p.PersonName = name;
    p.PersonAge = age;
    
    return p;
}

+ (NSString *)ReturnPersonName{
    return @"chensixin";
}

+ (void)logOneWord{
    NSLog(@"hello, i am the class method");
}

// 有示例创建出来之后才能调用这个 - 方法
-(void) introduceMySelf{
    NSLog(@"hello, my name is %@, my age is %ld",
          self.PersonName,
          self.PersonAge);
}

@end

NS_ASSUME_NONNULL_END
