//
//  FileManager.h
//  HuiFang
//
//  Created by tangdi on 15/11/27.
//  Copyright © 2015年 TD. All rights reserved.
//

#import "Singleton.h"

@interface FileManager : Singleton
{
	// 创建文件夹
	NSString *_imageFilesPath;
	// 创建文件
	NSString *_imageFilePath1;
	NSString *_imageFilePath2;
}
//实例化
Singleton_Instance_method_Interface(FileManager);



// 注意：以下是创建文件

//获取程序的根目录 Documents路径
#define HomeDirectoryPath	NSHomeDirectory()

//1: Document
#define Document_pathArray  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)
#define DocumentPath		[Document_pathArray objectAtIndex:0]

//2: Libray
#define Library_pathArray	NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)
#define LibraryPath			[Library_pathArray objectAtIndex:0]

//3: Libaray/Caches
#define Cache_pathArray		NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)
#define CachePath			[Cache_pathArray objectAtIndex:0]

//4: Libaray/Preferences
#define Preferen_pathArray	NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES)
#define PreferenPath		[Preferen_pathArray objectAtIndex:0]

//5: Temporary
#define TempPath				NSTemporaryDirectory()

#define ImagePath(_path)  [NSHomeDirectory() stringByAppendingPathComponent:_path] //拼接文件路径


#pragma mark  判断文件是否存在
- (BOOL)isExistFilePath:(NSString *)Path;
#pragma mark  读取文件
- (NSData *)getFileWithPath:(NSString *)path;
#pragma mark  移动文件
- (BOOL)moveFileAtPath:(NSString *)atPath toPath:(NSString *)toPath;
#pragma mark  复制文件
- (BOOL)copyFileAtPath:(NSString *)atPath toPath:(NSString *)toPath;
#pragma mark  删除文件
- (void)removeFilePath:(NSString *)Path;

//======================="  UIImage、Base64  "=================================

#pragma mark 保存图片
- (void)storageImage:(UIImage *)Image withImagePath:(NSString *)ImgPath;
#pragma mark 读取图片
- (UIImage *)getImageWithPath:(NSString *)ImgPath;


#pragma mark  UIImage ----> Base64字符
- (NSString *)encodedImageToBase64WithImage:(UIImage *)_image;
#pragma mark  Base64字符---> UIImage
- (UIImage *)decodingBase64ToImageWithString:(NSString *)_imageString;



@end









