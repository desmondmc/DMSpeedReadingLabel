//
//  SpeedLabel.m
//  SpeedyMessages
//
//  Created by Desmond McNamee on 2015-03-13.
//  Copyright (c) 2015 Desmond McNamee. All rights reserved.
//

#import "DMSpeedReadingLabel.h"

@interface DMSpeedReadingLabel ()

@property NSTimeInterval delay;
@property NSInteger currentWordIndex;
@property NSArray *partsOfText;
@property NSInteger repetitions;
@property NSInteger repetitionCounter;
@property BOOL isAnimating;

@end

@implementation DMSpeedReadingLabel

- (void) animateWithDelayInSeconds:(NSTimeInterval)delay andRepetitions:(NSInteger)repetitions {
    if (_isAnimating == NO) {
        _delay = delay;
        _repetitions = repetitions;
        _repetitionCounter = 0;
        _isAnimating = YES;
        
        [self initLabelText];
        
        [self startTimerEvents];
    }
}

#pragma mark Events
- (void)delayTimerExpired {
    self.text = [_partsOfText objectAtIndex:_currentWordIndex];
    [self incrementCurrentWordIndex];
}

- (void)speedTextChanged {
    //Create a new array and reset the index.
    [self initLabelText];
}

#pragma mark Setters

- (void)setSpeedReadingText:(NSString *)speedReadingText {
    _speedReadingText = speedReadingText;
    [self speedTextChanged];
}

#pragma mark Helpers
- (void)incrementCurrentWordIndex {
    if (_currentWordIndex < [_partsOfText count] - 1) {
        _currentWordIndex++;
    } else {
        //We've cycled through all the word count a repetition and reset wordIndex.
        _repetitionCounter++;

        _currentWordIndex = 0;
    }
}

- (void)initLabelText {
    _currentWordIndex = 0;
    NSArray *blankTextArray = [NSArray arrayWithObject:@""];
    
    _partsOfText = [blankTextArray arrayByAddingObjectsFromArray:[_speedReadingText componentsSeparatedByString: @" "]];
    self.text = [_partsOfText objectAtIndex:_currentWordIndex];
}

- (void)startTimerEvents {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        while (YES) {
            if (_repetitions != 0 && _repetitionCounter >= _repetitions) {
                break;
            }
            
            [NSThread sleepForTimeInterval:_delay];
            dispatch_async(dispatch_get_main_queue(), ^(void){
                [self delayTimerExpired];
            });
        }
        _isAnimating = NO;
    });
}

@end
