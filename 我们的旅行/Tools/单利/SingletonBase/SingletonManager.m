//
//  SingletonManager.m
//  HuiFang
//
//  Created by tangdi on 15/11/27.
//  Copyright © 2015年 TD. All rights reserved.
//

#import "SingletonManager.h"

@implementation SingletonManager
//实例化
Singleton_Instance_method_Impl(SingletonManager)



- (LoginManager *)loginManager{
	return [LoginManager instance];
}


- (UserDefaults *)userDefaults{
	return [UserDefaults instance];
}

- (Notification *)notification {
	return [Notification instance];
}

- (FileManager *)fileManager {
	return [FileManager instance];
}

@end
