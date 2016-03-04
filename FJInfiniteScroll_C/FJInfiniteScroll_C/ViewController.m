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
    
    
}


@end
