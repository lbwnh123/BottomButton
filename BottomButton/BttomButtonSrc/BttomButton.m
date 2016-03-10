//
//  BttomButton.m
//  BottomButtonDeom
//
//  Created by bowen.liu on 16/3/9.
//  Copyright © 2016年 noOrganization. All rights reserved.
//

#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#import "BttomButton.h"


@interface BttomButton()
{
    UIButton * _mainBtn;
    
    UIButton * _firstBtn;
    
    UIButton * _secBtn;
    
    UIButton * _thirdBtn;

}

@property (nonatomic,strong) NSMutableArray * arrayM ;

@end

BttomButton * _mainView;

int animalCount = 0;

@implementation BttomButton

+ (BttomButton *) createBottomButtonWith:(CGRect)viewFrame
{
    _mainView = [[BttomButton alloc] initWithFrame:viewFrame];
    
    _mainView.totalViewFrame = viewFrame ;

    [_mainView setupMainBtn:viewFrame];
    
    [_mainView setupfirstBtn:viewFrame];
    
    [_mainView setupSecBtn:viewFrame];
    
    [_mainView setupThirdBtn:viewFrame];
    
    [_mainView allbtnHidden];
    
    _mainView.isTaped = NO;
    
    return _mainView;
}

- (void) mainBtnSelected
{
    
    if (self.isTaped == NO) { //弹出其余按键
        
    CGRect mainViewRect = CGRectMake(_mainView.totalViewFrame.origin.x, _mainView.totalViewFrame.origin.y-distance, _mainView.totalViewFrame.size.width+distance, _mainView.totalViewFrame.size.height+distance);
        _mainView.frame = mainViewRect;
        
        [self allbtnShow];
        _mainBtn.frame = CGRectMake(0, distance, _mainView.totalViewFrame.size.width, _mainView.totalViewFrame.size.height);
        
        [self followCenterPoint];
        
        [self addAnimation:_firstBtn form:_mainBtn.center To:_firstBtn.center];
        
        [self addAnimation:_secBtn form:_mainBtn.center To:_secBtn.center];
        
        [self addAnimation:_thirdBtn form:_mainBtn.center To:_thirdBtn.center];
        
        [self mainBtnScaleOpen];
        
        self.isTaped = YES;
    
    } else { //收回其余按键
        
        [self mainBtnScaleClose];
        [self hidenALLbtn];
    }

}

- (void) hidenALLbtn
{
    
    if (self.isTaped == NO) {
        return;
    }
    _mainView.frame = _mainView.totalViewFrame;
    
    _mainBtn.frame = CGRectMake(0, 0, _mainView.totalViewFrame.size.width, _mainView.totalViewFrame.size.height);
    
    [self followCenterPoint];
    
    [self removeAnimation:_firstBtn form:_firstBtn.center To:_mainBtn.center ];
    
    [self removeAnimation:_secBtn form:_secBtn.center To:_mainBtn.center ];
    
    [self removeAnimation:_thirdBtn form:_thirdBtn.center To:_mainBtn.center ];

    self.isTaped = NO;
}

- (void) otherBtn:(UIButton *) button
{
    [self.delegate tapbutton:(int)button.tag];
}

- (void) setupMainBtn:(CGRect)viewFrame
{
    
    _mainBtn = [[UIButton alloc] init];
    
    [_mainBtn addTarget:self action:@selector(mainBtnSelected) forControlEvents:UIControlEventTouchDown];
    
    _mainBtn.backgroundColor = RGB_COLOR(45, 146, 88);
    
    _mainBtn.layer.borderWidth = 5.0;
    
    _mainBtn.layer.borderColor = RGB_COLOR(195, 193, 198).CGColor;
    
    _mainBtn.layer.masksToBounds = YES;
    
    _mainBtn.layer.cornerRadius = viewFrame.size.width*0.5;
    
    _mainBtn.frame = CGRectMake(0, 0, viewFrame.size.width, viewFrame.size.height);
    
    [_mainView addSubview:_mainBtn];
}

- (void) setupfirstBtn:(CGRect)viewFrame
{
    _firstBtn = [[UIButton alloc] init];
    
    [_firstBtn addTarget:self action:@selector(otherBtn:) forControlEvents:UIControlEventTouchDown];
    
    _firstBtn.tag = 1;
    
    _firstBtn.backgroundColor = RGB_COLOR(190, 0, 1);
    
    _firstBtn.layer.borderWidth = 5.0;
    
    _firstBtn.layer.borderColor = RGB_COLOR(195, 193, 198).CGColor;
    
    _firstBtn.layer.masksToBounds = YES;
    
    _firstBtn.layer.cornerRadius = viewFrame.size.width*0.5;
    
    _firstBtn.bounds = CGRectMake(0, 0, viewFrame.size.width, viewFrame.size.height);
    
    CGPoint mainPoint = _mainBtn.center;
    
    _firstBtn.center = CGPointMake(mainPoint.x+distance*0.5, mainPoint.y-distance*0.5*sqrt3);

    [_mainView addSubview:_firstBtn];
}

