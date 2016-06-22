//
//  Notification.h
//  HuiFang
//
//  Created by tangdi on 15/11/26.
//  Copyright © 2015年 TD. All rights reserved.
//

#import "Singleton.h"


@interface Notification : Singleton
{

}
//实例化
Singleton_Instance_method_Interface(Notification);


// 添加通知
#define PostNotificat(_name) [[NSNotificationCenter defaultCenter] postNotificationName:_name object:nil]
// 接收通知
#define GetNotificatSelector(_selector,_name) [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_selector) name:_name object:nil];



// 监听输入框： (UIControlEventEditingChanged：内容改变时)
#define NNotificatTextFieldEditingChanged(_textFiled)	[_textFiled addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged]


//	监听键盘： (UIKeyboardWillHideNotification：键盘将要隐藏时)
#define NNotificatTextFieldKeyboardWillHide(_textFiled)	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NotificatKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];



@end
