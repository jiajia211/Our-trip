//
//  Common.m
//  ZM_BaseViewController
//
//  Created by tangdi on 15/6/12.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import "Common.h"

@implementation Common


#pragma mark 存入本地信息: Object
+(void)storageObject:(id)myMessage Key:(NSString*)mykey
{
    //同步读取数据：
    NSUserDefaults *userDefaluts = [NSUserDefaults standardUserDefaults];
    NSString* oldMessage = [userDefaluts objectForKey:mykey];

    if (oldMessage!=nil) {//如果存在: 删除旧的，保存新的
        [userDefaluts removeObjectForKey:mykey];
    }
    [userDefaluts setObject:myMessage forKey:mykey];
    [userDefaluts synchronize];//同步保存数据
}
#pragma mark 读取一个本地信息: Object
+(id)getStorageObjectWithKey:(NSString *)mykey{
    if (mykey.length>0 && mykey!=nil){
        NSUserDefaults *userDefaults= [NSUserDefaults standardUserDefaults];
        id myMessage = [userDefaults objectForKey:mykey];
        if (myMessage!=nil){
            return myMessage;
        }
    }
    return nil;
}
#pragma mark 存入本地信息: Array
+(void)storageObjectArray:(id)myMessage Key:(NSString*)mykey
{
    //读取数据：
    NSUserDefaults *userDefaluts = [NSUserDefaults standardUserDefaults];
    NSMutableArray *mutArray= [[NSMutableArray alloc]init];
    [[userDefaluts objectForKey:mykey] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mutArray addObject:obj];
    }];
    //添加新内容
    [mutArray addObject:(NSString *)myMessage];
    [userDefaluts setObject:mutArray forKey:mykey];
    [userDefaluts synchronize];//保存数据
}

// 1.1存入本地信息: NSString
+(void)storageNSString:(NSString *)myMessage Key:(NSString*)mykey{
    //读取数据：
    NSUserDefaults *userDefaluts=[NSUserDefaults standardUserDefaults];
    NSString* oldMessage=[userDefaluts stringForKey:mykey];
    if (oldMessage!=nil) { //如果存在: 删除旧的，保存新的
        [userDefaluts removeObjectForKey:mykey];
    }
    [userDefaluts setObject:myMessage forKey:mykey];
    [userDefaluts synchronize];//保存数据
}
// 1.2读取一个本地信息: NSString
+(NSString *)getStorageNSStringWithKey:(NSString *)mykey{
    if (mykey.length>0 && mykey!=nil){
        NSUserDefaults *userDefaults= [NSUserDefaults standardUserDefaults];
        NSString *myMessage=[userDefaults stringForKey:mykey];
        if (myMessage!=nil){
            return myMessage;
        }
    }
    return nil;
}
// 2.1存入本地信息: BOOL
+(void)storageBool:(BOOL)myMessage Key:(NSString*)mykey{
    //读取数据：
    NSUserDefaults *userDefaluts=[NSUserDefaults standardUserDefaults];
    BOOL oldBOOL=[userDefaluts boolForKey:mykey];
    if (oldBOOL==YES||oldBOOL==NO) { //如果存在: 删除旧的，保存新的
        [userDefaluts removeObjectForKey:mykey];
    }
    [userDefaluts setBool:myMessage   forKey:mykey];
    [userDefaluts synchronize];//保存数据
}
// 2.2读取一个本地信息: BOOL
+(BOOL)getStorageBoolWithKey:(NSString *)mykey{
    NSUserDefaults *userDefaults= [NSUserDefaults standardUserDefaults];
    BOOL myMessage=[userDefaults boolForKey:mykey];
    return myMessage;
}
// 3.读取一个NSDictionary的信息
+(id)getStorageDicKey:(NSString *)dicKey DicObjectKey:(NSString *)dicObjectKey{
    if (dicKey.length>0 && dicKey!=nil)
    {
        NSUserDefaults *userDefaults= [NSUserDefaults standardUserDefaults];
        NSDictionary* myDic=[userDefaults dictionaryForKey:dicKey];
        if (myDic!=nil && [myDic count]>0){
            id object= [myDic objectForKey:dicObjectKey];
            return object;
        }
    }
    return nil;
}
// 4.删除本地保存的信息: removeKey
+(void)removeObjectKey:(NSString *)myKey
{
    if (myKey.length>0 && myKey!=nil){
        NSUserDefaults *userDefaults= [NSUserDefaults standardUserDefaults];
        [userDefaults removeObjectForKey:myKey];
    }
}

