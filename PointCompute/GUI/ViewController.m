//
//  ViewController.m
//  PointCompute
//
//  Created by 王资 on 2018/10/20.
//  Copyright © 2018年 王资's. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
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
  
//  self.helloLabel.text = @"default text";
//
//  [self.clickyButton setTitle:@"Clicky" forState:UIControlStateNormal];
  
  self.winnerGet.text = @"";
  self.losserLoss.text = @"";
  
  [self.computeButton setTitle:@"计算" forState:UIControlStateNormal];
  
  self.winnerScore.keyboardType = UIKeyboardTypeNumberPad;
  self.loserScore.keyboardType = UIKeyboardTypeNumberPad;
  
}

//- (IBAction)handleButtonClick:(id)sender {
//  self.helloLabel.text = self.customTextField.text;
//  NSInteger a = self.helloLabel.text.integerValue;
//  NSLog(@"%ld", a);
//}

- (IBAction)handleButtonClick:(id)sender {
  NSInteger thesholds[] = {13, 38, 63, 88, 113, 138, 163, 188, 213, 238};
  NSInteger winnerGets[] = {8, 7, 6, 5, 4, 3, 2, 2, 1, 1, 0};
  NSInteger losserLosses[] = {8, 10, 13, 16, 20, 25, 30, 35, 40, 45, 50};
  NSInteger win = self.winnerScore.text.integerValue;
  NSInteger loss = self.loserScore.text.integerValue;
  NSInteger gap = abs(win - loss);
  for(int i = 0; i < 10; i++) {
    if(gap > thesholds[9]) {
      if(win > loss) {
        NSString *winPoint = [NSString stringWithFormat:@"%ld分",winnerGets[10]];
        self.winnerGet.text = [@"胜者得" stringByAppendingString:winPoint];
        self.losserLoss.text = [@"负者失" stringByAppendingString:winPoint];
      } else {
        NSString *lossPoint = [NSString stringWithFormat:@"%ld分",losserLosses[10]];
        self.winnerGet.text = [@"胜者得" stringByAppendingString:lossPoint];
        self.losserLoss.text = [@"负者失" stringByAppendingString:lossPoint];
      }
      break;
    }
    if(gap < thesholds[i]) {
      if(win > loss) {
        NSString *winPoint = [NSString stringWithFormat:@"%ld分",winnerGets[i]];
        self.winnerGet.text = [@"胜者得" stringByAppendingString:winPoint];
        self.losserLoss.text = [@"负者失" stringByAppendingString:winPoint];
      } else {
        NSString *lossPoint = [NSString stringWithFormat:@"%ld分",losserLosses[i]];
        self.winnerGet.text = [@"胜者得" stringByAppendingString:lossPoint];
        self.losserLoss.text = [@"负者失" stringByAppendingString:lossPoint];
      }
      break;
    }
  }
}

- (IBAction)handleClearButton:(id)sender {
  self.winnerGet.text = @"";
  self.losserLoss.text = @"";
  self.winnerScore.text = @"";
  self.loserScore.text = @"";
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  [self.winnerScore resignFirstResponder];
  [self.loserScore resignFirstResponder];
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
  return [self validateNumber:string];
}

- (BOOL)validateNumber:(NSString*)number {
  BOOL res = YES;
  NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
  int i = 0;
  while (i < number.length) {
    NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
    NSRange range = [string rangeOfCharacterFromSet:tmpSet];
    if (range.length == 0) {
      res = NO;
      break;
    }
    i++;
  }
  return res;
}


@end
