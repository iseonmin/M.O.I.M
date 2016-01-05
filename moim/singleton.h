//
//  singleton.h
//  moim
//
//  Created by 이선민 on 2015. 12. 28..
//  Copyright © 2015년 이선민. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface singleton : NSObject

@property (nonatomic,strong) NSString* userID;
@property (nonatomic, retain) NSString * passwd;
@property (nonatomic) BOOL isLogin;

+ (singleton*)getSingleton;
- (BOOL)isLogin;
- (BOOL)login:(NSDictionary *)userInfo;
- (BOOL)logout:(NSDictionary *)userInfo;

@end
