//
//  LVInfinitelyCycleView.m
//  LVInfinitelyCycleBanner
//
//  Created by LV on 2017/11/28.
//  Copyright © 2017年 LV. All rights reserved.
//

#import "LVInfinitelyCycleView.h"
#import <YYKit/YYWeakProxy.h>

#import "LVInfinitelyCycleCollectionCell.h"

@interface LVInfinitelyCycleView()<UICollectionViewDelegate,UICollectionViewDataSource> {
    NSTimer * _timer;
    NSUInteger _totalItemsCount;
    NSMutableArray<NSString *> * _dataArray;
    
    CGFloat _flagOffsetY;
    int _cycleTime;
    
    CGFloat _width;
    CGFloat _height;
}
@property (nonatomic, strong) UIPageControl * pageControl;
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout * flowLayout;
@property (nonatomic, strong) UIImageView * placeholderImageView;
@end

@implementation LVInfinitelyCycleView

#pragma mark - Life Cycle

+ (instancetype)buildDefaultCycleWithFrame:(CGRect)frame placeholderImage:(UIImage *)placehoderImage {
    LVInfinitelyCycleView * cycleScollView = [[LVInfinitelyCycleView alloc] initWithFrame:frame];
    cycleScollView.placeholderImage = placehoderImage;
    return cycleScollView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _width = frame.size.width;
        _height = frame.size.height;
        [self setUpConfigure];
        [self setUpUI];
    }
    return self;
}

- (void)dealloc {
    [_timer invalidate];
}

#pragma mark - Public

- (void)setBannerIamgeUrlGroup:(NSArray<NSString *> *)imageUrlGroup {
    if (imageUrlGroup.count == 0) return;
    [self _handleImageUrlGroup:imageUrlGroup];
    [self setPageControlNumber:imageUrlGroup.count];
    [_collectionView reloadData];
    if (_totalItemsCount > 1) {
        [self _scollToIndex:1 animated:NO];
    }
    [self startAutoTimer];
}

- (void)_handleImageUrlGroup:(NSArray<NSString *> *)imageUrlGroup {
    [_dataArray removeAllObjects];
    if (imageUrlGroup.count == 1) {
        [_dataArray addObjectsFromArray:imageUrlGroup];
        _collectionView.scrollEnabled = NO;
    } else {
        NSString * leadingModel = imageUrlGroup.lastObject;
        NSString * trailingModel = imageUrlGroup.firstObject;
        [_dataArray addObject:leadingModel];
        [_dataArray addObjectsFromArray:imageUrlGroup];
        [_dataArray addObject:trailingModel];
        _collectionView.scrollEnabled = YES;
    }
    _totalItemsCount = _dataArray.count;
}

- (void)setPageControlNumber:(NSUInteger)imageUrlGroupCount {
    _pageControl.numberOfPages = imageUrlGroupCount;
    if (imageUrlGroupCount <= 1) {
        _pageControl.hidden = YES;
    } else {
        _pageControl.hidden = NO;
    }
}

#pragma mark - <UICollectionViewDelegate & UICollectionViewDataSource>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString * bannerItem = _dataArray[MIN(indexPath.row, _dataArray.count-1)];
    //TODO:
    NSLog(@"跳转%@",bannerItem);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    LVInfinitelyCycleCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:kLVInfinitelyCycleCollectionCellIndentifier forIndexPath:indexPath];
    cell.imageUrl = _dataArray[indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataArray.count;
}

#pragma mark - <UIScollViewDelegate>

- (CGFloat)getCurrentIndexFloat {
    return MAX((_collectionView.contentOffset.x) /(CGFloat)(_width), 0);
}

- (int)getCurrentIndexInt {
    return MAX((_collectionView.contentOffset.x) /(_width), 0);
}

- (void)_changePageContorl:(int)index {
    if (index == 0) {
        _pageControl.currentPage = _pageControl.numberOfPages-1;
    } else if (index == _totalItemsCount-1) {
        _pageControl.currentPage = 0;
    } else {
        _pageControl.currentPage = index-1;
    }
}

- (void)_changeScollEndpoint {
    if (_totalItemsCount <= 1) return;
    CGFloat index = (_collectionView.contentOffset.x > _flagOffsetY)?[self getCurrentIndexInt]:[self getCurrentIndexFloat];
    
    if (index == 0) {
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_totalItemsCount-2 inSection:0]
                                atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    } else if (index == _totalItemsCount-1) {
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0]
                                atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self _changeScollEndpoint];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _flagOffsetY = _collectionView.contentOffset.x;
    [self pauseAutoTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self startAutoTimer];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    _flagOffsetY = _collectionView.contentOffset.x;
    [self _changePageContorl:[self getCurrentIndexInt]];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    _flagOffsetY = _collectionView.contentOffset.x;
    [self _changePageContorl:[self getCurrentIndexInt]];
}

#pragma mark - Private

- (void)pauseAutoTimer {
    if(_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)startAutoTimer {
    [self pauseAutoTimer];
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:_cycleTime
                                         target:[YYWeakProxy proxyWithTarget:self]
                                       selector:@selector(repeatCycleScollAction)
                                       userInfo:nil
                                        repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

- (void)repeatCycleScollAction {
    if(_dataArray.count == 0) return;
    int curIndex = [self getCurrentIndexInt];
    [self _scollToIndex:curIndex+1 animated:YES];
}

- (void)_scollToIndex:(int)targetIndex animated:(BOOL)animated{
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:MIN(targetIndex, _totalItemsCount-1) inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:animated];
}

- (void)setUpConfigure {
    _totalItemsCount = 0;
    _flagOffsetY = 0;
    _cycleTime = 5;
    _dataArray = [NSMutableArray arrayWithCapacity:0];
}

- (void)setUpUI {
    [self addSubview:self.collectionView];
    [self addSubview:self.pageControl];
}

#pragma mark - Getter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout * cycleFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        cycleFlowLayout.itemSize = self.bounds.size;
        cycleFlowLayout.minimumLineSpacing = 0;
        cycleFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:cycleFlowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.pagingEnabled = YES;
        _collectionView.scrollsToTop = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[LVInfinitelyCycleCollectionCell class] forCellWithReuseIdentifier:kLVInfinitelyCycleCollectionCellIndentifier];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.frame = CGRectMake(0, _height - 15, _width, 15);
        _pageControl.pageIndicatorTintColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    }
    return _pageControl;
}

@end
