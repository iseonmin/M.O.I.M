//
//  MainViewController.h
//  moim
//
//  Created by 이선민 on 2015. 12. 26..
//  Copyright © 2015년 이선민. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "JoinViewController.h"

@interface MainViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)goLogin:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *joinButton;
- (IBAction)goJoin:(id)sender;


@end
