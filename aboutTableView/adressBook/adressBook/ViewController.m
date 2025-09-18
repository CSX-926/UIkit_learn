//
//  ViewController.m
//  adressBook
//
//  Created by chensixin on 2025/9/18.
//

#import "ViewController.h"
#import "ContactInfo.h"
#import "YYModel/YYModel.h"
#import "contactCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSArray<ContactInfo *> *ArrayContacts;
@property(nonatomic, strong) NSDictionary<NSString *, NSArray<ContactInfo *>*> *DicContacts;
@property(nonatomic, strong) NSArray *allKeyNames;

@property(nonatomic, strong) UITableView *tableView;


@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];
    [self setupLayout];
    
}


// 准备数据
- (void)setupData{
    // 1. path 路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"contactDatas" ofType:@"json"];
    // 2. path -> data
    NSData *data = [NSData dataWithContentsOfFile:path];
    // 3. data -> dictionary
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    // 4. 取出数据  dictionary -> nsarray
    NSArray *jsonArray = jsonDic[@"contacts"];
    // 5. nsarray -> nsarray<contactInfo> 
    self.ArrayContacts = [NSArray yy_modelArrayWithClass:[ContactInfo class] json:jsonArray];
    
    
    
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSMutableArray *nameKey = [NSMutableArray array];
    // 取出所有的名字
    NSArray *Namekey = [self.ArrayContacts valueForKeyPath:@"con_name"];
    for(NSInteger i=0; i<Namekey.count; i++){
        NSString *firstLet = [[Namekey[i] substringToIndex:1] uppercaseString];
        
        if(!dict[firstLet]){
            dict[firstLet] = [NSMutableArray array];
            // 再存一份
            [nameKey addObject:firstLet];
        }
        [dict[firstLet] addObject:self.ArrayContacts[i]];
    }
    
    self.DicContacts = dict;
    // 排序
    NSArray *sortedKeys = [nameKey sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    self.allKeyNames = sortedKeys;
    
    
    
    // 改进：
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableSet *nameSet = [NSMutableSet set];
    
    for(ContactInfo *con in self.ArrayContacts){
        if(con.con_name.length == 0){
            continue;;
        }
        // 首字母
        NSString *firstName = [[con.con_name substringToIndex:1] uppercaseString];
        if(!dictionary[firstName]){
            dictionary[firstName] = [NSMutableArray array];
        }
        [dictionary[firstName] addObject:con];
        
        [nameSet addObject:firstName];
    }
    
    self.DicContacts = dictionary;
    self.allKeyNames = [[nameSet allObjects] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
}



- (void)setupLayout{
//    CGRect frame = self.view.bounds;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // 指定高度
//    self.tableView.rowHeight = 60;
    // 启动自动计算
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 60;
    
    [self.view addSubview:self.tableView];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:10],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor]
    ]];
    
    
//    // 不能这样设置，这个style 属性是只读的
//    self.tableView.style = UITableViewStylePlain;
}




#pragma mark -datasource 数据源
// 组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.allKeyNames.count;
}

// 组 title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.allKeyNames[section];
}


// 每组
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key = self.allKeyNames[section];
    return self.DicContacts[key].count;
}


// 每 cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cell_indentifier = @"cell_indentifier";
    // 1. cell
    contactCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_indentifier];
    if(!cell){
        cell = [[contactCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cell_indentifier];
    }
    
    // 2. 设置
    NSString *key = self.allKeyNames[indexPath.section];
    ContactInfo *con = self.DicContacts[key][indexPath.row];
    [cell configData:con];
    
    
    
    return cell;
}

// 索引条
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.allKeyNames;
}


// 点击直接跳转
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return index;
}



//// 设置固定的高度，给这个 indexpath 上的 cell
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 60;
//}



@end
