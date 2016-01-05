//
//  JoinViewController.m
//  moim
//
//  Created by 이선민 on 2015. 12. 27..
//  Copyright © 2015년 이선민. All rights reserved.
//

#import "JoinViewController.h"
#import <Parse/Parse.h>


@interface JoinViewController ()

@end

@implementation JoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    /* 키보드 사라지게 함. */
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapReceived:)];
    [tapGestureRecognizer setDelegate:self];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tapReceived:(UITapGestureRecognizer *)tapGestureRecognizer
{
    [self.view endEditing:YES];
}


- (IBAction)goJoinSuccess:(id)sender {
    
    PFUser *user = [PFUser user];
    user.username = self.joinNameTextField.text;
    user.password = self.joinPasswordTextField.text;
    user.email = self.joinEmailTextField.text;
    
    // other fields can be set just like with PFObject 추가적인 기능.
    // user[@"phone"] = @"010-8028-4864";

    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"join success");
            // Hooray! Let them use the app now.
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"%@",errorString);
            // Show the errorString somewhere and let the user try again.
        }
    }];
}


@end
