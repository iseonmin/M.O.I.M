//
//  LoginViewController.m
//  moim
//
//  Created by 이선민 on 2015. 12. 26..
//  Copyright © 2015년 이선민. All rights reserved.
//

#import "LoginViewController.h"
#import "singleton.h"
#import "TaskListViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()
@property (retain, nonatomic) singleton* single;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* 키보드 사라지게 함. */
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapReceived:)];
    [tapGestureRecognizer setDelegate:self];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    /* 네이게이션바 색상 변경 */
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:18/255.0 green:187/255.0 blue:198/255.0 alpha:1.0]];
    
    /* 네비게이션바 타이틀 색 변경 */
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    /* 네비게이션바 타이틀 텍스트 변경 */
    self.title = @"로그인";
    
    self.single = [[singleton alloc]init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)tapReceived:(UITapGestureRecognizer *)tapGestureRecognizer
{
    [self.view endEditing:YES];
}

- (IBAction)goSuccess:(id)sender {

    [PFUser logInWithUsernameInBackground:self.loginEmailTextField.text password:self.loginPasswordTextField.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            NSLog(@"success!");
                                        } else {
                                            // The login failed. Check error to see why.
                                            NSLog(@"%@",error);
                                        }
                                    }];
    

    /* singleton */
    self.single = [singleton getSingleton];
    
    NSMutableDictionary * userInfo = [[NSMutableDictionary alloc]init];
    [userInfo setValue:self.loginEmailTextField.text forKey:@"userID"];
    [userInfo setValue:self.loginPasswordTextField.text forKey:@"passwd"];
    
    /* 로그인 정보 singleton에 저장 */
    if([self.single login:userInfo]) {
        //[self.view removeFromSuperview];
        NSLog(@"login okokokokok");
        TaskListViewController *taskListView = [[TaskListViewController alloc] initWithNibName:@"TaskListViewController" bundle:nil] ;
        [self.navigationController pushViewController:taskListView animated:YES];
    }

    
    
}

@end
