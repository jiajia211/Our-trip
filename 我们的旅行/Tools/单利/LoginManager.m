//
//  LoginManager.m
//  ZMSingleton
//
//  Created by tangdi on 15/11/4.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "LoginManager.h"
#import "Common.h"
#import "SingletonManager.h"
@implementation LoginManager
//实例化
Singleton_Instance_method_Impl(LoginManager)

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (BOOL)isLogined
{
    if (!self.token && !self.userPassword) {

        UUserDefaults.isLogined = NO;
    }
    //    if (!self.token) {
    //        UserDefaults.isLogined = NO;
    //    }
    return UUserDefaults.isLogined;
}


- (NSNumber *)userId
{
    return UUserDefaults.userId;
}
- (void)setUserName:(NSString *)userName{
    
    //如果不写get方法，以下正确，否则错误
    //    _userName = userName;
    //    if (_userName) {
    //    }
}
- (NSString *)userName{
    //    if(self.userName==nil){
    //       // self.userName = [Common getStorageObjectWithKey:@"userName"];
    //    }
    //    return self.userName;
    
    // 以上错误，get 方法不能赋值，只读不写
    return [Common getStorageObjectWithKey:@"userName"];
    
}
- (NSString *)userPassword{
    return [Common getStorageObjectWithKey:@"userPassword"];
}

- (NSString *)userPhone{
    return [Common getStorageObjectWithKey:@"userPhone"];
}

- (NSString *)userEmail{
    return UUserDefaults.userEmail; //取值（同上）
}

- (NSString *)userType{
    return UUserDefaults.userType;
}

- (NSString *)userImageURLStr{
    return UUserDefaults.userImageURLStr;
}



#pragma mark 登录：Login.
#pragma
- (void)loginWithUsername:(NSString *)username password:(NSString *)password{
    
}
- (void)cancelLogin{
    
}
#pragma mark 退出：Logout
#pragma
- (void)logout{
    
}


@end
