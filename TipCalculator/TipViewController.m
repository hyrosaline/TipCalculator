//
//  TipViewController.m
//  TipCalculator
//
//  Created by Xiangnan Xu on 1/19/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

#import "TipViewController.h"
#import "SettingViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
- (IBAction)onTap:(id)sender;
- (void) updateValues;
- (void) onSettingsButton;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Smart";
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:10 forKey:@"first"];
        [defaults setInteger:15 forKey:@"second"];
        [defaults setInteger:18 forKey:@"third"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    //NSArray *tipValues = @[@(0.15),@(0.18),@(0.20)];
    int first = [[self.tipControl titleForSegmentAtIndex:0] integerValue];
    int second = [[self.tipControl titleForSegmentAtIndex:1] integerValue];
    int third = [[self.tipControl titleForSegmentAtIndex:2] integerValue];
    
    NSArray *tipValues = @[@(first),@(second),@(third)];
    float tipPercent = [tipValues[self.tipControl.selectedSegmentIndex]  floatValue] / 100;
    float tipAmount = billAmount * tipPercent;
    float totalAmount = tipAmount + billAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingViewController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%d", [defaults integerForKey:@"first"]] forSegmentAtIndex:0];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%d", [defaults integerForKey:@"second"]] forSegmentAtIndex:1];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%d", [defaults integerForKey:@"third"]] forSegmentAtIndex:2];
    [self updateValues];
}


@end
