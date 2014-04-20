//
//  Profile.m
//  Merge with Study Buddy
//
//  Created by Dominic Napoleon on 4/19/14.
//  Copyright (c) 2014 Dominic Napoleon Productions. All rights reserved.
//

#import "Profile.h"

@implementation Profile

/// TODO: redo construtor, but now with paramters as NSString, not enums
 
- (id)initWithGender: (Gender) gender
          genderPref: (Gender) genderPreference
               sense: (Sense)  sense
               style: (LearningStyle) learningStyle
            approach: (LearningApproach) learningApproach
{

    self = [super init]; // initialize super class (always have to do this)

    // if the superclass was initialized properly:
    if (self) {

        _gender           = gender;
        _genderPreference = genderPreference;
        _sense            = sense;
        _learningStyle    = learningStyle;
        _learningApproach = learningApproach;
        
    }
    return self; //return nil on object init failure
}

- (id)init {
    return [self initWithGender: MALE
                 genderPref:     FEMALE
                 sense:          AUDITORY
                 style:          LEARNING
                 approach:       READING];
}

- (id)initWithStrings: (NSString*) gender
           genderPref: (NSString*) genderPreference
                sense: (NSString*) sense
                style: (NSString*) learningStyle
             approach: (NSString*) learningApproach
{
    
    self = [super init]; // initialize super class (always have to do this)

    
    if([gender isEqualToString:@"male"]) {
        _gender = MALE;
    } else if ([gender isEqualToString:@"female"]) {
        _gender = FEMALE;
    } else {
        _gender = NO_GENDER_PREFERENCE;
    }
    
    if([genderPreference isEqualToString:@"male"]) {
        _genderPreference = MALE;
    } else if ([genderPreference isEqualToString:@"female"]) {
        _genderPreference = FEMALE;
    } else {
        _genderPreference = NO_GENDER_PREFERENCE;
    }
    
    if([sense isEqualToString:@"auditory"]) {
        _sense = AUDITORY;
    } else if ([sense isEqualToString:@"visual"]) {
        NSLog(@"VISUAL HAS BEEN CHOSEN");
        _sense = VISUAL;
    } else {
        _sense = NO_SENSE_PREFERENCE;
    }
    
    if([learningStyle isEqualToString:@"teaching"]) {
        _learningStyle = TEACHING;
    } else if ([learningStyle isEqualToString:@"learning"]) {
        _learningStyle = LEARNING;;
    } else {
        _learningStyle = NO_LEARNING_STYLE_PREFERENCE;
    }
    
    if([learningApproach isEqualToString:@"reading"]) {
        _learningApproach = READING;
    } else if ([learningApproach isEqualToString:@"hands on"]) {
        _learningApproach = HANDS_ON;;
    } else {
        _learningApproach = NO_LEARNING_APPROACH_PREFERENCE;
    }
    
    return self;
}


- (id)findMatch: (NSMutableArray*) profiles_input {
    
    NSMutableArray* profiles = [profiles_input mutableCopy];
    
    [self removeNoncompatibleClasses: profiles];
    [self removeNoncompatibleGender:  profiles];
    
    if([profiles count] == 0) {
        NSLog(@"No compatible class or genders found.  Failed to find a match.");
        return nil;
    }
    
    int score_max = 0;
    int index_max = 0;
    int score_tmp = 0;
    
    // find and return profile with best preference matches
    for(int i = 0; i < [profiles count]; i++) {
        
        Profile* currentProfile = profiles[i];
        score_tmp = [self matchScore:currentProfile];
        
        if(score_tmp > score_max) {
            score_max = score_tmp;
            index_max = i;
        }
    }
    
    return profiles[index_max];
}


