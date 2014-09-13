//
//  TipViewController.m
//  TipCalculator
//
//  Created by Vikas Kumar Bajaj on 9/12/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipSegment;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *grpSize1Label;
@property (weak, nonatomic) IBOutlet UILabel *grpSize2Label;
@property (weak, nonatomic) IBOutlet UILabel *grpSize3Label;
@property (weak, nonatomic) IBOutlet UILabel *grpSize4Label;
@property (weak, nonatomic) IBOutlet UIImageView *grpSize1Heads;
@property (weak, nonatomic) IBOutlet UIImageView *grpSize2Head1;
@property (weak, nonatomic) IBOutlet UIImageView *grpSize2Head2;

@property (weak, nonatomic) IBOutlet UIImageView *grpSize3Head1;

@property (weak, nonatomic) IBOutlet UIImageView *grpSize3Head2;
@property (weak, nonatomic) IBOutlet UIImageView *grpSize3Head3;
@property (weak, nonatomic) IBOutlet UIImageView *grpSize4Head1;
@property (weak, nonatomic) IBOutlet UIImageView *grpSize4Head2;
@property (weak, nonatomic) IBOutlet UIImageView *grpSize4Head3;
@property (weak, nonatomic) IBOutlet UIImageView *grpSize4Head4;




@property (nonatomic) float initialHeight;
@property (nonatomic) BOOL movedUp;

- (IBAction)billAmountEditingChanged:(id)sender;

- (IBAction)onTap:(id)sender;

-(void) updateValues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
    self.initialHeight = self.view.frame.size.height;
    self.movedUp = NO;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: YES];
    [self.billAmountLabel becomeFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)billAmountEditingChanged:(id)sender {

    NSString *billAmount = self.billAmountLabel.text;
    if (billAmount.length > 0) {
        
        //Unhide everything if there is some $ value.
        self.tipLabel.hidden = NO;
        self.tipSegment.hidden = NO;
        self.grpSize1Label.hidden = NO;
        self.grpSize2Label.hidden = NO;
        self.grpSize3Label.hidden = NO;
        self.grpSize4Label.hidden = NO;
        self.grpSize1Heads.hidden = NO;
        self.grpSize2Head1.hidden = NO;
        self.grpSize2Head2.hidden = NO;
        self.grpSize3Head1.hidden = NO;
        self.grpSize3Head2.hidden = NO;
        self.grpSize3Head3.hidden = NO;
        self.grpSize4Head1.hidden = NO;
        self.grpSize4Head2.hidden = NO;
        self.grpSize4Head3.hidden = NO;
        self.grpSize4Head4.hidden = NO;
        
        if (self.movedUp == NO) {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDuration:1];
            self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y - 40), self.view.frame.size.width, self.view.frame.size.height);
            
            [UIView commitAnimations];
            self.movedUp = YES;
        }
        [self updateValues];
    } else {
        self.tipLabel.hidden = YES;
        self.tipSegment.hidden = YES;
        self.grpSize1Label.hidden = YES;
        self.grpSize2Label.hidden = YES;
        self.grpSize3Label.hidden = YES;
        self.grpSize4Label.hidden = YES;
        self.grpSize1Heads.hidden = YES;
        self.grpSize2Head1.hidden = YES;
        self.grpSize2Head2.hidden = YES;
        self.grpSize3Head1.hidden = YES;
        self.grpSize3Head2.hidden = YES;
        self.grpSize3Head3.hidden = YES;
        self.grpSize4Head1.hidden = YES;
        self.grpSize4Head2.hidden = YES;
        self.grpSize4Head3.hidden = YES;
        self.grpSize4Head4.hidden = YES;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.2];
        self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y + 40), self.view.frame.size.width, self.view.frame.size.height);
        [UIView commitAnimations];
        self.movedUp = NO;
    }
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

-(void)updateValues {
    NSArray *tipSlabArray = @[@(0.1), @(0.2), @(0.3)];
    
    float billAmount = [self.billAmountLabel.text floatValue];
    
    float tipAmount = billAmount * [tipSlabArray[self.tipSegment.selectedSegmentIndex] floatValue];
    
    float grpSize1Amount = billAmount + tipAmount;

    float grpSize2Amount = (billAmount + tipAmount) /2 ;

    float grpSize3Amount = (billAmount + tipAmount) /3 ;
    
    float grpSize4Amount = (billAmount + tipAmount) /4 ;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    
    self.grpSize1Label.text = [NSString stringWithFormat:@"$%0.2f", grpSize1Amount];
    
    self.grpSize2Label.text = [NSString stringWithFormat:@"$%0.2f", grpSize2Amount];
    
    self.grpSize3Label.text = [NSString stringWithFormat:@"$%0.2f", grpSize3Amount];

    self.grpSize4Label.text = [NSString stringWithFormat:@"$%0.2f", grpSize4Amount];
}

@end
