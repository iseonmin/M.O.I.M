//
//  LoginViewController.h
//  moim
//
//  Created by 이선민 on 2015. 12. 26..
//  Copyright © 2015년 이선민. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *loginEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordTextField;

@property (weak, nonatomic) IBOutlet UIButton *successButton;
- (IBAction)goSuccess:(id)sender;
@end
