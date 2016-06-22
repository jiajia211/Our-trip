//
//  Singleton.m
//  HuiFang
//
//  Created by tangdi on 15/11/27.
//  Copyright © 2015年 TD. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
/**
 *  覆盖这个方法是阻止其他程序员编码“[[Singleton alloc]init]”。
 　　你永远不应该使用alloc自己。请写+实例在自己的子类。
 　　请参阅类方法+ Singleton.h实例。
 */
+ (id)alloc
{
	@throw [NSException exceptionWithName:@"Singleton Mode Rules"
								   reason:@"Forbid using -alloc to create this object yourself, please use +singletonAlloc instead."
								 userInfo:@{}];
	return nil;
}

+ (id)singletonAlloc
{
	return [super alloc];
}


//+ (SingletonObject *)singleton
//{
//    static SingletonObject *instance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instance = [[self alloc] init];
//    });
//    return instance;
//}



@end
