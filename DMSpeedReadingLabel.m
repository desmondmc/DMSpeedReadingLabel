//
//  SpeedLabel.m
//  SpeedyMessages
//
//  Created by Desmond McNamee on 2015-03-13.
//  Copyright (c) 2015 Desmond McNamee. All rights reserved.
//

#import "DMSpeedReadingLabel.h"

@implementation DMSpeedReadingLabel

- (void) animateWithDelayInSeconds:(NSTimeInterval)delay andLoopForever:(BOOL)loopForever {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        NSArray *parts = [self.text componentsSeparatedByString: @" "];
        //Background Thread
        while (loopForever) {
            if ([parts count] > 0) {
                dispatch_async(dispatch_get_main_queue(), ^(void){
                    self.text = [parts objectAtIndex:0];;
                });
            }
            
            if ([parts count] > 1) {
                //start at the second part.
                for (int partsIndex = 1; partsIndex < [parts count]; partsIndex++) {
                    [NSThread sleepForTimeInterval:delay];
                    dispatch_async(dispatch_get_main_queue(), ^(void){
                        self.text = [parts objectAtIndex:partsIndex];
                    });
                }
            }
            [NSThread sleepForTimeInterval:delay];
        }
    });
}
@end
