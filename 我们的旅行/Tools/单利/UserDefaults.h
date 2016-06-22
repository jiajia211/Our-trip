//
//  UserDefaults.h
//  ZMSingleton
//
//  Created by tangdi on 15/11/4.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "Singleton.h"
#import <objc/runtime.h>

@interface UserDefaults : Singleton
{

}
//实例化
Singleton_Instance_method_Interface(UserDefaults);



/**
 *  登录用户在主线程
 */
@property (nonatomic, strong) NSString                 *deviceToken;
@property (nonatomic, strong) NSString                 *token;
@property (nonatomic, assign) BOOL                     isLogined;
@property (nonatomic, assign) BOOL isOnline                 DEPRECATED_ATTRIBUTE;
/**
 *  用户信息
 */

@property (nonatomic, retain) NSNumber                 *userId;
@property (nonatomic, copy  ) NSString                 *userName;
@property (nonatomic, copy  ) NSString                 *userPassword;
@property (nonatomic, copy  ) NSString                 *userPhone;
@property (nonatomic, copy  ) NSString                 *userEmail;
@property (nonatomic, copy  ) NSString                 *userType;
@property (nonatomic, copy  ) NSString                 *userImageURLStr;

@end
