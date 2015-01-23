//
//  SettingViewController.m
//  TipCalculator
//
//  Created by Xiangnan Xu on 1/22/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstPercent;
@property (weak, nonatomic) IBOutlet UITextField *secondPercent;
@property (weak, nonatomic) IBOutlet UITextField *thirdPercent;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

- (IBAction)onTap:(id)sender;

- (IBAction)clickSaveButton:(UIButton *)sender;



@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)clickSaveButton:(UIButton *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int first = [self.firstPercent.text integerValue];
    int second = [self.secondPercent.text integerValue];
    int third = [self.thirdPercent.text integerValue];
    
    [defaults setInteger:first forKey:@"first"];
    [defaults setInteger:second forKey:@"second"];
    [defaults setInteger:third forKey:@"third"];
    [defaults synchronize];
}

@end
