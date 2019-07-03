//
//  TweetTableViewCell.h
//  twitter
//
//  Created by juliapark628 on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *tweeterProfileImageView;
@property (weak, nonatomic) IBOutlet UILabel *tweeterNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweeterScreenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateCreatedLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UILabel *retweetCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCountLabel;

@property (strong, nonatomic) Tweet *tweet;

@end

NS_ASSUME_NONNULL_END
