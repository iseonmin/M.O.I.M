//
//  TaskListViewController.m
//  moim
//
//  Created by 이선민 on 2015. 12. 28..
//  Copyright © 2015년 이선민. All rights reserved.
//

#import "TaskListViewController.h"
#import "AllTaskListTableViewCell.h"
#import "DetailTaskViewController.h"
#import "MakeTeamViewController.h"

@interface TaskListViewController ()

@end

@implementation TaskListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setting];
    myDataArray = [[NSArray alloc]initWithObjects:@"test1",@"test2",@"test3", nil];
}

- (void) viewWillAppear:(BOOL)animated {
    /* main 외에 화면에서는 네비게이션바 나타냄 */
    self.navigationController.navigationBar.hidden = NO;
    
    /* 네이게이션바 색상 변경 */
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:18/255.0 green:187/255.0 blue:198/255.0 alpha:1.0]];
    
    /* 네비게이션바 타이틀 색 변경 */
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    /* 네비게이션바 타이틀 텍스트 변경 */
    self.title = @"moim";
    
    /* 네비게이션바 오른쪽 */
    UIBarButtonItem *previousDateButton = [[UIBarButtonItem alloc] initWithTitle:@"search" style:UIBarButtonItemStylePlain target:self action:@selector(write:)];

    UINavigationItem* navItem = self.navigationItem;
    navItem.rightBarButtonItem = previousDateButton;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setting {
    // 파스에서 데이터 받아오기.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [myDataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *cellText = [myDataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = cellText;
//    [[cell teamName] setText:@"hey"];

    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailTaskViewController* detailTaskView = [[DetailTaskViewController alloc] initWithNibName:@"DetailTaskViewController" bundle:nil] ;
    [self.navigationController pushViewController:detailTaskView animated:YES];
}

- (IBAction)write:(id)sender {

    MakeTeamViewController *makeTeamView = [[MakeTeamViewController alloc]initWithNibName:@"MakeTeamViewController" bundle:nil];
    [self.navigationController pushViewController:makeTeamView animated:YES];
}

- (IBAction)goAllTaskList:(id)sender {
    myDataArray = [[NSArray alloc]initWithObjects:@"test1",@"test2",@"test3", nil];
    [self.taskListTableView reloadData];
    
    /* 네비게이션바 오른쪽 */
    UIBarButtonItem *previousDateButton = [[UIBarButtonItem alloc] initWithTitle:@"search" style:UIBarButtonItemStylePlain target:self action:@selector(write:)];
    
    UINavigationItem* navItem = self.navigationItem;
    navItem.rightBarButtonItem = previousDateButton;

}

- (IBAction)goTeamList:(id)sender {
    myDataArray = [[NSArray alloc]initWithObjects:@"success1",@"success2",@"success3", nil];
        [self.taskListTableView reloadData];
    
    /* 네비게이션바 오른쪽 */
    UIBarButtonItem *previousDateButton = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(write:)];
    
    UINavigationItem* navItem = self.navigationItem;
    navItem.rightBarButtonItem = previousDateButton;

}
@end
