//
//  JTPwdStrengthIndicatorViewController.m
//  JTAnimations
//
//  Created by BJT on 17/8/4.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "JTPwdStrengthIndicatorViewController.h"
#import "JTPwdStrengthIndicatorView.h"

@interface JTPwdStrengthIndicatorViewController ()

@property(nonatomic,strong) JTPwdStrengthIndicatorView *pwdStrengthIndicatorView;
@property(nonatomic,strong) UITextField *passwordTextField;

- (void)addPasswordTextField;
- (void)addPasswordStrengthView;

- (void)textFieldDidChange:(UITextField *)sender;
@end

@implementation JTPwdStrengthIndicatorViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self.navView setTitle:self.title WithColor:nil];
    
    self.backGroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.9];
    
    [self addPasswordTextField];
    [self addPasswordStrengthView];
}

- (void)addPasswordTextField
{
    UIView *leftPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    
    self.passwordTextField = [UITextField new];
    self.passwordTextField.leftView = leftPaddingView;
    self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    self.passwordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.passwordTextField.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.layer.cornerRadius = 2.f;
    self.passwordTextField.placeholder = @"请输入密码";
    [self.passwordTextField becomeFirstResponder];
    [self.passwordTextField addTarget:self
                               action:@selector(textFieldDidChange:)
                     forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:self.passwordTextField];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-[passwordTextField]-|"
                               options:0
                               metrics:nil
                               views:@{@"passwordTextField" : self.passwordTextField}]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-(220)-[passwordTextField(==36)]"
                               options:0
                               metrics:nil
                               views:@{@"passwordTextField" : self.passwordTextField}]];
}

- (void)addPasswordStrengthView
{
    self.pwdStrengthIndicatorView = [JTPwdStrengthIndicatorView new];
    [self.view addSubview:self.pwdStrengthIndicatorView];
    self.pwdStrengthIndicatorView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-[pwdStrengthIndicatorView]-|"
                               options:0
                               metrics:nil
                               views:@{@"pwdStrengthIndicatorView" : self.pwdStrengthIndicatorView}]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[passwordTextField]-[pwdStrengthIndicatorView(==10)]"
                               options:0
                               metrics:nil
                               views:@{@"passwordTextField" : self.passwordTextField,
                                       @"pwdStrengthIndicatorView" : self.pwdStrengthIndicatorView}]];
}

/**
 *  根据输入密码长度,改变密码强度指示view 的强度状态
 */
- (void)textFieldDidChange:(UITextField *)sender
{
    if (sender.text.length < 1) {
        self.pwdStrengthIndicatorView.status = PwdStrengthIndicatorViewStatusNone;
        return;
    }
    
    if (sender.text.length < 4) {
        self.pwdStrengthIndicatorView.status = PwdStrengthIndicatorViewStatusWeak;
        return;
    }
    
    if (sender.text.length < 8) {
        self.pwdStrengthIndicatorView.status = PwdStrengthIndicatorViewStatusFair;
        return;
    }
    
    self.pwdStrengthIndicatorView.status = PwdStrengthIndicatorViewStatusStrong;
}

@end
