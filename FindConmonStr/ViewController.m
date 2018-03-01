//
//  ViewController.m
//  FindConmonStr
//
//  Created by 马海平 on 2018/3/1.
//  Copyright © 2018年 马海平. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tf1;
@property (weak, nonatomic) IBOutlet UITextField *tf2;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)doneBtnClick:(UIButton *)sender {
    if (_tf1.text.length > 0 && _tf2.text.length > 0) {
        NSString * maxStr = [self findMaxSubString:_tf1.text String2:_tf2.text];
        _resultLabel.text = [NSString stringWithFormat:@"最大子串为：%@",maxStr];
    }else{
        NSLog(@"请输入要比较的字符串");
    }
}
- (NSString *)findMaxSubString:(NSString *)str1 String2:(NSString *)str2{
    //    首先找到长度较小的字符串 保证string1<string2
    NSString *temp;
    if ([str1 length]>[str2 length]) {
        temp=str1;
        str1=str2;
        str2=temp;
    }
    long length1=[str1 length];
    //    然后从长到短获取string1的子字符串,去string2中找,如果包含,则返回该子字符串,否则再找
    NSRange range=NSMakeRange(0, length1);
    while (![str2 containsString:[str1 substringWithRange:range]]&&range.location<=length1-1&&range.length>=1) {//如果string2不包含目前的子串并且没有越界
        
        //        判断下一步操作
        if (range.location<length1-range.length) {//不需要减length
            range.location++;
        }else{
            range.length--;
            range.location=0;
        }
    }
    //    最后判断并返回子串
    if (range.length==0) {
        NSLog(@"没有找到公共子字符串!");
        return nil;
    }else{
        NSLog(@"找到了");
        return [str1 substringWithRange:range];
    }
}



















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
