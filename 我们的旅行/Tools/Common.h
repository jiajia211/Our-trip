//
//  Common.h
//  ZM_BaseViewController
//
//  Created by tangdi on 15/6/12.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>//字间距 使用
#import "BaseHeader.h"

@interface Common : NSObject

//==============="  保存信息到本地：NSUserDefaults  "========================
#pragma mark 存入本地信息: Object
+(void)storageObject:(id)myMessage Key:(NSString*)mykey;
#pragma mark 读取一个本地信息: Object
+(id)getStorageObjectWithKey:(NSString *)mykey;
#pragma mark 存入本地信息: Array
+(void)storageObjectArray:(id)myMessage Key:(NSString*)mykey;

// 1.1存入本地信息: NSString
+(void)storageNSString:(NSString *)myMessage Key:(NSString*)mykey;
// 1.2读取一个本地信息: NSString
+(NSString *)getStorageNSStringWithKey:(NSString *)mykey;
// 2.1存入本地信息: BOOL
+(void)storageBool:(BOOL)myMessage Key:(NSString*)mykey;
// 2.2读取一个本地信息: BOOL
+(BOOL)getStorageBoolWithKey:(NSString *)mykey;
// 3.读取一个NSDictionary的信息
+(id)getStorageDicKey:(NSString *)dicKey DicObjectKey:(NSString *)dicObjectKey;

// 4.删除本地保存的信息
+(void)removeObjectKey:(NSString *)myKey;

//=========================="  日期  "========================
#pragma mark 获取当前日期
+(NSString*)getCurrentDate;
#pragma mark 获取与当前日期 相差的日期
+(NSString*)getDateSetYear:(NSInteger)year SetMonth:(NSInteger)month SetDay:(NSInteger)day;

#pragma mark 日期间隔1天
+ (NSDate *)dateForGraphAfterDate:(NSDate *)date;
#pragma mark 日期格式1：MM/dd
+ (NSString *)dateFormat1:(NSDate*)date;
#pragma mark 日期格式2：yyyy-MM-dd
+ (NSString *)dateFormat2:(NSDate*)date;
#pragma mark 日期格式3：yyyy-MM-dd HH:mm:ss
+ (NSString *)dateFormat3:(NSDate*)date;

#pragma mark 1.保存时间: 当前时间、24小时后的时间
+(void)createCurrentDateAndOneDay;
#pragma mark 2.判断时间大小
+(NSString*)compareOneDay:(NSDate *)Date1 withAnotherDay:(NSDate *)Date2;
#pragma mark 3.判断时间是否相同
+(BOOL)isEqualDate1:(NSDate *)Date1 WithDate2:(NSDate *)Date2;
//======================="  颜色  "=================================
#pragma mark 计算颜色
+ (id)getColor:(NSString *)hexColor;
#pragma mark 计算色值
+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

//======================="  图片：UIImage  "=================================
#pragma mark 等比例缩放图片
+ (UIImage*)transformWidth:(CGFloat)width height:(CGFloat)height image:(UIImage *)image;

//======================="  特殊判断  "=================================
#pragma mark 判断中文
+ (BOOL)isChinese:(NSString*)mystring;

#pragma mark 判断登录密码格式
+ (BOOL)isCharAndNumber:(NSString*)mystring;//只能由8～18数字和字符混合组


//=================="  验证邮箱、手机号、身份证、qq  "========================
typedef enum{
    VALIDATE_CHECK_EMAIL    =1,
    VALIDATE_CHECK_QQ       =2,
    VALIDATE_CHECK_MOBILE   =3,
    VALIDATE_CHECK_PASSWORD =4,
}VALIDATE_CHECK;
#pragma mark  验证邮箱、手机号、身份证、qq
+(BOOL)validateCheck:(NSString *)str stringType:(VALIDATE_CHECK)type;

