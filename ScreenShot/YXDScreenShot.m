//
//  YXDScreenShot.m
//  ScreenShot
//
//  Created by yxd on 15/9/7.
//  Copyright (c) 2015年 my. All rights reserved.
//

#import "YXDScreenShot.h"

@implementation YXDScreenShot

#pragma mark 从屏幕截图
+(UIImage *)getImageFromView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.frame.size, TRUE, 1);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];//获取图形上下文
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();//将获取的图形上下文绘制到image中
//    UIGraphicsEndImageContext();
    return image;
}

+(CGPoint)calculateBeginPointWithBeginPoint:(CGPoint)Bpoint andEndPoint:(CGPoint)Epoint
{
    return CGPointMake((Bpoint.x<Epoint.x)?Bpoint.x:Epoint.x, (Bpoint.y<Epoint.y?Bpoint.y:Epoint.y));
}

+(CGSize)calculateSizeWithBeginPoint:(CGPoint)Bpoint andEndPoint:(CGPoint)Epoint
{
    return CGSizeMake((Bpoint.x>Epoint.x)?(Bpoint.x-Epoint.x):(Epoint.x-Bpoint.x), (Bpoint.y>Epoint.y)?(Bpoint.y-Epoint.y):(Epoint.y-Bpoint.y));
}

+(UIImage *)getimageWithBeginPoint:(CGPoint)Bpoint andEndPoint:(CGPoint)Epoint FromView:(UIView *)view
{
    CGPoint origin = [YXDScreenShot calculateBeginPointWithBeginPoint:Bpoint andEndPoint:Epoint];
    CGSize size = [YXDScreenShot calculateSizeWithBeginPoint:Bpoint andEndPoint:Epoint];
    
    UIImage *viewimage = [YXDScreenShot getImageFromView:view];
    CGRect rect = CGRectMake(origin.x, origin.y, size.width, size.height);//按照图像的像素矩阵重绘图形
    CGImageRef imageRefRect = CGImageCreateWithImageInRect(viewimage.CGImage, rect);
    return [[UIImage alloc] initWithCGImage:imageRefRect];
}

+(void)savePicture:(UIImage *)image
{
#pragma mark 将照片保存到沙盒路径下指定文件中
    //    NSData *data = UIImagePNGRepresentation(image);
    //    NSString *path = [NSHomeDirectory() stringByAppendingString:[NSString stringWithFormat:IMAGEPATH,number++]];
    //    [data writeToFile:path atomically:TRUE];
    //    NSLog(@"%@",path);
    
#pragma mark 将照片保存到相册
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
    NSLog(@"截图已保存到相册");
}

@end

















