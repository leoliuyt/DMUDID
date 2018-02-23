//
//  ViewController.m
//  DMUDID
//
//  Created by lbq on 2018/2/23.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "ViewController.h"
#import <AdSupport/AdSupport.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self test1];
    [self test2];
    [self test3];
}

// IDFA
- (void)test1
{
    NSString *idfa = [ASIdentifierManager sharedManager].advertisingIdentifier.UUIDString;
    BOOL istracking = [ASIdentifierManager sharedManager].isAdvertisingTrackingEnabled;
    NSString *str = self.textView.text;
    self.textView.text = [NSString stringWithFormat:@"%@\nidfa=%@,istracking=%tu",str,idfa,istracking];
//    结论：可通过 隐私->广告->限制广告跟踪 这个开关改变标识符 开关打开会变成00000000-0000-0000-0000-000000000000
//    隐私->广告->还原广告标识符 会改变标识符的值
//    删除应用重新安装 标识符不会改变 不同应用对应的idfa是相同的值

}

- (void)test2
{
    NSString *idfv = [UIDevice currentDevice].identifierForVendor.UUIDString;
    NSString *str = self.textView.text;
    self.textView.text = [NSString stringWithFormat:@"%@\nidfv=%@",str,idfv];
//    结论：只要用户的设备中没有卸载当前 Vendor 的所有 APP，则不会发生变化，都卸载后再重新安装会发生变化
}

- (void)test3
{
    NSString *udid = [NSUUID UUID].UUIDString;
    NSString *str = self.textView.text;
    self.textView.text = [NSString stringWithFormat:@"%@\nuuid=%@",str,udid];
    //结论：每次调用都返回不同的值
}
@end
