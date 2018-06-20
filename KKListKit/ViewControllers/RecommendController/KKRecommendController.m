//
//  KKRecommendController.m
//  KKListKit
//
//  Created by LV on 2018/6/14.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import "KKRecommendController.h"
#import "TestDataSourceTool.h"

#import <IGListKit/IGListKit.h>

@interface KKRecommendController () <IGListAdapterDataSource>

@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation KKRecommendController

#pragma mark - LifeCycle

- (instancetype)init {
    if (self = [super init]) {
        [self initSetup];
    }
    return self;
}

- (void)initSetup {
    IGListAdapterUpdater *updater = [[IGListAdapterUpdater alloc] init];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:updater viewController:self];
    self.datas = [NSMutableArray array];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kLowerstColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.collectionView];
    
    self.adapter.dataSource = self;
    self.adapter.collectionView = self.collectionView;
    
    [self reloadData];
}

#pragma mark - Getter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 64 - 49) collectionViewLayout:layout];
        _collectionView.backgroundColor = kTextLightColor;
    }
    return _collectionView;
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSLog(@"%@",self.datas);
    return self.datas;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:[KKHomeModuleDataModel class]]) {
        NSLog(@"%@",[object sectionController]);
        return [object sectionController];
    }
    return nil;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - Private Method

- (void)reloadData {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        KKHomeListResultModel *result = [TestDataSourceTool requestHomeListResult];
        self.datas = [NSMutableArray arrayWithArray:result.data.info_list];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.adapter reloadDataWithCompletion:^(BOOL finished) {
                //TODO:
            }];
        });
    });
}

@end
