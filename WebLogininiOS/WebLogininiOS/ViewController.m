//
//  ViewController.m
//  WebLogininiOS
//
//  Created by Sir-Anne-Blair on 16/6/24.
//  Copyright © 2016年 anne-blair. All rights reserved.
//

#import "ViewController.h"
#import "YYGUtil.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *unameText;
@property (weak, nonatomic) IBOutlet UITextField *upassText;

@end

@implementation ViewController
- (IBAction)registerTap:(UIButton *)sender
{
    //得到用户名和密码
    NSString * uname=self.unameText.text;
    NSString * upass=self.upassText.text;
    //剔除两端空格
    
    //有效性验证
    
    //注册
    //url
    NSString * strUrl=[NSString stringWithFormat:@"http://127.0.0.1/YYG/qqss/action_get.php?uname=%@&upass=%@&submit=register",uname,upass];
    NSLog(@"%@",strUrl);
    NSURL * url=[NSURL URLWithString:strUrl];
    //会话
    NSURLSession * session=[NSURLSession sharedSession];
    //任务
    NSURLSessionDataTask * task=[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"--%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        
        [self performSelectorOnMainThread:@selector(action:) withObject:data waitUntilDone:YES];   //把数据打到主线程，在UI界面上处理
    }];
    //启动任务
    [task resume];
    NSLog(@"this is main!!");
    /**
     *  如果是post下面是执行代码
     //post
     //得到用户名和密码
     NSString * uname=self.unameText.text;
     NSString * upass=self.upassText.text;
     //剔除两端空格
     
     //有效性验证
     
     //注册
     //url
     NSString * strUrl=[NSString stringWithFormat:@"http://127.0.0.1/YYG/qqss/action.php"];
     NSURL * url=[NSURL URLWithString:strUrl];
     //请求
     NSMutableURLRequest * request=[NSMutableURLRequest requestWithURL:url];
     //设置提交方式为post
     [request setHTTPMethod:@"post"];
     //设置提交参数
     NSString * strParameter=[NSString stringWithFormat:@"uname=%@&upass=%@&submit=register",uname,upass];
     NSLog(@"%@",strParameter);
     [request setHTTPBody:[strParameter dataUsingEncoding:NSUTF8StringEncoding]];
     NSURLSession * session=[NSURLSession sharedSession];
     NSURLSessionDataTask * task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
     NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
     [self performSelectorOnMainThread:@selector(action:) withObject:data waitUntilDone:YES];
     }];
     [task resume];
     NSLog(@"this is main!!");
     *
     */
}
-(void)action:(NSData *)data
{
    NSString * str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@...",str);
    if([str containsString:@"恭喜你，注册成功，你可以去登录了!!"])
    {
        
        [YYGUtil alertWithMessage:@"恭喜你，注册成功，你可以去登录了!" andViewController:self];
    }
    else if([str containsString:@"对不起！您要注册的用户已经存在，请更换用户名后再注册!!"])
    {
        [YYGUtil alertWithMessage:@"对不起！您要注册的用户已经存在，请更换用户名后再注册!" andViewController:self];
    }
    else
    {
        [YYGUtil alertWithMessage:@"对不起，注册失败，请稍候在试！" andViewController:self];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}



@end