#pragma mark ---------------"  验证邮箱  "-----------------
+ (BOOL)validateEmail:(NSString *)email;
#pragma mark ---------------"  验证手机号  "---------------
//1.简单的判断方法
+ (BOOL)validatePhone:(NSString *)phone;
//2.详细的判断方法
+ (BOOL)validateMyPhone:(NSString *)phone;
#pragma mark ---------------"  身份证识别  "---------------
//身份证识别1 此项不准
+ (BOOL)validateIDCard: (NSString *)identityCard;
//身份证识别2 准确
+(BOOL)checkIDCardNum:(NSString*)cardNo;


//手机号空格
+ (NSMutableString *)getPhoneEmpty:(NSString *)kaostring;
//银行卡号空格
+(NSMutableString *)getBankNumEmpty:(NSString *)kaostring;
//去掉卡号所有的空格
+(NSString *)removeStringEmpty:(NSString *)strings;
// 隐藏银行卡号中间位数统一显示：前4位后3位
+ (NSString *)convertIDCard:(id)idCard;


//==========================="   处理金额   "================================
#pragma mark - 把钱数改为万为单位
+(NSString *)convertMoneyToTenThousand:(id)money;
#pragma mark - 天数改为年
+(NSString *)convertDaysToYear:(id)days;

//==========================="   label   "================================
#pragma mark 计算字符串的尺寸
+(CGRect)getTextSize:(NSString*)string UIFont:(int)font  XX:(float)xx  YY:(float)yy Width:(float)width;

#pragma mark 计算字符串的尺寸高度_height
+ (float)getTextSizeHeight:(NSString*)string Font:(UIFont*)myfont Width:(float)width;
#pragma mark 计算字符串的尺寸宽度_width
+ (float)getTextSizeWidth:(NSString*)string Font:(UIFont*)myfont  Height:(float)height;


#pragma mark 改变一种字体大小
+ (void)changeTextFontLab:(UILabel *)myLabel text:(NSString *)text font:(UIFont *)font;
#pragma mark 此方法同时只能添加一次 NSMutableAttributedString 改变一种颜色
+ (void)changeTextColorLab:(UILabel *)myLabel text:(NSString *)text color:(UIColor *)color;
#pragma mark 改变文本的 两种颜色
+ (void)changeTextColorLab:(UILabel *)myLabel textA:(NSString *)textA  colorA:(UIColor *)colorA  textB:(NSString *)textB  color:(UIColor *)colorB;
#pragma mark 改变文本的 一种颜色、字体大小
+ (void)changeTextColorAndFontLab:(UILabel *)myLabel text:(NSString *)text color:(UIColor *)color font:(float)font;

#pragma mark //字间距：UITextField
+ (void)characterSpaceTextField:(UITextField *)mytextField Space:(long)mySpaceNum;
#pragma mark //字间距：UILabel
+ (void)characterSpaceLabel:(UILabel *)mylabel Space:(long)mySpaceNum;

#pragma mark 改变label分割开的字符 为一种颜色
+ (void)changeTextColorLab:(UILabel *)myLabel color:(UIColor *)myColor;


//==========================="   系统   "================================

#pragma mark 获取当前系统的版本号
+ (NSString *)getCFBundleVersion;
#pragma mark 获取系统配置文件
+ (NSDictionary *)getInfoDictionary;


//获取用户的id
+(NSString *)getmid;
//获取用户的sessionId;
+(NSString *)getsessionid;

// 判断是否为空串
+(BOOL)isNull:(id)object;
// 转换空串
+(NSString*)convertNull:(id)object;

//导航视图 动画
+(void)pushViewController:(UIViewController *)nav;


+ (void)ISIPHONEXX ;
//改变视图的渲染颜色
+(UIImageView *)changeViewImageView:(UIImageView *)imageView WithImage:(NSString *)imageName WithColor:(UIColor *)tintcolor;

//圆角
+(UIView *)imageView:(UIView *)imageView cornerRadius:(NSUInteger)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

@end






