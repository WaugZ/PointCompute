//
//  ViewController.m
//  PointCompute
//
//  Created by 王资 on 2018/10/20.
//  Copyright © 2018年 王资's. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
//  // Create the label object and set its frame
//  UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
//
//  // Set the text property of the label
//  label.text = @"Hello again!";
//
//  // Add the label object to the view
//  [self.view addSubview:label];
  
  self.helloLabel.text = @"default text";
  
  [self.clickyButton setTitle:@"Clicky" forState:UIControlStateNormal];
  
}

- (IBAction)handleButtonClick:(id)sender {
  self.helloLabel.text = self.customTextField.text;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  [self.customTextField resignFirstResponder];
}

@end
