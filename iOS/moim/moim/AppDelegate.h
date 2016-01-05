//
//  AppDelegate.h
//  moim
//
//  Created by 이선민 on 2015. 12. 26..
//  Copyright © 2015년 이선민. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "MainViewController.h"


/*
#define INIT_WITH_NIB_FOR_CUSTON(Class, ClassName, v) \
if([[UIScreen mainScreen]bounds].size.height==568) \
v = ([[Class alloc]initWithNibName:[NSString stringWithFormat:@"%@@1",ClassName] bundle:nil]); \
else if([[UIScreen mainScreen]bounds].size.height==667) \
v = ([[Class alloc]initWithNibName:[NSString stringWithFormat:@"%@",ClassName] bundle:nil]); \
else if([[UIScreen mainScreen]bounds].size.height==736) \
v = ([[Class alloc]initWithNibName:[NSString stringWithFormat:@"%@@2",ClassName] bundle:nil]); \
else  \
v = ([[Class alloc]initWithNibName:[NSString stringWithFormat:@"%@@1", ClassName] bundle:nil]);
*/

@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

//@property (strong, nonatomic) MainViewController *mainView;
@property (strong, nonatomic) UIViewController* mainView;

@end
