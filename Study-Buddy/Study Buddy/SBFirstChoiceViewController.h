//
//  SBFirstChoiceViewController.h
//  Study Buddy
//
//  Created by Jayanth Prathipati on 4/19/14.
//  Copyright (c) 2014 VTHacksProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBFirstChoiceViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) NSArray *universityNames;
@end
