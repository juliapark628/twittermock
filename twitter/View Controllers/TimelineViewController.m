//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "TweetTableViewCell.h"
#import "UIImageView+AFNetworking.h"

#define tweetsDisplayedInFeed 20

@interface TimelineViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *feedTableView;

@property (strong, nonatomic) NSArray *tweets;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.feedTableView.dataSource = self;
    self.feedTableView.delegate = self;
    
    // Get timeline
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            self.tweets = tweets;
            [self.feedTableView reloadData];
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            
            for (Tweet *indivTweet in tweets) {
                NSString *text = indivTweet.text;
                NSLog(@"%@", text);
            }
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tweetsDisplayedInFeed;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TweetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetTableViewCell"];
    
    Tweet *currTweet = self.tweets[indexPath.row];

    [cell.tweeterProfileImageView setImageWithURL:currTweet.user.profilePictureURL];
    
    cell.tweeterNameLabel.text = currTweet.user.name;
    cell.tweeterScreenNameLabel.text = currTweet.user.screenName;
    cell.dateCreatedLabel.text = currTweet.createdAtString;
    cell.tweetTextLabel.text = currTweet.text;
    cell.retweetCountLabel.text = [NSString stringWithFormat:@"%d", currTweet.retweetCount];
    cell.favoriteCountLabel.text = [NSString stringWithFormat:@"%d", currTweet.favoriteCount];
    
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
