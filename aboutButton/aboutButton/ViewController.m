//
//  ViewController.m
//  aboutButton
//
//  Created by chensixin on 2025/9/10.
//

#import "ViewController.h"
#import "myButton.h"

@interface ViewController ()

@property(nonatomic, strong) myButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btn = [myButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake(100, 200, 200, 100);
    self.btn.backgroundColor = [UIColor systemBackgroundColor];
    self.btn.layer.cornerRadius = 14;
    self.btn.clipsToBounds = YES;
    self.btn.layer.borderWidth = 1.0;
    

    
    [self.btn setTitle:@"这是按钮" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal]; 
    
    [self.btn setImage:[UIImage imageNamed:@"hungry"] forState:UIControlStateNormal];
//    [self.btn.imageView setImage:[UIImage imageNamed:@"hungry"]];    
    
//    self.btn.imageView.backgroundColor = [UIColor purpleColor];
//    self.btn.titleLabel.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.btn];
}


@end
