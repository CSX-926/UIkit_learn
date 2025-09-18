//
//  ContactInfo.m
//  adressBook
//
//  Created by chensixin on 2025/9/18.
//

#import "ContactInfo.h"
#import "YYModel/YYModel.h"

NS_ASSUME_NONNULL_BEGIN

@implementation ContactInfo

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{
        @"con_name":@"name",
        @"con_phone":@"phone"
    };
}

/*
    格式
        return @{
            @"属性名":@"key名字"
        };
 */

@end

NS_ASSUME_NONNULL_END
