//
//  ViewController.m
//  FJInfiniteScroll_C
//
//  Created by Francis on 16/3/4.
//  Copyright © 2016年 FRAJ. All rights reserved.
//

#import "ViewController.h"
#import "FJImageCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ViewController

static NSInteger FJItemCount = 200;
static NSString *FJImageCellID = @"FJImageCellID";
- (void)viewDidLoad {
    [super viewDidLoad];

    //layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    
    //UICollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.pagingEnabled = YES;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:collectionView];
    
    layout.itemSize = collectionView.frame.size;
    
    //注册cell
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([FJImageCell class]) bundle:nil] forCellWithReuseIdentifier:FJImageCellID];
    
    //默认显示中间的cell
    [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:FJItemCount / 2 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    
}

#pragma mark - <UICollectionViewDataSource>
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return FJItemCount;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FJImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FJImageCellID forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img_0%zd",indexPath.item % 5]];
    
    NSLog(@"%zd",indexPath.item);
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    NSInteger item = (FJItemCount / 2) + (index % 5);
    //设置collectionView无限滚动
    [(UICollectionView *)scrollView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:item inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    
}

@end
