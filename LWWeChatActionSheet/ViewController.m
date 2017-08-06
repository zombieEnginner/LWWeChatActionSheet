//
//  ViewController.m
//  LWWeChatActionSheet
//
//  Created by 李伟 on 2017/8/5.
//  Copyright © 2017年 李伟. All rights reserved.
//

#import "ViewController.h"
#import "LWWeChatActionSheet.h"

@interface ViewController ()

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

- (IBAction)click1:(id)sender {
    LWWeChatActionSheet *sheet = [[LWWeChatActionSheet alloc] init];
    sheet.contentTitlesSet(@[@"分享到微信",@"QQ",@"分享到空间",@"打开相册",@"照相机"])
    .titleSet(@"选择下面的选项")
    .show()
    .actionSheetBlock = ^(NSInteger buttonIndex) {
        NSLog(@"点击了第%ld个",buttonIndex);
    };
}
- (IBAction)click12:(id)sender {
    LWWeChatActionSheet *sheet = [[LWWeChatActionSheet alloc] init];
    sheet.contentTitlesSet(@[@"分享到微信",@"QQ",@"分享到空间",@"打开相册",@"照相机"])
    .show()
    .actionSheetBlock = ^(NSInteger buttonIndex) {
        NSLog(@"点击了第%ld个",buttonIndex);
    };
}
- (IBAction)click13:(id)sender {
    LWWeChatActionSheet *sheet = [[LWWeChatActionSheet alloc] init];
    sheet.contentTitlesSet(@[@"分享到微信",@"QQ",@"分享到空间",@"打开相册",@"照相机"])
    .actionSheetAllBtnNotEnabledSet(YES)
    .show()
    .actionSheetBlock = ^(NSInteger buttonIndex) {
        NSLog(@"点击了第%ld个",buttonIndex);
    };
}
- (IBAction)click14:(id)sender {
    LWWeChatActionSheet *sheet = [[LWWeChatActionSheet alloc] init];
    sheet.contentTitlesSet(@[@"我能点击",@"我能点击",@"我不能点击",@"我能点击",@"我不能点击"])
    .actionSheetBtnNotEnabledIndexSet(@[@2,@4])
    .show()
    .actionSheetBlock = ^(NSInteger buttonIndex) {
        NSLog(@"点击了第%ld个",buttonIndex);
    };
    
}

- (IBAction)click15:(id)sender {
    LWWeChatActionSheet *sheet = [[LWWeChatActionSheet alloc] init];
    sheet.contentTitlesSet(@[@"分享到微信",@"QQ",@"分享到空间",@"打开相册",@"照相机",@"微博",@"简书",@"淘宝",@"京东",@"马化腾",@"马云",@"马克思",@"刘强东",@"我就是我",@"哈哈",@"呵呵呵呵呵",@"啦啦啦啦啦"])
    .titleSet(@"我是标题，本微信弹出框是链式语法写的，标题是自适应高度的，不用担心字数过多而显示不下的问题,标题颜色和字体大小都可以设置")
    .titleTextColorSet([UIColor redColor])
    .cancelBtnTextColorSet([UIColor blueColor])
    .cancleButtonTitleSet(@"我要取消你")
    .show()
    .actionSheetBlock = ^(NSInteger buttonIndex) {
        NSLog(@"点击了第%ld个",buttonIndex);
    };
}

- (IBAction)click16:(id)sender {
    
}
@end
