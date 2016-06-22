//
//  ViewControllerIntercepter.m
//  我们的旅行
//
//  Created by 佳佳 on 16/5/31.
//  Copyright © 2016年 佳佳. All rights reserved.
//

#import "ViewControllerIntercepter.h"
#import <Aspects.h>//方法拦截
#import <UIKit/UIKit.h>
#import "BaseHeader.h"
@interface ViewControllerIntercepter()

@end

@implementation ViewControllerIntercepter
+ (void)load
{
    /* + (void)load 会在应用启动的时候自动被runtime调用，通过重载这个方法来实现最小的对业务方的“代码入侵” */
    [super load];
    [ViewControllerIntercepter sharedInstance];
}

/*
 
 按道理来说，这个sharedInstance单例方法是可以放在头文件的，但是对于目前这个应用来说，暂时还没有放出去的必要
 
 当业务方对这个单例产生配置需求的时候，就可以把这个函数放出去
 */
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static ViewControllerIntercepter *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ViewControllerIntercepter alloc] init];
    });
    return sharedInstance;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        //在这里做好拦截
        [UIViewController aspect_hookSelector:@selector(loadView) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo){
            [self loadView:[aspectInfo instance]];
        } error:nil];
        
        //在这里做好拦截
        [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo,BOOL animated){
            [self viewWillAppear:animated viewController:[aspectInfo instance]];
        } error:nil];
    }
    return self;
}
#pragma mark - fake methods
- (void)loadView:(UIViewController *)viewController
{
    /* 你可以使用这个方法进行打日志，初始化基础业务相关的内容 */
    viewController.view.backgroundColor = BgColor;
    if (viewController.navigationController.viewControllers.count >1) {
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    NSLog(@"[%@ loadView]", [viewController class]);
}

- (void)viewWillAppear:(BOOL)animated viewController:(UIViewController *)viewController
{
    /* 你可以使用这个方法进行打日志，初始化基础业务相关的内容 */
    NSLog(@"[%@ viewWillAppear:%@]", [viewController class], animated ? @"YES" : @"NO");
}
@end
