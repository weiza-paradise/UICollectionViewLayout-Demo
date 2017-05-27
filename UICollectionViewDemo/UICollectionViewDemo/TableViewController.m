//
//  TableViewController.m
//  UICollectionViewDemo
//
//  Created by sky on 2017/5/24.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"


@interface StyleModel : NSObject

@property (nonatomic, strong) NSString *class;
@property (nonatomic, strong) NSString *title;

@end

@implementation StyleModel


@end

static NSString *cellIdentifier = @"cellIdentifier";

@interface TableViewController ()

@property (nonatomic, strong) NSMutableArray *styleList;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.styleList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    StyleModel *model = self.styleList[indexPath.row];
    cell.textLabel.text = model.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    StyleModel *model = self.styleList[indexPath.row];
    id vc = [[NSClassFromString(model.class) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - lazy

- (NSMutableArray*)styleList
{
    if (!_styleList) {
        _styleList = [[NSMutableArray alloc]init];
        StyleModel *model1 = [StyleModel new];
        model1.class = @"CircleCollectionViewController";
        model1.title = @"圆形布局";
        [_styleList  addObject:model1];
        
        StyleModel *model2 = [StyleModel new];
        model2.class = @"HorizontalScrollViewController";
        model2.title = @"水平分屏滑动";
        [_styleList  addObject:model2];
        
        StyleModel *model3 = [StyleModel new];
        model3.class = @"TagsCollectionViewController";
        model3.title = @"标签布局";
        [_styleList addObject:model3];
        
        StyleModel *model4 = [StyleModel new];
        model4.class = @"CardCollectionViewController";
        model4.title = @"卡片吸顶布局";
        [_styleList addObject:model4];

    }
    return _styleList;
}

@end
