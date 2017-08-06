//
//  LWWeChatActionSheet.h
//  LWWeChatActionSheet
//
//  Created by 李伟 on 2017/8/5.
//  Copyright © 2017年 李伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWWeChatActionSheetConfig.h"

typedef void(^LWWeChatActionSheetBlock) (NSInteger buttonIndex);

@interface LWWeChatActionSheet : UIView

LWWeChatActionSheetPropStatementAndFuncStatement(strong, LWWeChatActionSheet, NSArray *, contentTitles);//设置内部按钮标题
LWWeChatActionSheetPropStatementAndFuncStatement(strong, LWWeChatActionSheet, NSString *, title);//标题
LWWeChatActionSheetPropStatementAndFuncStatement(strong, LWWeChatActionSheet, NSString *, cancleButtonTitle);//取消按钮标题
LWWeChatActionSheetPropStatementAndFuncStatement(strong, LWWeChatActionSheet, UIColor *, cancelBtnTextColor);//取消按钮字的颜色，默认红色
LWWeChatActionSheetPropStatementAndFuncStatement(strong, LWWeChatActionSheet, UIFont *, cancelBtnTextFont);//取消按钮字体大小，默认16
LWWeChatActionSheetPropStatementAndFuncStatement(strong, LWWeChatActionSheet, UIColor *, contentBtnTextColor);//选项按钮字的颜色，默认灰色
LWWeChatActionSheetPropStatementAndFuncStatement(strong, LWWeChatActionSheet, UIFont *, contentBtnTextFont);//选项按钮字体大小，默认15
LWWeChatActionSheetPropStatementAndFuncStatement(strong, LWWeChatActionSheet, UIColor *, titleTextColor);//标题字的颜色，默认灰色
LWWeChatActionSheetPropStatementAndFuncStatement(strong, LWWeChatActionSheet, UIFont *, titleTextFont);//标题字体大小，默认13
LWWeChatActionSheetPropStatementAndFuncStatement(assign, LWWeChatActionSheet, BOOL, actionSheetAllBtnNotEnabled);//设置按钮全不能点击 默认能点击
LWWeChatActionSheetPropStatementAndFuncStatement(strong, LWWeChatActionSheet, NSArray *, actionSheetBtnNotEnabledIndex);//设置哪些按钮不可以点击
LWWeChatActionSheetFunction(copy, LWWeChatActionSheet, show);//展示界面

@property(nonatomic,assign)LWWeChatActionSheetBlock actionSheetBlock;

@end
