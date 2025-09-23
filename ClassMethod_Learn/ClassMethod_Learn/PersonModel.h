//
//  PersonModel.h
//  ClassMethod_Learn
//
//  Created by chensixin on 2025/9/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonModel : NSObject

@property(nonatomic, strong) NSString *PersonName;
@property(nonatomic, assign) NSInteger PersonAge;


// 类方法们
+(NSString *)ReturnPersonName;
+(instancetype) personWithName:(NSString *)name paramAge:(NSInteger) age;
+ (void)logOneWord;

- (void)introduceMySelf;

@end

NS_ASSUME_NONNULL_END
