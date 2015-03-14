//
//  ViewController.m
//  DMSpeedReadingLabelDemo
//
//  Created by Desmond McNamee on 2015-03-13.
//  Copyright (c) 2015 Desmond McNamee. All rights reserved.
//

#import "ViewController.h"
#import "DMSpeedReadingLabel.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet DMSpeedReadingLabel *speedReadingLabel;
@property (strong, nonatomic) IBOutlet UITextField *wpmField;
@property (strong, nonatomic) IBOutlet UITextField *repetitionsField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.speedReadingLabel setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onCreatePress:(id)sender {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *wpm = [formatter numberFromString:_wpmField.text];
    NSNumber *repetitions = [formatter numberFromString:_repetitionsField.text];
    

    self.speedReadingLabel.speedReadingText = self.textField.text;
    self.speedReadingLabel.repetitions = repetitions.integerValue;
    self.speedReadingLabel.wordsPerMinute = wpm.integerValue;
    [self.speedReadingLabel setHidden:NO];
    [self.speedReadingLabel animate];
}

@end
