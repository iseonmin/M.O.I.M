//
//  JoinViewController.h
//  moim
//
//  Created by 이선민 on 2015. 12. 27..
//  Copyright © 2015년 이선민. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JoinViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *joinEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *joinPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *joinNameTextField;

@property (weak, nonatomic) IBOutlet UIButton *joinSuccessButton;
- (IBAction)goJoinSuccess:(id)sender;

@end
