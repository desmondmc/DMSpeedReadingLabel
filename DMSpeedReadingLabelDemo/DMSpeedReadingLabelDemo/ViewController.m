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
    self.speedReadingLabel.text = self.textField.text;
    [self.speedReadingLabel setHidden:NO];
    [self.speedReadingLabel animateWithDelayInSeconds:0.20 andLoopForever:YES];
}

@end
