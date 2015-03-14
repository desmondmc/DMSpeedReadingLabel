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

// Setting repetitions to 0 will animate forever.
- (void) animateWithDelayInSeconds:(NSTimeInterval)delay andRepetitions:(NSInteger)repetitions;

@end