- (NSArray*) findMatchMultiple: (NSMutableArray*) profiles_input amount: (NSInteger) amount  {
    NSMutableArray* profiles = [profiles_input mutableCopy];
    
    [self removeNoncompatibleClasses: profiles];
    [self removeNoncompatibleGender:  profiles];
    
    if([profiles count] == 0) {
        NSLog(@"No compatible class or genders found.  Failed to find a match.");
        return nil;
    }
    
    // find and return profile with best preference matches
    for(int i = 0; i < [profiles count]; i++) {
        
        Profile* currentProfile = profiles[i];
        
        // pass match score with each profile into that profile, so they can be
        // sorted by match score later
        currentProfile.currentMatchScore = [self matchScore:currentProfile];
    }
    
    // sort profiles in descending match score
    NSSortDescriptor *sort=[NSSortDescriptor sortDescriptorWithKey:@"currentMatchScore" ascending:NO];
    [profiles sortUsingDescriptors:[NSArray arrayWithObject:sort]];

    // make an array of the top "amount" elements
    NSRange range = NSMakeRange(0, amount);
    NSArray* output = [profiles subarrayWithRange:range];
    
    return output;
}


- (void)removeNoncompatibleClasses: (NSMutableArray*) profiles {

    ///// throw away all profiles with non-matching majors /////

    NSMutableArray *discardedItems = [NSMutableArray array];

    for(int i = 0; i < [profiles count]; i++) {
        
        Profile *person = profiles[i];
        
        if (![self.studyCourse isEqualToString:person.studyCourse]) {
            [discardedItems addObject:person];
        }

    }
    
    [profiles removeObjectsInArray:discardedItems];
}

- (void)removeNoncompatibleGender: (NSMutableArray*) profiles {
    
    ///// throw away all profiles with non-matching genders /////
    
    NSMutableArray *discardedItems = [NSMutableArray array];
    
    for(int i = 0; i < [profiles count]; i++) {
        
        Profile *person = profiles[i];
        
        Gender selfPreference = self.genderPreference;
        Gender selfGender = self.gender;
        Gender otherPreference = person.genderPreference;
        Gender otherPerson = person.gender;
        
        // if either you or the other profile does not prefer the other's gender,
        // discard the other profile from consideration
        if ((selfPreference != otherPerson) || (otherPreference != selfGender)) {
            NSLog(@"In removeNoncompatibleGender: adding to discard pile");
            [discardedItems addObject:person];
        }
    }
    
    [profiles removeObjectsInArray:discardedItems];
}


- (int) matchScore: (Profile*) secondPerson {
    
    Profile* firstPerson = self;
    
    
    // +1 score for each compatible preference
    
    int score = 0;
    
    
    //****************************************** Sensory Preference ******************************************//
    // if both of them have a preference (they know they are auditory or visual), THEN they
    // can either be compatible or incompatible, meaning either an increment or decrement of
    // the matching score, if they match or not.
    if(self.sense != NO_SENSE_PREFERENCE && secondPerson.sense != NO_SENSE_PREFERENCE) {
        if(firstPerson.sense == secondPerson.sense) score++; else score--;
    }
    
    // if they both have no preference, they both don't give a shit, so they are compatible.
    else if(firstPerson.sense == NO_SENSE_PREFERENCE && secondPerson.sense == NO_SENSE_PREFERENCE) score++;
    // If one of them has no preference, then the score is not changed

    
    //****************************************** Learning Style ******************************************//
    if(firstPerson.learningStyle != NO_LEARNING_STYLE_PREFERENCE && secondPerson.learningStyle != NO_LEARNING_STYLE_PREFERENCE) {
        if(firstPerson.learningStyle != secondPerson.learningStyle) score++; else score--;
    }
    else if(firstPerson.learningStyle == NO_LEARNING_STYLE_PREFERENCE && secondPerson.learningStyle == NO_LEARNING_STYLE_PREFERENCE) score++;
    
    
    //****************************************** Learning Approach ******************************************//
    if(firstPerson.learningApproach != NO_LEARNING_APPROACH_PREFERENCE && secondPerson.learningApproach != NO_LEARNING_APPROACH_PREFERENCE) {
        if(firstPerson.learningApproach == secondPerson.learningApproach) score++; else score--;
    }
    else if(firstPerson.learningApproach == NO_LEARNING_APPROACH_PREFERENCE && secondPerson.learningApproach == NO_LEARNING_APPROACH_PREFERENCE) score++;
    
    return score;
}


@end
