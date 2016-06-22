//
//  FileManager.m
//  HuiFang
//
//  Created by tangdi on 15/11/27.
//  Copyright © 2015年 TD. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager

Singleton_Instance_method_Impl(FileManager);


-(void)baseUse {

	UIImage  *image = [UIImage imageNamed:@"1.png"];


	//管理文件：路径
	NSString *imagePath = ImagePath(@"520.png");
	NSLog(@"ImagePath = %@",ImagePath(@"520.png"));
	//保存图片
	[self storageImage:image withImagePath:imagePath];
	//读取图片
	UIImage* readImage = [self getImageWithPath:imagePath];

	UIImageView *imageview= [[UIImageView alloc]initWithFrame:CGRectMake(10, 70, 150, 200)];
	imageview.image= readImage;


	// UIImage转成base64字符串
	NSString* encodedImage = [self encodedImageToBase64WithImage:image];
	//NSLog(@"EncodedImage= %@ \n ", encodedImage);

	// Base64字符串转UIImage
	UIImage* decodedImage = [self decodingBase64ToImageWithString:encodedImage];
	NSLog(@"DecodedImage.size= %@", NSStringFromCGSize(decodedImage.size)); //显示图片大小尺寸 600 x 400


	//判断文件是否存在
	[self isExistFilePath:imagePath];
	//删除文件
	[self removeFilePath:imagePath];


	// 创建文件夹
	[self createImageFile];	//[self removeFilePath:_imageFilesPath]; //移动文件夹
	// 创建文件夹的 文件路径
	_imageFilePath1= [_imageFilesPath stringByAppendingPathComponent:@"imageFilePath1"];
	_imageFilePath2= [_imageFilesPath stringByAppendingPathComponent:@"imageFilePath2"];

}

#pragma mark  创建文件夹
- (void)createImageFile{

	_imageFilesPath = [NSString stringWithFormat:@"%@/ImageCaches/%@", NSHomeDirectory(), @"imageFile"];
	//以上3种路径皆可使用
	NSFileManager *fileManager = [NSFileManager defaultManager];
	BOOL isDirect = NO;
	BOOL existed = [fileManager fileExistsAtPath:_imageFilesPath isDirectory:&isDirect];

	if ( !(isDirect == YES && existed == YES) ){

		[fileManager createDirectoryAtPath:_imageFilesPath withIntermediateDirectories:YES attributes:nil error:nil];
	}
	
}

#pragma mark  判断文件是否存在
- (BOOL)isExistFilePath:(NSString *)Path{
	//管理文件
	NSFileManager *fileManager= [NSFileManager defaultManager];

	BOOL isExist= [fileManager fileExistsAtPath:Path];
	if (isExist){	NSLog(@"文件存在");
		return YES;
	}else{			NSLog(@"文件不存在");
		return NO;
	}
}
#pragma mark  读取文件
- (NSData *)getFileWithPath:(NSString *)path{
	//读取文件
	NSData*  readData=	[NSData dataWithContentsOfFile:path];
	return readData;
}
#pragma mark  移动文件
- (BOOL)moveFileAtPath:(NSString *)atPath toPath:(NSString *)toPath{

	//移动文件
	NSFileManager *fileManager = [[NSFileManager alloc]init]; //最好不要用defaultManager。
	NSError *error;

	BOOL isSuccess = [fileManager moveItemAtPath:atPath toPath:toPath error:&error];
	if (isSuccess) {
		NSLog(@"移动文件成功 \n"); return YES;
	}else{
		NSLog(@"移动文件失败 \n"); return NO;
	}
}
#pragma mark  复制文件
- (BOOL)copyFileAtPath:(NSString *)atPath toPath:(NSString *)toPath{

	//移动文件
	NSFileManager *fileManager = [[NSFileManager alloc]init]; //最好不要用defaultManager。
	NSError *error;
	BOOL isSuccess = [fileManager copyItemAtPath:atPath toPath:toPath error:&error];
	if (isSuccess) {
		NSLog(@"复制文件 成功 \n"); return YES;
	}else{
		NSLog(@"复制文件 失败 \n"); return NO;
	}
}
#pragma mark  删除文件
- (void)removeFilePath:(NSString *)Path{

	NSFileManager *fileManager= [NSFileManager defaultManager];

	if ([fileManager fileExistsAtPath:Path]) {//如果文件存在，则删除文件
		[fileManager removeItemAtPath:Path error:nil];
	}
	if (![fileManager fileExistsAtPath:Path]){
		NSLog(@"Path：文件已删除");
	}
	
}

//======================="  UIImage、Base64  "=================================

#pragma mark 保存图片
- (void)storageImage:(UIImage *)Image withImagePath:(NSString *)ImgPath{

	//保存图片: Image
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSData* imageData= UIImagePNGRepresentation(Image);
	[fileManager createFileAtPath:ImgPath contents:imageData attributes:nil];
}
#pragma mark 读取图片
- (UIImage *)getImageWithPath:(NSString *)ImgPath{

	//读取图片
	NSData*  readData=	[NSData dataWithContentsOfFile:ImgPath];
	UIImage* readImage= [UIImage imageWithData:readData];
	return readImage;
}


#pragma mark  UIImage ----> Base64字符
- (NSString *)encodedImageToBase64WithImage:(UIImage *)_image{

	NSData *myData = UIImageJPEGRepresentation(_image, 1.0f);
	NSString *encodedImage = [myData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];

	return encodedImage;
}
#pragma mark  Base64字符---> UIImage
- (UIImage *)decodingBase64ToImageWithString:(NSString *)_imageString{

	NSData *decodedImageData = [[NSData alloc] initWithBase64EncodedString:_imageString options:NSDataBase64DecodingIgnoreUnknownCharacters];

	UIImage* image = [UIImage imageWithData:decodedImageData];

	return image;
}



@end







