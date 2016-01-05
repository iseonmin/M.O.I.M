//
//  AllTaskListTableViewCell.h
//  moim
//
//  Created by 이선민 on 2015. 12. 28..
//  Copyright © 2015년 이선민. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllTaskListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *teamName;
@property (weak, nonatomic) IBOutlet UILabel *taskName;
@property (weak, nonatomic) IBOutlet UILabel *taskDate;
@property (weak, nonatomic) IBOutlet UIButton *tagName;

@end