//======================="  日期和时间  "=================================

#pragma mark 获取当前日期
+(NSString*)getCurrentDate
{
    NSDate * currentDate=[NSDate date];
    NSDateFormatter *dateFM=[[NSDateFormatter alloc]init];  // 时间格式器
    [dateFM setDateFormat:@"yyyy-MM-dd"];                   // 设置时间的格式
    NSString *getDate=[dateFM stringFromDate:currentDate];

    return getDate;
}
#pragma mark 获取与当前日期 相差的日期
+(NSString*)getDateSetYear:(NSInteger)year SetMonth:(NSInteger)month SetDay:(NSInteger)day
{
    //设置你需要增加或减少的年、月、日即可获得新的日期，上述的表示获取mydate日期前一个月的日期，如果该成+1，则是一个月以后的日期，以此类推都可以计算。
    NSDate * currentDate=[NSDate date];
//    NSLog(@"--->currentDate :%@", currentDate);
    NSCalendar *calendar= [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //
    NSDateComponents *comps = nil;
    comps= [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    //
    NSDateComponents *adcomps= [[NSDateComponents alloc] init];
    [adcomps setYear:year];    //年份
    [adcomps setMonth:month];  //月份
    [adcomps setDay:day];      //日份
    
    NSDate *newDate= [calendar dateByAddingComponents:adcomps toDate:currentDate options:0];
//    NSLog(@"--->newDate     :%@", newDate);
    NSDateFormatter *dateFM=[[NSDateFormatter alloc]init];  // 时间格式器
    [dateFM setDateFormat:@"yyyy-MM-dd"];                   // 设置时间的格式
    NSString *getDate=[dateFM stringFromDate:newDate];
    
    return getDate;
}

#pragma mark 日期间隔1天
+ (NSDate *)dateForGraphAfterDate:(NSDate *)date
{
    NSTimeInterval secondsInTwentyFourHours = 24 * 3600;
    NSDate *newDate= [date dateByAddingTimeInterval:secondsInTwentyFourHours];
    return newDate;
}
#pragma mark 日期格式1：MM/dd
+ (NSString *)dateFormat1:(NSDate*)date
{                                                       // 07/01
    NSDateFormatter *df= [[NSDateFormatter alloc] init];// 时间格式器
    df.dateFormat = @"MM/dd";                           // 设置时间的格式
    NSString *getDate= [df stringFromDate:date];
    return getDate;
}
#pragma mark 日期格式2：yyyy-MM-dd
+ (NSString *)dateFormat2:(NSDate*)date
{                                                       // 2015-07-01
    NSDateFormatter *df= [[NSDateFormatter alloc] init];// 时间格式器
    df.dateFormat = @"yyyy-MM-dd";                      // 设置时间的格式
    NSString *getDate= [df stringFromDate:date];
    return getDate;
}
#pragma mark 日期格式3：yyyy-MM-dd HH:mm:ss
+ (NSString *)dateFormat3:(NSDate*)date
{                                                       // 2015-07-01 17:30:40
    NSDateFormatter *df= [[NSDateFormatter alloc] init];// 时间格式器
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss";             // 设置时间的格式
    NSString *getDate= [df stringFromDate:date];
    return getDate;
}

#pragma mark 1.保存时间: 当前时间、24小时后的时间
+(void)createCurrentDateAndOneDay
{
    //NSDate生成:
    NSDate *date1 = [NSDate date];
    NSDate *date2 = [[NSDate alloc] initWithTimeIntervalSinceNow:24*3600];
//    NSLog(@"---> date1：%@",date1);
//    NSLog(@"---> date2：%@ \n ",date2);

    [self storageObject:date1 Key:@"date1"];
    [self storageObject:date2 Key:@"date2"];
}
#pragma mark 2.判断时间大小、相同
+(NSString*)compareOneDay:(NSDate *)Date1 withAnotherDay:(NSDate *)Date2
{
    NSDateFormatter *dateFM = [[NSDateFormatter alloc] init];
    [dateFM setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *date11 = [dateFM stringFromDate:Date1];//date   To  string
    NSString *date22 = [dateFM stringFromDate:Date2];

    NSDate *dateA = [dateFM dateFromString:date11];  //string To  date
    NSDate *dateB = [dateFM dateFromString:date22];
    NSComparisonResult result = [dateA compare:dateB];
    
//    NSLog(@"---> Date1 : %@",Date1);
//    NSLog(@"---> Date2 : %@",Date2);
//    
//    NSLog(@"---> date11: %@",date11);
//    NSLog(@"---> date22: %@",date22);
//    
//    NSLog(@"---> dateA : %@",dateA);
//    NSLog(@"---> dateB : %@ \n \n ",dateB);
    if (result == NSOrderedAscending){
        return @"-1";   //dateA 是过去的时间
    }
    else if (result == NSOrderedDescending) {
        return @"+1";   //dateA 是未来的时间
    }
    return @"0";        // 两者时间相同
}
#pragma mark 3.判断时间是否相同
+(BOOL)isEqualDate1:(NSDate *)Date1 WithDate2:(NSDate *)Date2
{
    //是否相同日期:
    if ([Date1 isEqualToDate: Date2]) {
        return YES;
    }else{
        return NO;
    }
}


//======================="  颜色：UIColor  "=================================
#pragma mark 计算颜色
+ (id)getColor:(NSString *)hexColor
{
    unsigned int redInt_, greenInt_, blueInt_;
    NSRange rangeNSRange_;
    rangeNSRange_.length = 2;  // 范围长度为2
    
    // 取红色的值
    rangeNSRange_.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&redInt_];
    // 取绿色的值
    rangeNSRange_.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&greenInt_];
    // 取蓝色的值
    rangeNSRange_.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&blueInt_];
    
    UIColor* Color= [UIColor colorWithRed:(float)(redInt_/255.0f) green:(float)(greenInt_/255.0f) blue:(float)(blueInt_/255.0f) alpha:1.0f];
    
    return Color;
}
#pragma mark 计算色值
+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

