//
//  ViewController.m
//  ScreenShot
//
//  Created by qianfeng on 15/9/7.
//  Copyright (c) 2015年 my. All rights reserved.
//

#import "ViewController.h"
#import "YXDScreenShot.h"

#define IMAGEPATH @"/Documents/%d.png"

//static int number;

static BOOL isShotting;

@interface ViewController ()
{
    UIImageView *_imageview;
    CGPoint _beginPoint;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 250)];
    _imageview.image = [UIImage imageNamed:@"minion"];
    [self.view addSubview:_imageview];

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 320, 120, 40)];
    [self.view addSubview:button];
    [button setTitle:@"截图" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor grayColor];
    button.layer.cornerRadius = 10;
    [button addTarget:self action:@selector(getScreenShot) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 365, 120, 40)];
    [self.view addSubview:button2];
    [button2 setTitle:@"局部截图" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor grayColor];
    button2.layer.cornerRadius = 10;
    [button2 addTarget:self action:@selector(getPartScreenShot) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

#pragma mark 截整个屏幕的入口
-(void)getScreenShot
{
    UIImage *image = [YXDScreenShot getImageFromView:self.view];
    [YXDScreenShot savePicture:image];
}

#pragma mark 记录起始触摸点
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (isShotting) {
        UITouch *touch = [touches anyObject];
        _beginPoint = [touch locationInView:self.view];
    }
}

#pragma mark 记录结束触摸点并截图
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (isShotting) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view];
        
        UIImage *image = [YXDScreenShot getimageWithBeginPoint:_beginPoint andEndPoint:point FromView:self.view];
        [YXDScreenShot savePicture:image];
        
        isShotting = !isShotting;
    }
}

-(void)getPartScreenShot
{
    NSLog(@"可以开始截图");
    isShotting = !isShotting;
}

@end






















