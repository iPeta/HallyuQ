//
//  HQZiXunListCell.h
//  HallyuQ
//
//  Created by Ace on 15/3/27.
//  Copyright (c) 2015年 HallyuQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HQNews;

@interface HQZiXunListCell : UITableViewCell

@property (strong, nonatomic) HQNews *news;

+ (instancetype)cellWithTableView:(UITableView *)tableview;

@end