//======================="  图片：UIImage  "=================================

#pragma mark 等比例缩放图片
+ (UIImage*)transformWidth:(CGFloat)width height:(CGFloat)height image:(UIImage *)image
{
    CGFloat destW = width;
    CGFloat destH = height;
    CGFloat sourceW = width;
    CGFloat sourceH = height;
    
    CGImageRef imageRef = image.CGImage;
    CGContextRef bitmap = CGBitmapContextCreate(NULL,destW,destH,
                                                CGImageGetBitsPerComponent(imageRef),
                                                4*destW,CGImageGetColorSpace(imageRef),
                                                (kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst));
    
    CGContextDrawImage(bitmap, CGRectMake(0, 0, sourceW, sourceH), imageRef);
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    UIImage *result = [UIImage imageWithCGImage:ref];
    CGContextRelease(bitmap);
    CGImageRelease(ref);
    
    return result;
}


//======================="  特殊判断  "=================================

#pragma mark 判断中文
+ (BOOL)isChinese:(NSString*)mystring
{                                                       //点
//    NSString *regex = @"[\u4e00-\u9fa5][\u4e00-\u9fa5][\u00b7]+";
    NSString *regex = @"([\u4e00-\u9fa5][\u4e00-\u9fa5]+)|([\u00b7])";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if([pred evaluateWithObject:mystring]){
        return YES;
    }else{
        return NO;
    }
}

