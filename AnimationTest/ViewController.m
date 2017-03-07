//
//  ViewController.m
//  AnimationTest
//
//  Created by 韩扬 on 2017/3/5.
//  Copyright © 2017年 韩扬. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView * imgV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

-(void)createUI {
//    UIView * redView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    redView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:redView];
//    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position"];
//    animation.removedOnCompletion = NO;//完成时不移除
//    animation.fillMode = kCAFillModeForwards;//完成时保持末尾状态
//    animation.duration = 2;//动画持续时间
//    animation.beginTime = CACurrentMediaTime() + 1;//延时语句
//    animation.repeatCount = MAXFLOAT;//无线循环
//    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(400, 400)];//终止位置
//    [redView.layer addAnimation:animation forKey:nil];//填入layer
    //forkey 以后检测动画播放进度或者是移除动画之类的都是要填写正确的key才可以
    
    //将animation加入layer层以后，就无法再更改动画效果了
//    animation.beginTime = CACurrentMediaTime() + 1;//延时语句
//    animation.repeatCount = MAXFLOAT;//无线循环
    
//    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    animation.values = @[[NSValue valueWithCGPoint:CGPointMake(0, 0)],[NSValue valueWithCGPoint:CGPointMake(100, 100)],[NSValue valueWithCGPoint:CGPointMake(0, 200)]];
//    animation.duration = 2;
//    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeForwards;
////    animation.calculationMode = kCAAnimationCubicPaced;//改变补间动画的计算模式
//    animation.keyTimes = @[@0,@0.25,@0.5,@0.75,@1];
//    animation.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)].CGPath;
////    [redView.layer addAnimation:animation forKey:@"keyframe"];
//    
//    CABasicAnimation * animation2 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
//    animation2.toValue = @50;
//    animation2.duration = 2;
//    animation2.fillMode = kCAFillModeForwards;
//    animation2.removedOnCompletion = NO;
//    
//    CAAnimationGroup * group = [CAAnimationGroup animation];//CAAnimationGroup是可以嵌套的
//    group.duration = 2;
//    group.fillMode = kCAFillModeForwards;
//    group.removedOnCompletion = NO;
//    group.animations = @[animation,animation2];
//    [redView.layer addAnimation:group forKey:@"group"];
    
    /**
     * CATransition
     * 转场动画
     */
    
    UIButton * btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn setBackgroundColor:[UIColor yellowColor]];
    [btn setFrame:CGRectMake(200, 200, 100, 100)];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(a:) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIImageView * redView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    redView.image = [UIImage imageNamed:@"1.jpg"];
    [self.view addSubview:redView];
    self.imgV = redView;
    
    
    
}

-(void)a:(UIButton *)btn{
    CATransition * animation = [CATransition  animation];
    animation.duration = 5;
    animation.fillMode = kCAFillModeForwards;
    animation.type = @"rippleEffect";
    //@"cube" @"moveIn" @"reveal" @"fade"(default) @"pageCurl" @"pageUnCurl" @"suckEffect" @"rippleEffect" @"oglFlip"
    //系统私有的动画但是可以安全使用，但是只能用字符串调用
    animation.subtype = kCATransitionFromTop;
    [self.imgV.layer addAnimation:animation forKey:@"ripple"];
    self.imgV.image = [UIImage imageNamed:@"2.jpg"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
