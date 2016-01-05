//
//  singleton.m
//  moim
//
//  Created by 이선민 on 2015. 12. 28..
//  Copyright © 2015년 이선민. All rights reserved.
//

#import "singleton.h"



@implementation singleton

- (BOOL)isLogin
{
    [self loadInfoToFile];
    return _isLogin;
}

- (BOOL)login:(NSDictionary *)userInfo
{
    self.userID = [NSString stringWithString:[userInfo objectForKey:@"userID"]];
    self.passwd = [NSString stringWithString:[userInfo objectForKey:@"passwd"]];
    self.isLogin = [self saveUserInfo];
    
    return self.isLogin;
}

+ (singleton*)getSingleton
{
    static singleton* sharedInstance = nil;
    
    if(sharedInstance == nil)
    {
        @synchronized(self){
            if(sharedInstance == nil)
            {
                sharedInstance = [[singleton alloc] init];
            }
        }
    }
    return sharedInstance;
}

// 회원정보 저장.
- (BOOL)saveUserInfo
{

    NSDictionary* infoDic = [[NSDictionary alloc] initWithObjectsAndKeys:self.userID,@"userID",self.passwd, @"passwd", nil];
    
    // document 폴더의 경로를 찾기위함
    NSArray* documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // document 폴더의 경로
    NSString* documentRootPath = [documentPath objectAtIndex:0];
    
    // 내가만들 plist파일 경로
    NSString* filePath = [documentRootPath stringByAppendingFormat:@"/user-info.plist"];
    
    //파일이 쓰여졌는지 확인할 필요가 있다.
    BOOL isWritten = NO;
    
    isWritten = [infoDic writeToFile:filePath atomically:YES];
    
    if(isWritten)
    {
        NSLog(@"싱글톤 정보 저장 성공");
        
    }
    else{
        NSLog(@"싱글톤 정보 저장 실패");
    }
    
//    [infoDic release];
    return isWritten;
}


-(BOOL)loadInfoToFile;
{
    // document 폴더의 경로를 찾기위함
    NSArray* documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // document 폴더의 경로
    NSString* documentRootPath = [documentPath objectAtIndex:0];
    
    NSString* filePath = [documentRootPath stringByAppendingFormat:@"/user-info.plist"];
    
    NSDictionary* infoDic = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    
    NSString* ID = nil;
    
    // 무슨 조건이지?
    if(infoDic && infoDic.allKeys.count > 1){
        self.isLogin = YES;
        ID = [infoDic objectForKey:@"userID"];
        self.passwd = [NSString stringWithString:[infoDic objectForKey:@"passwd"]];
        self.userID = [NSString stringWithString:ID];
        NSLog(@"singleton 정보 저장 성공.");
    }
    else{
        NSLog(@"싱글톤 정보 불러오기 실패");
        self.isLogin = NO;
    }
    
    if([self.userID isEqualToString:ID])
        return YES;
    else
        return NO;
}


- (BOOL)logout:(NSDictionary *)userInfo
{
    [self deleteLoginInfo];
    self.isLogin = NO;
    self.userID = @"";
    return self.isLogin;
}

- (void)deleteLoginInfo {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"/user-info.plist"];
    
    NSError *error;
    if(![[NSFileManager defaultManager] removeItemAtPath:path error:&error])
    {
        //TODO: Handle/Log error
    }
}


@end