#pragma mark 判断登录密码格式
+ (BOOL)isCharAndNumber:(NSString*)mystring
{
    //   NSString *mystring = @"Letter123";
    
    //数字和字符混合组成 (不能有特殊符号，不能有空格)
    NSCharacterSet *disallowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm"] invertedSet];
    NSRange Range = [mystring rangeOfCharacterFromSet:disallowedCharacters];
    //不能全是数字
    NSCharacterSet *CharSet1= [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSRange Range1= [mystring rangeOfCharacterFromSet:CharSet1];
    //不能全是字母
    NSCharacterSet *CharSet2 = [[NSCharacterSet characterSetWithCharactersInString:@"QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm"] invertedSet];
    NSRange Range2= [mystring rangeOfCharacterFromSet:CharSet2];
    
    NSLog(@"---> mystring.length：%lu",mystring.length);
    if (mystring.length>=6 && mystring.length<=16) {//6～16
        
        if (Range.location == NSNotFound){          //只能由6～16数字和字符混合组成
            if (Range1.location != NSNotFound) {    //不能全是数字
                if (Range2.location != NSNotFound) {//不能全是字母
                    return YES;
                    
                }else return NO;
            }else return NO;
        }else return NO;
    }else return NO;
    
}

//========="  验证邮箱、手机号、身份证、qq  "=================================

static NSString *emailRegex=@"^([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$";
static NSString *qqRegex=@"^[1-9][0-9]{4,9}$";
static NSString *mobileNumberRegex=@"^1[0-9]{10,10}$";
static NSString *passwordRegex=@"^[a-zA-Z0-9]{8,17}$";

+(BOOL)validateCheck:(NSString *)str stringType:(VALIDATE_CHECK)type
{
    NSError *error;
    NSRegularExpression *regex;
    NSTextCheckingResult *result;
    NSString *regexStr = @"";
    if(type==VALIDATE_CHECK_EMAIL)
    {
        regexStr= emailRegex;
    }
    else if(type==VALIDATE_CHECK_QQ)
    {
        regexStr= qqRegex;
    }
    else if(type==VALIDATE_CHECK_MOBILE)
    {
        regexStr= mobileNumberRegex;
    }
    else if(type==VALIDATE_CHECK_PASSWORD)
    {
        regexStr= passwordRegex;
    }
    regex=[NSRegularExpression regularExpressionWithPattern:regexStr options:0 error:&error];
    result=[regex firstMatchInString:str options:0 range:NSMakeRange(0, [str length])];
    if(!result){
        return NO;
    }else{
        return YES;
    }
}

#pragma mark 验证邮箱
#pragma
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
#pragma mark 验证手机号
#pragma
//1.简单的判断方法
+ (BOOL)validatePhone:(NSString *)phone
{   //这只是简单地判断手机号格式。其实手机的格式还是有一点复杂的
    //手机号以13，15，17，18开头
    NSString *phoneRegex = @"1[3|5|7|8|][0-9]{9}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}
//2.详细的判断方法
+ (BOOL)validateMyPhone:(NSString *)phone
{   //正则判断手机号码格式
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
         加177,178
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|7[78]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186  加176
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|7[6]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189   加177,178
     22         */
    NSString * CT = @"^1((33|53|77|78|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:phone] == YES)
        || ([regextestcm evaluateWithObject:phone] == YES)
        || ([regextestct evaluateWithObject:phone] == YES)
        || ([regextestcu evaluateWithObject:phone] == YES))
    {
        if([regextestcm evaluateWithObject:phone] == YES) {
            NSLog(@"China Mobile");
        } else if([regextestct evaluateWithObject:phone] == YES) {
            NSLog(@"China Telecom");
        } else if ([regextestcu evaluateWithObject:phone] == YES) {
            NSLog(@"China Unicom");
        } else {
            NSLog(@"Unknow");
        }
        
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark 身份证识别1 此项不准
#pragma
+ (BOOL)validateIDCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}
#pragma mark 身份证识别2 准确
#pragma
+(BOOL)checkIDCardNum:(NSString*)cardNo
{
    if (cardNo.length != 18) {
        return  NO;
    }
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    
    NSScanner* scan = [NSScanner scannerWithString:[cardNo substringToIndex:17]];
    
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        return NO;
    }
    int sumValue = 0;
    
    for (int i =0; i<17; i++) {
        sumValue+=[[cardNo substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
    }
    
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue%11]];
    
    if ([strlast isEqualToString: [[cardNo substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
        return YES;
    }
    return  NO;
}

//======================="  卡号  "=================================
#pragma mark 手机号空格
#pragma
+ (NSMutableString *)getPhoneEmpty:(NSString *)kaostring
{
    NSMutableString *String1 = nil;
    if (kaostring!=nil) {
        String1= [[NSMutableString alloc] initWithString:kaostring] ;
        if (kaostring.length==11) { //11位卡号
            [String1 insertString:@" " atIndex:3];
            [String1 insertString:@" " atIndex:8];
            return String1;
        }else{
            return String1;
        }
    }
    return nil;
}
#pragma mark 银行卡号空格
#pragma
+(NSMutableString *)getBankNumEmpty:(NSString *)kaostring
{
    NSMutableString *String1 = nil;
    if (kaostring!=nil) {
        String1 = [[NSMutableString alloc] initWithString:kaostring] ;
        if (kaostring.length==19) { //19位卡号
            [String1 insertString:@" " atIndex:4];
            [String1 insertString:@" " atIndex:9];
            [String1 insertString:@" " atIndex:14];
            [String1 insertString:@" " atIndex:19];
            return String1;
        }else if(kaostring.length==16){ //16位卡号
            [String1 insertString:@" " atIndex:4];
            [String1 insertString:@" " atIndex:9];
            [String1 insertString:@" " atIndex:14];
            return String1 ;
        }else if(kaostring.length==18){//18位卡号
            [String1 insertString:@" " atIndex:4];
            [String1 insertString:@" " atIndex:9];
            [String1 insertString:@" " atIndex:14];
            [String1 insertString:@" " atIndex:19];
            return String1;
        }else{
            return String1;
        }
    }
    return nil;
}
#pragma mark 去掉空格
#pragma
+(NSString *)removeStringEmpty:(NSString *)strings
{
    if (strings!=nil) {
        NSString* str = [strings stringByReplacingOccurrencesOfString:@" " withString:@""];
        return str;
    }
    return nil;
}

#pragma mark 隐藏银行卡号中间位数统一显示：前4位后3位
#pragma
+ (NSString *)convertIDCard:(id)idCard
{
    NSMutableString *returnString = [NSMutableString string];
    if ([idCard isEqual:[NSNull null]] || [idCard isKindOfClass:[NSNull class]] || idCard == nil) {
        [returnString appendString:@""];
        return returnString;
    }
    
    NSString *temp = nil;
    if ([idCard isKindOfClass:[NSString class]]) {
        temp = (NSString *)idCard;
    } else {
        temp = [idCard stringValue];
    }
    
    if (temp && temp.length) {
        if (temp.length>=4) {
            [returnString appendString:[temp substringToIndex:4]];
        }
        //统一显示：前4位后3位
        if (temp.length==19) {
            [returnString appendString:@"**** **** ****"];
            [returnString appendString:[temp substringFromIndex:16]];
        }
        else if (temp.length==18){
            [returnString appendString:@"**** **** ***"];
            [returnString appendString:[temp substringFromIndex:15]];
        }
        else if (temp.length==17){
            [returnString appendString:@"**** **** **"];
            [returnString appendString:[temp substringFromIndex:14]];
        }
        else if (temp.length==16){
            [returnString appendString:@"**** **** *"];
            [returnString appendString:[temp substringFromIndex:13]];
        }
    }
    return returnString;
}
//==========================="   处理金额   "================================
#pragma mark - 把钱数改为万为单位
+(NSString *)convertMoneyToTenThousand:(id)money
{
    NSString *returnMoney = [NSString string];
    
    if ([money isEqual:[NSNull null]]
        || [money isKindOfClass:[NSNull class]]
        || money == nil) {
        returnMoney = @"";
        return returnMoney;
    }
    
    NSString *temp = nil;
    if ([money isKindOfClass:[NSString class]]) {
        temp = (NSString *)money;
    } else {
        temp = [money stringValue];
    }
    
    //小于10000或者有小数点的显示原数字
    NSRange range = [temp rangeOfString:@"."];
    if (temp && temp.length) {
        if ([money floatValue]<10000 || range.length) {
            returnMoney = [NSString stringWithFormat:@"%@元",temp];
            return returnMoney;
        }
    }
    //没有小数点且大于10000的显示以万为单位
    CGFloat fMoney = [temp floatValue];
    if (temp && temp.length) {
        returnMoney = [NSString stringWithFormat:@"%.0f万元",fMoney/10000];
    }
    return returnMoney;
}
#pragma mark - 天数改为年
+(NSString *)convertDaysToYear:(id)days
{
    NSString *returnString = [NSString string];
    if ([days isEqual:[NSNull null]] || [days isKindOfClass:[NSNull class]]
        || days == nil) {
        returnString = @"";
        return returnString;
    }
    
    NSString *temp = nil;
    if ([days isKindOfClass:[NSString class]]) {
        temp = (NSString *)days;
    } else {
        temp = [days stringValue];
    }
    
    //365或者366天改为年为单位,否则显示为天
    if (temp && temp.length) {
        if (!([days intValue]%365)) {
            returnString = [NSString stringWithFormat:@"%d年",[temp intValue]/365];
        } else if (!([temp intValue]%366)) {
            returnString = [NSString stringWithFormat:@"%d年",[temp intValue]/366];
        } else {
            returnString = [NSString stringWithFormat:@"%@天",temp];
        }
    }
    
    return returnString;
}

//==========================="   尺寸   "================================
#pragma mark 计算字符串的尺寸
+(CGRect)getTextSize:(NSString*)string UIFont:(int)font  XX:(float)xx  YY:(float)yy Width:(float)width
{
    //获取文本的宽度
    NSMutableParagraphStyle *paragraph= [[NSMutableParagraphStyle alloc]init];
    paragraph.alignment = NSLineBreakByWordWrapping;
    NSDictionary *attributeDic = @{NSFontAttributeName: [UIFont systemFontOfSize:font], NSParagraphStyleAttributeName: paragraph};
    //string、label.text
    CGSize mySize =[string boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributeDic context:nil].size;
    //有几个文字：string.length
    //文字的宽度：mySize.width
    //文字的高度：mySize.height
    NSLog(@"----->1.text.length: %lu ",(unsigned long)string.length);
    NSLog(@"----->2.fontSize.width: %f",mySize.width);
    NSLog(@"----->3.fontSize.height: %f \n ",mySize.height);
    //获取后的尺寸: fontSize.width/height
    CGRect rect= CGRectMake(xx, yy,mySize.width,mySize.height);
    return rect;
}
#pragma mark 计算字符串的尺寸高度_height：宽度固定
+ (float)getTextSizeHeight:(NSString*)string Font:(UIFont*)myfont Width:(float)width
{
    //获取文本
    NSMutableParagraphStyle *paragraph= [[NSMutableParagraphStyle alloc]init];
    paragraph.alignment = NSLineBreakByWordWrapping;
    NSDictionary *attributeDic = @{NSFontAttributeName: myfont, NSParagraphStyleAttributeName: paragraph};
    //string
    CGSize mySize =[string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributeDic context:nil].size;
    
    //NSLog(@"-----> fontSize.height: %f \n ",mySize.height);
    float height= mySize.height + 1;// ＋1 防止四舍五入
    return height;
}
#pragma mark 计算字符串的尺寸宽度_width：高度固定
+ (float)getTextSizeWidth:(NSString*)string Font:(UIFont*)myfont  Height:(float)height
{
    //获取文本
    NSMutableParagraphStyle *paragraph= [[NSMutableParagraphStyle alloc]init];
    paragraph.alignment = NSLineBreakByWordWrapping;
    NSDictionary *attributeDic = @{NSFontAttributeName: myfont, NSParagraphStyleAttributeName: paragraph};
    //string
    CGSize mySize =[string boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributeDic context:nil].size;
    //    NSLog(@"-----> fontSize.width: %f \n ",mySize.width);
    float width= mySize.width + 1;
    return width;
}

#pragma mark  改变一种字体大小
+ (void)changeTextFontLab:(UILabel *)myLabel text:(NSString *)text font:(UIFont *)font
{
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:myLabel.text];
    //改变字体大小
    //NSMakeRange(5,2); //(从第几个开始，共截取的范围)
    NSRange textRang = [[noteStr string] rangeOfString:text];
    NSRange Range = NSMakeRange(textRang.location, textRang.length);
    [noteStr addAttribute:NSFontAttributeName value:font range:Range];
    [myLabel setAttributedText:noteStr];
}

#pragma mark 此方法同时只能添加一次 NSMutableAttributedString 改变一种颜色
+ (void)changeTextColorLab:(UILabel *)myLabel text:(NSString *)text color:(UIColor *)color
{
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:myLabel.text];
    //NSRange Range = NSMakeRange(5,2);//(从第几个开始，共截取的范围)
    //改变颜色
    NSRange textRang = [[noteStr string] rangeOfString:text];
    NSRange redRange = NSMakeRange(textRang.location, textRang.length);
    [noteStr addAttribute:NSForegroundColorAttributeName value: color range:redRange];
    [myLabel setAttributedText:noteStr];
}
#pragma mark 改变label的文本的 两种颜色
+ (void)changeTextColorLab:(UILabel *)myLabel textA:(NSString *)textA  colorA:(UIColor *)colorA  textB:(NSString *)textB  color:(UIColor *)colorB{
    
    NSMutableAttributedString *MutAttStr = [[NSMutableAttributedString alloc] initWithString:myLabel.text];
    //改变颜色1
    NSRange RangeA = NSMakeRange([[MutAttStr string] rangeOfString: textA].location, [[MutAttStr string] rangeOfString: textA].length);
    [MutAttStr addAttribute:NSForegroundColorAttributeName value: colorA range:RangeA];
    //改变颜色2
    NSRange RangeB = NSMakeRange([[MutAttStr string] rangeOfString: textB].location, [[MutAttStr string] rangeOfString: textB].length);
    [MutAttStr addAttribute:NSForegroundColorAttributeName value: colorB range:RangeB];
    
    [myLabel setAttributedText:MutAttStr];
}

#pragma mark  改变一种文本的颜色、字体大小
+ (void)changeTextColorAndFontLab:(UILabel *)myLabel text:(NSString *)text color:(UIColor *)color font:(float)font
{
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:myLabel.text];
    NSRange textRang = [[noteStr string] rangeOfString:text];
    NSRange Range = NSMakeRange(textRang.location, textRang.length);
    
    UIFont * myFont = [UIFont systemFontOfSize:font];
    [noteStr addAttribute:NSForegroundColorAttributeName value:color range:Range];
    [noteStr addAttribute:NSFontAttributeName value:myFont range:Range];
    
    [myLabel setAttributedText:noteStr];
}

#pragma mark //字间距：UITextField
+ (void)characterSpaceTextField:(UITextField *)mytextField Space:(long)mySpaceNum
{
    //字间距
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&mySpaceNum);
    
    NSMutableAttributedString *noteStr =[[NSMutableAttributedString alloc]initWithString:mytextField.text];
    NSRange textRang = [[noteStr string] rangeOfString:mytextField.text];
    NSRange Range = NSMakeRange(textRang.location, textRang.length);
    [noteStr addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:Range];
    [mytextField setAttributedText:noteStr];
}
#pragma mark //字间距：UILabel
+ (void)characterSpaceLabel:(UILabel *)mylabel Space:(long)mySpaceNum
{
    //字间距
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&mySpaceNum);
    
    NSMutableAttributedString *noteStr =[[NSMutableAttributedString alloc]initWithString:mylabel.text];
    NSRange textRang = [[noteStr string] rangeOfString:mylabel.text];
    NSRange Range = NSMakeRange(textRang.location, textRang.length);
    [noteStr addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:Range];
    [mylabel setAttributedText:noteStr];
}

