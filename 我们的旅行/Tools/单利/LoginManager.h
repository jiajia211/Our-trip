//
//  LoginManager.h
//  ZMSingleton
//
//  Created by tangdi on 15/11/4.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "Singleton.h"

@interface LoginManager : Singleton
{
    
}
//实例化
Singleton_Instance_method_Interface(LoginManager)



/**
 *  登录用户在主线程
 */
@property (nonatomic, strong) NSString *deviceToken;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, assign) BOOL isLogined;
@property (nonatomic, assign) BOOL isOnline DEPRECATED_ATTRIBUTE;
/**
 *  用户信息
 */
@property (nonatomic, retain) NSNumber *userId;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, readonly) NSString *userPassword;
@property (nonatomic, readonly) NSString *userPhone;
@property (nonatomic, readonly) NSString *userEmail;
@property (nonatomic, readonly) NSString *userType;
@property (nonatomic, readonly) NSString *userImageURLStr;
/**
 *  用户识别关键。帮助服务器检测到我是谁。登录uid或UUID。
 */
@property (nonatomic, strong, readonly) NSString *userIdentify;

/**
 登录：Login.
 */
- (void)loginWithUsername:(NSString *)username password:(NSString *)password;
- (void)cancelLogin;

/**
 退出：Logout
 */
- (void)logout;

@end



