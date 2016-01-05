//
//  TaskListViewController.h
//  moim
//
//  Created by 이선민 on 2015. 12. 28..
//  Copyright © 2015년 이선민. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    NSArray *myDataArray;
}

@property (weak, nonatomic) IBOutlet UITableView *taskListTableView;
- (IBAction)write:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *allTaskListButton;
@property (weak, nonatomic) IBOutlet UIButton *teamListButton;
- (IBAction)goAllTaskList:(id)sender;
- (IBAction)goTeamList:(id)sender;

@end

