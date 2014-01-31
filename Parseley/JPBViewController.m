//
//  JPBViewController.m
//  Parseley
//
//  Created by John Beatty on 1/30/14.
//  Copyright (c) 2014 John Beatty. All rights reserved.
//

#import "JPBViewController.h"
#import "JPBParseNumber.h"

@interface JPBViewController () <UITextFieldDelegate>

@end

@implementation JPBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [self.inputTextView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate Methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"%s %@", __PRETTY_FUNCTION__, newString);
    
    self.answerTextView.text = [JPBParseNumber parseInteger:[newString integerValue]];
    
    return YES;
}

@end
