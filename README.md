# LWWeChatActionSheet
链式语法微信弹框
<br>
<img height="559" width = "309" src="https://github.com/zombieEnginner/LWWeChatActionSheet/blob/master/效果.gif"/>

## 用法
```objc
  LWWeChatActionSheet *sheet = [[LWWeChatActionSheet alloc] init];
    sheet.contentTitlesSet(@[@"分享到微信",@"QQ",@"分享到空间",@"打开相册",@"照相机"])
    .titleSet(@"选择下面的选项")
    .show()
    .actionSheetBlock = ^(NSInteger buttonIndex) {
        NSLog(@"点击了第%ld个",buttonIndex);
    };
```
