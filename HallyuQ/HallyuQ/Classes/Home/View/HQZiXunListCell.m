//
//  HQZiXunListCell.m
//  HallyuQ
//
//  Created by Ace on 15/3/27.
//  Copyright (c) 2015年 HallyuQ. All rights reserved.
//

#import "HQZiXunListCell.h"
#import "HQNews.h"
#import <UIImageView+WebCache.h>


@interface HQZiXunListCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *themeLabel;
@property (weak, nonatomic) IBOutlet UIButton *viewsButton;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation HQZiXunListCell

+ (instancetype)cellWithTableView:(UITableView *)tableview
{
    static NSString *identifier = @"cell";
    HQZiXunListCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HQZiXunListCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)setNews:(HQNews *)news
{
    _news = news;
    self.iconView.contentMode = UIViewContentModeScaleAspectFill;
    self.iconView.clipsToBounds = YES;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:news.image]];
    
    self.titleLabel.text = news.titile;
    
    self.timeLabel.text = news.date;
    
    self.authorLabel.text = news.author;
    
    self.themeLabel.text = news.theme;
    
    [self.viewsButton setTitle:[NSString stringWithFormat:@" %ld", (long)news.views] forState:UIControlStateNormal]; 
    
    //设置正文内容
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:news.content];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:8];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [news.content length])];
    _contentLabel.attributedText = attributedString;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
