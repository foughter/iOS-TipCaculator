//
//  TipViewController.m
//  HW.TipCaculator
//
//  Created by Li Li on 6/5/14.
//  Copyright (c) 2014 Li Li. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *TipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)OnTap:(id)sender;
- (IBAction)updateValues:(id)sender;
@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self updateValues:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues:sender];
}

- (IBAction)updateValues:(id)sender {

    float billAmount = [self.billTextField.text floatValue];
    NSArray* tipValues = @[@0.1, @0.15, @0.2];
    
    float tipAmount = billAmount * [tipValues[[self.tipControl selectedSegmentIndex]] floatValue];
    
    self.TipLabel.text = [NSString stringWithFormat:@"%.2f", tipAmount ];
    
    self.totalLabel.text = [NSString stringWithFormat:@"%.2f", billAmount + tipAmount ];
    
}
@end