#pragma mark 改变label分割开的字符 为一种颜色
+ (void)changeTextColorLab:(UILabel *)myLabel color:(UIColor *)myColor{
    
    NSMutableAttributedString *MutAttStr = [[NSMutableAttributedString alloc] initWithString:myLabel.text];
    //改变颜色1
    NSRange RangeA = NSMakeRange([[MutAttStr string] rangeOfString: @"天"].location, [[MutAttStr string] rangeOfString: @"天"].length);
    [MutAttStr addAttribute:NSForegroundColorAttributeName value: myColor range:RangeA];
    //改变颜色2
    NSRange RangeB = NSMakeRange([[MutAttStr string] rangeOfString: @"小时"].location, [[MutAttStr string] rangeOfString: @"小时"].length);
    [MutAttStr addAttribute:NSForegroundColorAttributeName value: myColor range:RangeB];
    //改变颜色3
    NSRange RangeC = NSMakeRange([[MutAttStr string] rangeOfString: @"分"].location, [[MutAttStr string] rangeOfString: @"分"].length);
    [MutAttStr addAttribute:NSForegroundColorAttributeName value: myColor range:RangeC];
    //改变颜色4
    NSRange RangeD = NSMakeRange([[MutAttStr string] rangeOfString: @"秒"].location, [[MutAttStr string] rangeOfString: @"秒"].length);
    [MutAttStr addAttribute:NSForegroundColorAttributeName value: myColor range:RangeD];

    
    [myLabel setAttributedText:MutAttStr];
}


