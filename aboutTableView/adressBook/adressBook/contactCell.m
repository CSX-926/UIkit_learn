//
//  contactCell.m
//  adressBook
//
//  Created by chensixin on 2025/9/18.
//

#import "contactCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface contactCell()

// 加到 self.contentView 上
@property(nonatomic, strong) UIView *headView;
@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *phoneLabel;

@end

@implementation contactCell

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self setupFrame];
//    }
//    return self;
//}

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//
//}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setupFrame];
        
    }
    
    return self;
}


- (void) setupFrame{

    self.headView = [[UIView alloc] init];
    self.headView.layer.cornerRadius = 23;
    self.headView.clipsToBounds = YES;
    [self.contentView addSubview:self.headView];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.nameLabel setTextColor:[UIColor blackColor]];
    [self.contentView addSubview:self.nameLabel];
    
    self.phoneLabel = [[UILabel alloc] init];
    [self.phoneLabel setTextColor:[UIColor systemGray3Color]];
    [self.contentView addSubview:self.phoneLabel];
    
    
    self.headView.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.phoneLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [NSLayoutConstraint activateConstraints:@[
        // 头像
        [self.headView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10],
        [self.headView.widthAnchor constraintEqualToConstant:46],
        [self.headView.heightAnchor constraintEqualToConstant:46],
        [self.headView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        
        // 名字 
        [self.nameLabel.leadingAnchor constraintEqualToAnchor:self.headView.trailingAnchor constant:10],
        [self.nameLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10],
        
        // 电话
        [self.phoneLabel.leadingAnchor constraintEqualToAnchor:self.headView.trailingAnchor constant:10],
        [self.phoneLabel.topAnchor constraintEqualToAnchor:self.nameLabel.bottomAnchor constant:10],
        
        // 设置底部约束，这样系统才能算出总高度
        // 确保 contentView 有个从上到下的约束链
        [self.phoneLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-5]
        
    ]];
    
}



//- (void)layoutSubviews{
//    CGFloat h_w = 46;
//    CGFloat y = (self.contentView.bounds.size.height - h_w) / 2.0;
//    CGRect headView_frame = CGRectMake(10, y, h_w, h_w);
//    self.headView.frame = headView_frame;
//    
//    CGFloat x = self.headView.frame.size.width + 2*10;
//    self.nameLabel.frame = CGRectMake(x, 0, 100, 30);
//    
//    
//    self.phoneLabel.frame = CGRectMake(x, 30, 120, 30);
//}


- (void) configData:(ContactInfo *)con{
    self.nameLabel.text = con.con_name;
    self.phoneLabel.text = con.con_phone;
    
    NSString *url = con.con_headimageUrl;
    if(url.length == 0){
        NSLog(@"image_url 等于空");
    }else{
        // 设置头像
    }
    
}



@end

NS_ASSUME_NONNULL_END
