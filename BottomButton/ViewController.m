//
//  ViewController.m
//  BottomButton
//
//  Created by bowen.liu on 16/3/9.
//  Copyright © 2016年 noOrganization. All rights reserved.
//

#import "ViewController.h"
#import "BttomButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    CGRect  rectBtn = CGRectMake(50, 200, 50, 50);
    
    BttomButton * btn = [BttomButton createBottomButtonWith:rectBtn];
    
    btn.delegate = self;
    
    [self.view addSubview:btn];
    
}

- (void) tapbutton:(int) buttonTag
{
    NSString * str = [NSString stringWithFormat:@"按键是  %d",buttonTag];
    
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:str delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [alertView show];

}

@end
