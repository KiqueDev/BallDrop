//
//  ViewController.m
//  BallDrop
//
//  Created by Enrique on 11/26/13.
//  Copyright (c) 2013 kiqueDev. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *ball1 = [[UIView alloc] initWithFrame:CGRectMake(50,0,100,100)];
    ball1.alpha = 0.5;
    ball1.layer.cornerRadius = 50;
    ball1.backgroundColor = [UIColor blueColor];
    
    UIView *ball2 = [[UIView alloc] initWithFrame:CGRectMake(90,0,20,20)];
    ball2.alpha = 0.5;
    ball2.layer.cornerRadius = 10;
    ball2.backgroundColor = [UIColor redColor];
    
    UIView *ball3 = [[UIView alloc] initWithFrame:CGRectMake(180,0,30,30)];
    ball3.alpha = 0.5;
    ball3.layer.cornerRadius = 15;
    ball3.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:ball1];
    [self addFallAnimationForLayer:ball1.layer];
    
    [self.view addSubview:ball2];
    [self addFallAnimationForLayer:ball2.layer];
    
    [self.view addSubview:ball3];
    [self addFallAnimationForLayer:ball3.layer];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addFallAnimationForLayer:(CALayer *)layer{
    NSString *keyPath = @"transform.translation.y";
    CAKeyframeAnimation *translation = [CAKeyframeAnimation animationWithKeyPath:keyPath];

    translation.duration = 1;
    translation.repeatCount = HUGE_VALF;

    NSMutableArray *timingFunctions = [[NSMutableArray alloc] init];
    [timingFunctions addObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    translation.timingFunctions = timingFunctions;
    
    translation.autoreverses = YES;
    
    CGFloat height = [[UIScreen mainScreen] applicationFrame].size.height - layer.frame.size.height;
    [translation setValues:[NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0f],[NSNumber numberWithFloat:height], nil]];

    [layer addAnimation:translation forKey:keyPath];
    
}

@end