//==========================="   系统   "================================

#pragma mark 获取当前系统的版本号
+ (NSString *)getCFBundleVersion{

    NSString *Versionid = [[Common getInfoDictionary] objectForKey:@"CFBundleVersion"];
    if (Versionid) {
        return Versionid;
    }
    return nil;
}
#pragma mark 获取系统配置文件
+ (NSDictionary *)getInfoDictionary
{
    NSDictionary *infoDictionary= [[NSBundle mainBundle] infoDictionary];
    return infoDictionary;
}

//获取用户id
+(NSString *)getmid
{
    return @"";
}
//获取sessionId
+(NSString *)getsessionid
{
    return @"";
}

// 判断是否为空串
+(BOOL)isNull:(id)object
{
    if (!object) {
        return YES;
    }
    if (object && [object isEqual:@"<null>"]){
        return YES;
    }

    if (object && [object isEqual:[NSNull null]]){
        return YES;
    }else if ([object isKindOfClass:[NSNull class]]){
        return YES;
    } else if (object == nil) {
        return YES;
    } else if ([object isEqual:@""]) {
        return YES;
    }
    return NO;
}
// 转换空串
+(NSString*)convertNull:(NSString *)object
{
	if (!object || object.length==0) {
		return @"";
	}
    if (object && [object isEqual:@"<null>"]){
        return @"";
    }
    if (object && [object isEqual:[NSNull null]]){
        return @"";
    }else if ([object isKindOfClass:[NSNull class]]){
        return @"";
    } else if (object == nil) {
        return @"";
    }
    
    return object;
}

