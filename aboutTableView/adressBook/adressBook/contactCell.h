//
//  contactCell.h
//  adressBook
//
//  Created by chensixin on 2025/9/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ContactInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface contactCell : UITableViewCell

- (void) configData:(ContactInfo *)con;

@end

NS_ASSUME_NONNULL_END
