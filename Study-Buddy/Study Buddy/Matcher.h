//
//  Matcher.h
//  Study Buddy
//
//  Created by Dominic Napoleon on 4/20/14.
//  Copyright (c) 2014 VTHacksProject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


// download profiles from da cloud
// compare the local user with all the users on the cloud to determine the best match
// return the phone number of the match

@interface Matcher : NSObject

// Finds a study buddy for the local user, and returns this
// study buddy's phone number
+ (NSString*) match;

@end
