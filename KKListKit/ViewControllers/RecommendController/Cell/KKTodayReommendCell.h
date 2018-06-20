//
//  KKTodayReommendCell.h
//  KKListKit
//
//  Created by LV on 2018/6/20.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KKHomeListModel.h"

@interface KKTodayReommendCell : UICollectionViewCell

- (void)updateToObject:(KKHomeTopicModel *)object index:(NSInteger)index;

@end
