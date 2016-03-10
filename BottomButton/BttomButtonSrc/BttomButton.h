//
//  BttomButton.h
//  BottomButtonDeom
//
//  Created by bowen.liu on 16/3/9.
//  Copyright © 2016年 noOrganization. All rights reserved.
//

#import <UIKit/UIKit.h>

#define sqrt3 1.7320508  //根号3 省的每次都算

#define distance 100 

@protocol BttomButtonDelegate <NSObject>

- (void) tapbutton:(int) buttonTag;

@end

@interface BttomButton : UIView

@property (nonatomic,assign) BOOL isTaped;

@property (nonatomic,assign) CGRect totalViewFrame;

@property (nonatomic,assign) id<BttomButtonDelegate> delegate;

+ (BttomButton *) createBottomButtonWith:(CGRect)viewFrame;

/**
 *  主动收回
 */
- (void) hidenALLbtn;

@end
