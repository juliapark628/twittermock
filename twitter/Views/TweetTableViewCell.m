//
//  TweetTableViewCell.m
//  twitter
//
//  Created by juliapark628 on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "TweetTableViewCell.h"
#import "Tweet.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"

@implementation TweetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


- (IBAction)retweetButtonClicked:(id)sender {
    [[APIManager shared] toggleRetweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error (un)retweeting tweet: %@", error.localizedDescription);
        }
        else {
            NSLog(@"Successfully (un)retweeted the following Tweet: %@", tweet.text);
        }
    }];
    
    if (self.tweet.retweeted == NO) {
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
    }
    else {
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
    }
    
    [self refreshDataAtCell:self withTweet:self.tweet];
}

- (IBAction)favoriteButtonClicked:(id)sender {
    [[APIManager shared] toggleFavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error (un)favoriting tweet: %@", error.localizedDescription);
        }
        else {
            NSLog(@"Successfully (un)favorited the following Tweet: %@", tweet.text);
        }
    }];
        
    if (self.tweet.favorited == NO) {
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
    }
    else {
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
    }
    
    [self refreshDataAtCell:self withTweet:self.tweet];
}

- (void)refreshDataAtCell:(TweetTableViewCell*)cell withTweet:(Tweet*)currTweet {
    
    [cell.tweeterProfileImageView setImageWithURL:currTweet.user.profilePictureURL];
    
    cell.tweeterNameLabel.text = currTweet.user.name;
    cell.tweeterScreenNameLabel.text = currTweet.user.screenName;
    cell.dateCreatedLabel.text = currTweet.createdAtString;
    cell.tweetTextLabel.text = currTweet.text;
    cell.retweetCountLabel.text = [NSString stringWithFormat:@"%d", currTweet.retweetCount];
    
    cell.favoriteCountLabel.text = [NSString stringWithFormat:@"%d", currTweet.favoriteCount];
    
    if (self.tweet.favorited == NO) {
        [cell.favoriteButton setSelected:NO];
    }
    else {
        [cell.favoriteButton setSelected:YES];
    }
    
    if (self.tweet.retweeted == NO) {
        [cell.retweetButton setSelected:NO];
    }
    else {
        [cell.retweetButton setSelected:YES];
    }
}

@end
