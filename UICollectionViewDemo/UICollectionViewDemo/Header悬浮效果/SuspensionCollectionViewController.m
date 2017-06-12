//
//  SuspensionCollectionViewController.m
//  UICollectionViewDemo
//
//  Created by wei on 2017/5/31.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "SuspensionCollectionViewController.h"
#import "SuspensionReusableView.h"
#import "CommonMacro.h"
#import "SuspensionLayout.h"

@interface SuspensionCollectionViewController ()

@end

@implementation SuspensionCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString * const reuseReusableIdentifier = @"reusableIdentifier";

- (instancetype)init
{
    SuspensionLayout *layout = [[SuspensionLayout alloc]init];
    layout.minimumLineSpacing      = 2;
    layout.minimumInteritemSpacing = 2;
    layout.itemSize = CGSizeMake((SCREEN_WIDTH-8)/3, SCREEN_WIDTH*100.f/320.f);
    layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 40);
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"SuspensionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseReusableIdentifier];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 20;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    //NSInteger count = arc4random() % 15 ;
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.contentView.backgroundColor = [UIColor purpleColor];
    return cell;
}

- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    SuspensionReusableView * reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseReusableIdentifier forIndexPath:indexPath];
    reusableView.backgroundColor = [UIColor orangeColor];
    reusableView.titleLabel.text = [NSString stringWithFormat:@"第 %td 个HeaderView",indexPath.section];
    return reusableView;
}

@end
