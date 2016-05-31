//
//  YXDScreenShot.h
//  ScreenShot
//
//  Created by qianfeng on 15/9/7.
//  Copyright (c) 2015年 my. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YXDScreenShot : NSObject

+(UIImage *)getImageFromView:(UIView *)view;

+(UIImage *)getimageWithBeginPoint:(CGPoint)Bpoint andEndPoint:(CGPoint)Epoint FromView:(UIView *)view;

+(void)savePicture:(UIImage *)image;

@end
