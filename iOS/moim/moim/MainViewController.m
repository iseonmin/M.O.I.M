//
//  MainViewController.m
//  moim
//
//  Created by 이선민 on 2015. 12. 26..
//  Copyright © 2015년 이선민. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "singleton.h"
#import "TaskListViewController.h"

@interface MainViewController ()
@property (retain, nonatomic) LoginViewController *loginView;
@property (retain, nonatomic) JoinViewController *joinView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    [self.window addSubview: self.loginView.view];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.loginView];
    [self.window addSubview:self.navigationController.view];
     */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    /* main에서는 네비게이션바 숨김 */
    self.navigationController.navigationBar.hidden = YES;
    
    singleton * single = [singleton getSingleton];
    
    BOOL isLogin = [single isLogin];
    if ( isLogin ) {
        
        TaskListViewController *tastListView = [[TaskListViewController alloc] initWithNibName:@"TaskListViewController" bundle:nil] ;
        [self.navigationController pushViewController:tastListView animated:YES];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    
    /* main 외에 화면에서는 네비게이션바 나타냄 */
    self.navigationController.navigationBar.hidden = NO;
}

- (IBAction)goLogin:(id)sender {

    self.loginView = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil] ;
    [self.navigationController pushViewController:self.loginView animated:YES];
}


- (IBAction)goJoin:(id)sender {
    
    self.joinView = [[JoinViewController alloc] initWithNibName:@"JoinViewController" bundle:nil] ;
    [self.navigationController pushViewController:self.joinView animated:YES];
}
@end
