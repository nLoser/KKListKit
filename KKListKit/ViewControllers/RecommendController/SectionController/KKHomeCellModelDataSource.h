//
//  KKHomeCellModelDataSource.h
//  KKListKit
//
//  Created by LV on 2018/6/20.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KKHomeCellModelDataSource <NSObject>

@required

- (void)updateToObject:(id)object;

@end
