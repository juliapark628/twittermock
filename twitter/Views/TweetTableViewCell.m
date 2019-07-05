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
    self.tweet.retweeted = YES;
    self.tweet.retweetCount += 1;
}

- (IBAction)favoriteButtonClicked:(id)sender {
    NSLog(@"%@", self.tweet);
    self.tweet.favorited = YES;
    NSLog(@"%d", self.tweet.favoriteCount); 
    self.tweet.favoriteCount += 1;
    Tweet* tweetPointer = self.tweet;
    NSLog(@"%d", self.tweet.favoriteCount);
    [self refreshDataAtCell:self withTweet:tweetPointer];
    
}

- (void)refreshDataAtCell:(TweetTableViewCell*)cell withTweet:(Tweet*)currTweet {
    NSLog(@"%@", currTweet);
    /*
    [cell.tweeterProfileImageView setImageWithURL:currTweet.user.profilePictureURL];
    
    cell.tweeterNameLabel.text = currTweet.user.name;
    cell.tweeterScreenNameLabel.text = currTweet.user.screenName;
    cell.dateCreatedLabel.text = currTweet.createdAtString;
    cell.tweetTextLabel.text = currTweet.text;
    cell.retweetCountLabel.text = [NSString stringWithFormat:@"%d", currTweet.retweetCount];
     */
    cell.favoriteCountLabel.text = [NSString stringWithFormat:@"%d", currTweet.favoriteCount]; 
}

@end