- (void) setupSecBtn:(CGRect)viewFrame
{
    _secBtn = [[UIButton alloc] init];
    
    [_secBtn addTarget:self action:@selector(otherBtn:) forControlEvents:UIControlEventTouchDown];
    
    _secBtn.tag = 2;
    
    _secBtn.backgroundColor = RGB_COLOR(100, 219, 255);
    
    _secBtn.layer.borderWidth = 5.0;
    
    _secBtn.layer.borderColor = RGB_COLOR(195, 193, 198).CGColor;
    
    _secBtn.layer.masksToBounds = YES;
    
    _secBtn.layer.cornerRadius = viewFrame.size.width*0.5;
    
    _secBtn.bounds = CGRectMake(0, 0, viewFrame.size.width, viewFrame.size.height);
    
    CGPoint mainPoint = _mainBtn.center;
    
    _secBtn.center = CGPointMake(mainPoint.x+distance*0.5*sqrt3, mainPoint.y-distance*0.5);

    [_mainView addSubview:_secBtn];
    
    
}

- (void) setupThirdBtn:(CGRect)viewFrame
{

    _thirdBtn = [[UIButton alloc] init];
    
    [_thirdBtn addTarget:self action:@selector(otherBtn:) forControlEvents:UIControlEventTouchDown];
    
    _thirdBtn.tag = 3;
    
    _thirdBtn.backgroundColor = RGB_COLOR(230, 223, 240);
    
    _thirdBtn.layer.borderWidth = 5.0;
    
    _thirdBtn.layer.borderColor = RGB_COLOR(195, 193, 198).CGColor;
    
    _thirdBtn.layer.masksToBounds = YES;
    
    _thirdBtn.layer.cornerRadius = viewFrame.size.width*0.5;
    
    _thirdBtn.bounds = CGRectMake(0, 0, viewFrame.size.width, viewFrame.size.height);
    
    CGPoint mainPoint = _mainBtn.center;
    
    _thirdBtn.center = CGPointMake(mainPoint.x+distance, mainPoint.y);
    
    [_mainView addSubview:_thirdBtn];
    
}

- (void) allbtnShow
{
    _firstBtn.hidden = NO;
    _secBtn.hidden = NO;
    _thirdBtn.hidden = NO;
}

- (void) allbtnHidden
{
    _firstBtn.hidden = YES;
    _secBtn.hidden = YES;
    _thirdBtn.hidden = YES;
}

- (void)followCenterPoint
{
    CGPoint mainPoint = _mainBtn.center;
    _thirdBtn.center = CGPointMake(mainPoint.x+distance, mainPoint.y);
    _secBtn.center = CGPointMake(mainPoint.x+distance*0.5*sqrt3, mainPoint.y-distance*0.5);
    _firstBtn.center = CGPointMake(mainPoint.x+distance*0.5, mainPoint.y-distance*0.5*sqrt3);
}

- (CAAnimationGroup *) addAnimation:(UIView *) btn form:(CGPoint ) staPoint To:(CGPoint) endPoint
{
    CGRect orginRect = btn.bounds;

    CAAnimationGroup * animaGroup = [CAAnimationGroup animation];
    
    CABasicAnimation * animationBounds = [CABasicAnimation animationWithKeyPath:@"bounds"];
    
    animationBounds.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 0, 0)];
    
    animationBounds.toValue = [NSValue valueWithCGRect:orginRect];
    
    CABasicAnimation * animationPosition = [CABasicAnimation animationWithKeyPath:@"position"];
    
    animationPosition.fromValue = [NSValue valueWithCGPoint:staPoint];
    
    animationPosition.toValue = [NSValue valueWithCGPoint:endPoint];
    
    animaGroup.animations = [NSArray arrayWithObjects:animationBounds,animationPosition, nil];
    
    animaGroup.delegate = self ;
    
    [btn.layer addAnimation:animaGroup forKey:nil];
//    [btn.layer addAnimation:animationPosition forKey:nil];
//    [btn.layer addAnimation:animationBounds forKey:nil];
    
    return animaGroup;
    
}


- (CAAnimationGroup *) removeAnimation:(UIView *) btn form:(CGPoint ) staPoint To:(CGPoint) endPoint
{
    CGRect orginRect = btn.bounds;
    
    CAAnimationGroup * animaGroup = [CAAnimationGroup animation];
    
    CABasicAnimation * animationBounds = [CABasicAnimation animationWithKeyPath:@"bounds"];
    
    animationBounds.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 0, 0)];
    
    animationBounds.fromValue = [NSValue valueWithCGRect:orginRect];
    
    CABasicAnimation * animationPosition = [CABasicAnimation animationWithKeyPath:@"position"];
    
    animationPosition.fromValue = [NSValue valueWithCGPoint:staPoint];
    
    animationPosition.toValue = [NSValue valueWithCGPoint:endPoint];
    
    animaGroup.animations = [NSArray arrayWithObjects:animationBounds,animationPosition, nil];
    
    animaGroup.delegate = self ;
    
    animaGroup.removedOnCompletion = NO;
    
    [btn.layer addAnimation:animaGroup forKey:nil];

    return animaGroup;
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    animalCount++;
    
    if (animalCount % 6 == 0 ) {
        [self allbtnHidden];
    }
}

- (void) mainBtnScaleOpen
{
    CABasicAnimation * baseScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    baseScaleAnimation.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2+M_PI_4, 1, 1, 0)];
    
    [_mainBtn.layer addAnimation:baseScaleAnimation forKey:nil];
}

- (void) mainBtnScaleClose
{
    CABasicAnimation * baseScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    baseScaleAnimation.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeRotation(-M_PI_2-M_PI_4, 1, 1, 0)];
    
    [_mainBtn.layer addAnimation:baseScaleAnimation forKey:nil];
}

@end
