//
//  YYGUtil.m
//  WebLogininiOS
//
//  Created by Sir-Anne-Blair on 16/6/24.
//  Copyright © 2016年 anne-blair. All rights reserved.
//

#import "YYGUtil.h"

@implementation YYGUtil
+(NSString *)documentPath
{
    NSString * homePath=NSHomeDirectory();
    NSString * docPath=[homePath stringByAppendingPathComponent:@"Documents"];
    return docPath;
}
+(void)alertWithMessage:(NSString *)_msg andViewController:(UIViewController *)_vc
{
    UIAlertController * alertC=[UIAlertController alertControllerWithTitle:@"小赢提示" message:_msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * closeAction=[UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleCancel handler:nil];
    [alertC addAction:closeAction];
    [_vc presentViewController:alertC animated:YES completion:nil];
}
@end
