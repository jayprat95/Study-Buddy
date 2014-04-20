//
//  Profile.h
//  Merge with Study Buddy
//
//  Created by Dominic Napoleon on 4/19/14.
//

#import <Foundation/Foundation.h>

// Stores information about the user, such as study preferences
// and inventory of courses.
@interface Profile : NSObject

typedef enum {
    MALE,
    FEMALE,
    NO_GENDER_PREFERENCE,
} Gender;

typedef enum {
    VISUAL,
    AUDITORY,
    NO_SENSE_PREFERENCE,
} Sense;

typedef enum {
    TEACHING,
    LEARNING,
    NO_LEARNING_STYLE_PREFERENCE
} LearningStyle;

typedef enum {
    READING,
    HANDS_ON,
    NO_LEARNING_APPROACH_PREFERENCE
} LearningApproach;

- (id)initWithGender: (Gender) gender
          genderPref: (Gender) genderPreference
               sense: (Sense)  sense
               style: (LearningStyle) learningStyle
            approach: (LearningApproach) learningApproach;

// default initializer
- (id)init;

- (id)initWithStrings:(NSString*) gender
          genderPref: (NSString*) genderPreference
               sense: (NSString*) sense
               style: (NSString*) learningStyle
            approach: (NSString*) learningApproach;

// "Virginia Tech" or "University of Virginia" or "Radford" etc...
@property (copy) NSString *university;

// "CHEM 1024", "MATH 1114", "CS 3214", etc...
@property (copy) NSMutableArray *courses;

@property Gender gender;                        // male or female
@property Gender genderPreference;              // seek to study with male or female?
@property Sense sense;                          // visual or auditory
@property LearningStyle learningStyle;          // teach others, or be taught
@property LearningApproach learningApproach;    // Read textbook, or go straight to examples

// TODO: support seeking study budy in multiple courses, make this an array
@property (copy) NSString* studyCourse;  // seeking a study buddy in this course

// find the best match between this profile, and the specified profiles, based
// on various preferences
- (id)findMatch: (NSMutableArray*) profiles_input;

// Generate a score based on compatibility between two profiles 
- (int) matchScore: (Profile*) secondPerson;

// store the cell phone number
@property (copy) NSString* phoneNumber;

// used to sort profiles in terms of the best match score
@property NSInteger currentMatchScore;


@end
