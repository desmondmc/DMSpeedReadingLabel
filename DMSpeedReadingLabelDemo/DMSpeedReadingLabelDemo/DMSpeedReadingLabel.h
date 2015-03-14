//
//  SpeedLabel.h
//  SpeedyMessages
//
//  Created by Desmond McNamee on 2015-03-13.
//  Copyright (c) 2015 Desmond McNamee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMSpeedReadingLabel : UILabel

// Setting this property will output as speed reading text in the label
@property (strong, nonatomic) NSString *speedReadingText;

// Defaults to 0 which is infinite.
@property NSInteger repetitions;

// Defaults to 60
@property NSInteger wordsPerMinute;

// Start animating label. Currently the label can't be reanimated until it is complete.
- (void) animate;

@end
