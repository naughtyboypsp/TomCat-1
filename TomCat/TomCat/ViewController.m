//
//  ViewController.m
//  TomCat
//
//  Created by qingyun on 16/3/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>//音频框架

@interface ViewController ()
//图片的全局属性
@property (weak, nonatomic) IBOutlet UIImageView *tomImageView;
//声明一个音乐播放器
@property(strong,nonatomic)AVPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - 头部执行的动作
- (IBAction)HeaderbtnClicked:(UIButton *)sender {
    //如果图片正在动画，则直接返回
    if (_tomImageView.isAnimating)
    {
        return;
    }
    NSString *path=[[NSBundle mainBundle] pathForResource:@"stomach" ofType:@"mp3"];
    //将音频地址封装为url
    NSURL *url=[NSURL fileURLWithPath:path];
    //初始化播放器
    _player=[[AVPlayer alloc] initWithURL:url];
    //开始播放
    [_player play];

    //创建OC的集合(数组)
    NSMutableArray *mulArr=[NSMutableArray array];
    for (int i=0; i<81; i++)
    {
        //设置图片的名字
        //NSString表示OC的字符串,[]表示OC中方法的调用，固定格式 [类名/对象名 方法名]
        NSString *imgName=[NSString stringWithFormat:@"knockout_%02d.jpg",i];
//        NSLog(@"%@",imgName);
        //设置UIIm≥˜age属性(只有通过它，才可以改变图片内容)
        UIImage *img=[UIImage imageNamed:imgName];
        //把UIImage属性加入集合
        [mulArr addObject:img];
    }
    //设置动画的数组
    _tomImageView.animationImages=mulArr;
    //设置动画的持续时间
    _tomImageView.animationDuration=81*0.1;
    //设置重复次数
    _tomImageView.animationRepeatCount=1;
    
    //开始动画
    [_tomImageView startAnimating];

}
#pragma mark - 肚子执行的动作
- (IBAction)stomachAction:(UIButton *)sender {
    //如果图片正在动画，则直接返回
    if (_tomImageView.isAnimating)
    {
        return;
    }
//    AVAudioPlayer 
    //播放音频
    //获得音频地址
    NSString *path=[[NSBundle mainBundle] pathForResource:@"knockout" ofType:@"mp3"];
    //将音频地址封装为url
    NSURL *url=[NSURL fileURLWithPath:path];
    //初始化播放器
    _player=[[AVPlayer alloc] initWithURL:url];
    //开始播放
    [_player play];
    //声明一个OC数组
    NSMutableArray *mulArr=[NSMutableArray array];
    //获取该动作的图片
    for (int i=0; i<34; i++)
    {
        //设置图片的名字
        NSString *imgName=[NSString stringWithFormat:@"stomach_%02d.jpg",i];
        //封装为UIImage对象
        UIImage *img=[UIImage imageNamed:imgName];
        //把UIImage对象加入集合
        [mulArr addObject:img];
    }
    //设置动画的数组
    _tomImageView.animationImages=mulArr;
    //动画重复次数
    _tomImageView.animationRepeatCount=1;
    //持续时间
    _tomImageView.animationDuration=0.1*34;
    //开始动画
    [_tomImageView startAnimating];
}



@end
