//
//  main.m
//  ClassMethod_Learn
//
//  Created by chensixin on 2025/9/23.
//

#import <Foundation/Foundation.h>
#import "PersonModel.h"

/*
    在这个里面复习了 KVC 的语法  [实例对象名 setValue: forKeyPath:];
    
    总的来说，类方法的调用就是
    [类名 类方法];
 
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 直接在创建的时候就调用类方法来创建对象
        PersonModel *ps = [PersonModel personWithName:@"欣" paramAge:20];
        
        // 
        PersonModel *ps2 = [[PersonModel alloc] init];
        [ps2 setValue:@"陈" forKeyPath:@"personName"];
        [ps2 setValue:@"20" forKeyPath:@"personAge"];
        
        [ps introduceMySelf];
        [ps2 introduceMySelf];
        
        
        NSLog(@"call returnPersonName class method return : %@",
              [PersonModel ReturnPersonName]);
        
        NSLog(@"call one other class method log :");
        [PersonModel logOneWord];
        
    }
    return 0;
}
