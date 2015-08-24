//
//  ViewController.m
//  TQRichTextViewDemo
//
//  Created by snrifk on 15/8/24.
//  Copyright (c) 2015年 sbpdcfn. All rights reserved.
//  最近项目需用到表情解析，我使用了作者TinyQ的富文本编辑库，发现最新的这个版本有一点小bug，现在临时解决，供其它朋友参考！
//  解决首行表情顶部显示不完整
//  临时解决连续表情显示不全的问题
//  在此感谢作者TinyQ的供献https://github.com/TinyQ

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view .backgroundColor = [UIColor whiteColor];
    NSString *string = @"[cry][smile][cry]32[cry]32[cry]";
    
    CGRect rect = [TQRichTextView boundingRectWithSize:CGSizeMake(320, 500) font:[UIFont systemFontOfSize:13] string:string lineSpace:1.0f];
    
    NSLog(@"%@",NSStringFromCGRect(rect));
    
    TQRichTextView *textView = [[TQRichTextView alloc] initWithFrame:CGRectMake(0, 20, rect.size.width, rect.size.height)];
    textView.text = string;
    textView.lineSpace = 1.0f;
    textView.font = [UIFont systemFontOfSize:13.0f];
    textView.backgroundColor = [UIColor grayColor];
    textView.delegage = self;
    
    [self.view addSubview:textView];
    
}

- (void)richTextView:(TQRichTextView *)view touchBeginRun:(TQRichTextRun *)run
{
    
}

- (void)richTextView:(TQRichTextView *)view touchEndRun:(TQRichTextRun *)run
{
    if ([run isKindOfClass:[TQRichTextRunURL class]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:run.text]];
    }
    
    NSLog(@"%@",run.text);
}

@end
