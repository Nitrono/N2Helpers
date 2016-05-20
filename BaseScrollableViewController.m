//
//  BaseScrollableViewController.m
//  ContractList
//
//  Created by Dmitry on 4/7/16.
//  Copyright © 2016 sam-solutions. All rights reserved.
//

#import "BaseScrollableViewController.h"

@interface BaseScrollableViewController ()

@end

@implementation BaseScrollableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    [self keyboardResigner:self.scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)keyboardWasShown:(NSNotification*)notification
{
    NSDictionary *info = [notification userInfo];
    CGRect keyboardRect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    
    UIEdgeInsets contentInset = self.scrollView.contentInset;
    contentInset.bottom = keyboardRect.size.height + 5;
    self.scrollView.contentInset = contentInset;
}

- (void)keyboardWillBeHidden:(NSNotification*)notification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
}

#pragma mark TextField Delegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSUInteger i = [self.allFields indexOfObject:textField];
    if ([self.allFields containsObject:textField] == NO || i+1 >= self.allFields.count) {
        [textField resignFirstResponder];
    }
    else
    {
        [self.allFields[i+1] becomeFirstResponder];
    }
    return YES;
}

-(void)keyboardResigner:(UIScrollView *)containingScrollView
{
    UITapGestureRecognizer *tapScrollView = [[UITapGestureRecognizer alloc]initWithTarget:self  action:@selector(closeKeyboard:)];
    
    tapScrollView.cancelsTouchesInView = NO;
    [containingScrollView addGestureRecognizer:tapScrollView];
}

-(void)closeKeyboard:(UIGestureRecognizer *)gestureRecognizer
{
    //USED BY KeyboardResigner.
    UIScrollView *containingScrollView = (UIScrollView*) gestureRecognizer.view;
    
//    [containingScrollView setContentOffset:CGPointMake(0, 0) animated:TRUE];
    [containingScrollView endEditing:YES];
    
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
