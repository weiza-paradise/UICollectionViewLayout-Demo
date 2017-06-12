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
        _styleList = [NSMutableArray array];
        
        [_styleList addObject:[self getStyleModelWithClassName:@"CircleCollectionViewController" title:@"圆形布局"]];
        [_styleList addObject:[self getStyleModelWithClassName:@"HorizontalScrollViewController" title:@"水平分屏滑动"]];
        [_styleList addObject:[self getStyleModelWithClassName:@"TagsCollectionViewController" title:@"标签布局"]];
        [_styleList addObject:[self getStyleModelWithClassName:@"CardCollectionViewController" title:@"卡片吸顶布局"]];
        [_styleList addObject:[self getStyleModelWithClassName:@"SuspensionCollectionViewController" title:@"Header悬浮效果"]];
        [_styleList addObject:[self getStyleModelWithClassName:@"RadioCollectionView" title:@"单选,多选"]];
    }
    return _styleList;
}

- (StyleModel *)getStyleModelWithClassName:(NSString *)className title:(NSString*)title
{
    StyleModel *model = [StyleModel new];
    model.class = className;
    model.title = title;
    return model;
}

@end
