//
//  TagsCollectionViewController.m
//  UICollectionViewDemo
//
//  Created by sky on 2017/5/26.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "TagsCollectionViewController.h"
#import "TagsCell.h"
#import "TagsLayout.h"
#import "TagsModel.h"
#import <YYModel/YYModel.h>

@interface TagsCollectionViewController ()<UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *dataSoure;

@end

@implementation TagsCollectionViewController

static NSString * const reuseIdentifier = @"TagsCell";

- (instancetype)init
{
    TagsLayout *layout = [[TagsLayout alloc]init];
    layout.delegate = self;
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"TagsCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return [self.dataSoure count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TagsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    TagsModel *model = self.dataSoure[indexPath.item];
    cell.title.text = model.name;
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TagsModel *model = self.dataSoure[indexPath.item];
    //10 为左右间距和
    return CGSizeMake(model.contentSize.width + 10 , 21);
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/


#pragma mark - lazy

- (NSMutableArray*)dataSoure
{
    if (!_dataSoure) {
        /* 模拟数据 */
        NSArray *array = [NSArray arrayWithObjects:
                          @{@"name":@"北国"},
                          @{@"name":@"美丽的热巴"},
                          @{@"name":@"海贼王"},
                          @{@"name":@"雪"},
                          @{@"name":@"强风吹拂"},
                          @{@"name":@"北京"},
                          @{@"name":@"落差"},
                          @{@"name":@"购物的男孩"},
                          @{@"name":@"摇摆的风扇"},
                          @{@"name":@"热门"},
                          @{@"name":@"风景~"},
                          @{@"name":@"棒子达"},
                          @{@"name":@"上地"},
                          @{@"name":@"泰山"},
                          @{@"name":@"它"},
                          @{@"name":@"屋里面"}, nil];
        
        _dataSoure = [NSMutableArray array];
        for (NSDictionary *item in array) {
            TagsModel *model = [TagsModel yy_modelWithJSON:item];
            [_dataSoure addObject:model];
        }
    }
    return _dataSoure;
}


@end
