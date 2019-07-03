//
//  User.m
//  twitter
//
//  Created by juliapark628 on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        NSString *profilePictureString = dictionary[@"profile_image_url_https"];
        self.profilePictureURL = [NSURL URLWithString:profilePictureString];
    }
    return self; 
}

@end
