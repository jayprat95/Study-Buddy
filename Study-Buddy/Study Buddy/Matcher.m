//
//  Matcher.m
//  Study Buddy
//
//  Created by Dominic Napoleon on 4/20/14.
//  Copyright (c) 2014 VTHacksProject. All rights reserved.
//

#import "Matcher.h"
#import "Profile.h"
@implementation Matcher

+ (NSString*) match {

    // Get information of local user
    PFUser *local_user = [PFUser currentUser];
    NSString* local_univ   = [local_user objectForKey:@"university"];
    NSArray* local_courses = [NSArray arrayWithArray:[local_user objectForKey:@"courses"]];
    NSString* local_gender = [local_user objectForKey:@"gender"];
    NSString* local_gender_pref = [local_user objectForKey:@"genderPref"];
    NSString* local_sense_pref = [local_user objectForKey:@"sense"];
    NSString* local_study_pref = [local_user objectForKey:@"studyPreference"];
    NSString* local_phone_number = [local_user objectForKey:@"phoneNumber"];
    NSString* local_Learning_Style = [local_user objectForKey:@"learningStyle"];
    NSString* local_Study_Course = [local_user objectForKey:@"studyCourse"];
    
    Profile *localProf = [[Profile alloc] initWithStrings:local_gender genderPref:local_gender_pref sense:local_sense_pref style:local_Learning_Style approach:local_study_pref];
    localProf.phoneNumber = local_phone_number;
    localProf.studyCourse = local_Study_Course;
    
    
    NSMutableArray *users = [[NSMutableArray alloc] init];
    NSString *retString = nil;
    // instantiate local user profile object
    
    // Pull other relevant profiles from the cloud
    
    PFQuery *query = [PFUser query];
    NSArray* objects = [query findObjects];
    for(PFUser *user in objects)
    {
        NSString* univ   = [user objectForKey:@"university"];
        NSArray* courses = [NSArray arrayWithArray:[user objectForKey:@"courses"]];
        NSString* gender = [user objectForKey:@"gender"];
        NSString* gender_pref = [user objectForKey:@"genderPref"];
        NSString* sense_pref = [user objectForKey:@"sense"];
        NSString* study_pref = [user objectForKey:@"studyPreference"];
        NSString* phone_number = [user objectForKey:@"phoneNumber"];
        NSString* learning_Style = [user objectForKey:@"learningStyle"];
        NSString* study_Course = [user objectForKey:@"studyCourse"];
        
        if([local_phone_number isEqualToString:phone_number]) {
            continue;
        }
        
        Profile *compProf = [[Profile alloc] initWithStrings:gender genderPref:gender_pref sense:sense_pref style:learning_Style approach:study_pref];
        compProf.phoneNumber = phone_number;
        compProf.studyCourse = study_Course;
        
        [users addObject:compProf];
    }
    Profile* matched = [localProf findMatch:users];
    NSString *phoneNumber = [matched phoneNumber];

    
    /*[query whereKey:@"gender" equalTo:@"male"]; // find all the women
    NSArray *girls = [query findObjects];*/
    
    return phoneNumber;
    
}

@end
