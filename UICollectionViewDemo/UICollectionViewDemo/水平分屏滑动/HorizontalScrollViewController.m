//
//  HorizontalScrollViewController.m
//  UICollectionViewDemo
//
//  Created by sky on 2017/5/25.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "HorizontalScrollViewController.h"
#import <Masonry/Masonry.h>
#import "HorizontalScrollCell.h"
#import "HorizontalScrollLayout.h"
#import <YYImage/YYImage.h>

static NSString * const reuseIdentifier = @"HorizontalScrollCell";

@interface HorizontalScrollViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, weak) UIPageControl *pageControl;

@end

@implementation HorizontalScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO ;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HorizontalScrollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    int x = arc4random() % 20 + 1;
    YYImage * image = [YYImage imageNamed:[NSString stringWithFormat:@"%d.gif",x]];
    cell.imgView.image = image;
    cell.title.text = [NSString stringWithFormat:@"%td",indexPath.item];
    return cell;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger page = floor(scrollView.contentOffset.x) / self.view.bounds.size.width;
    if ( page >=0 && page <= self.pageControl.numberOfPages )
    {
        self.pageControl.currentPage = page;
    }
}

#pragma mark - lazy

- (UICollectionView*)collectionView
{
    if (!_collectionView) {
        HorizontalScrollLayout *layout = [[HorizontalScrollLayout alloc]init];
        layout.itemSize = CGSizeMake((self.view.bounds.size.width-10-8)/4, (300-4)/3);
        layout.minimumInteritemSpacing = 2;
        layout.minimumLineSpacing = 2;
        layout.numberOfItemsInPage = 16;
        layout.columnsInPage = 4;
        layout.pageInset = UIEdgeInsetsMake(0, 5, 0, 5);

        UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        collection.backgroundColor = [UIColor whiteColor];
        collection.pagingEnabled = YES;
        collection.delegate   = self;
        collection.dataSource = self;
        [collection registerNib:[UINib nibWithNibName:@"HorizontalScrollCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
        [self.view addSubview:collection];
        [self.view bringSubviewToFront:self.pageControl];
        _collectionView = collection;
        [collection mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(@200);
            make.height.mas_equalTo(@300);
            make.left.right.mas_equalTo(@0);
        }];
    }
    return _collectionView;
}

- (UIPageControl*)pageControl
{
    if (!_pageControl) {
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        pageControl.numberOfPages = 7;
        pageControl.currentPage   = 0;
        pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
        [self.view addSubview:pageControl];
        _pageControl = pageControl;
        [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.collectionView.mas_bottom).mas_offset(@5);
            make.left.mas_equalTo(@50);
            make.right.mas_equalTo(@(-50));
        }];
    }
    return _pageControl;
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

@end