//==========================="   动画   "================================

#pragma mark 导航视图 动画
//+(void)pushViewController:(UIViewController *)nav
//{
//    UIWindow *window=[[[UIApplication sharedApplication] delegate] window];
//    window.rootViewController = nav;
//    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.5];
//    [UIView setAnimationTransition:5 forView:window cache:YES];
//    [UIView commitAnimations];
//}

//导航视图 动画
+(void)pushViewController:(UIViewController *)nav
{
    UIWindow *window=[[[UIApplication sharedApplication] delegate] window];
    window.rootViewController=nav;
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:window cache:YES];
    nav.modalTransitionStyle = UIModalTransitionStyleCoverVertical;    //从底部滑入
    //nav.modalPresentationStyle =  UIModalPresentationFullScreen;
    [UIView commitAnimations];
}

#pragma mark 普通动画
+(void)flipView:(UIView *)myView Rect:(CGRect)myRect forView:(UIView *)view
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:view cache:YES];
    myView.frame = myRect;
    [UIView commitAnimations];
    
}

+ (void)ISIPHONEXX {

//	NSLog(@"SSWIDTH = %@",@(SSWIDTH));
//	NSLog(@"SSHEIGHT= %@",@(SSHEIGHT));
//
//	if (IS_IPHONE4) {
//		NSLog(@"========= IS_IPHONE4 ");
//
//	}else if (IS_IPHONE5){
//		NSLog(@"========= IS_IPHONE5 ");
//
//	}else if (IS_IPHONE6){
//		NSLog(@"========= IS_IPHONE6 ");
//
//	}else if (IS_IPHONE6p){
//		NSLog(@"========= IS_IPHONE6p ");
//	}
}
//改变视图的渲染颜色
+(UIImageView *)changeViewImageView:(UIImageView *)imageView WithImage:(NSString *)imageName WithColor:(UIColor *)tintcolor
{
    
    imageView.image =[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    imageView.tintColor =tintcolor;
    
    return imageView;
    
}
//圆角
+(UIView *)imageView:(UIView *)imageView cornerRadius:(NSUInteger)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth{
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = cornerRadius;
    imageView.layer.borderColor = borderColor.CGColor;
    imageView.layer.borderWidth =borderWidth;
    return imageView;
}
@end











