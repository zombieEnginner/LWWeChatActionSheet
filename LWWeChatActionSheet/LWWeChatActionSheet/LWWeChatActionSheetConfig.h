//
//  LWWeChatActionSheetConfig.h
//  LWWeChatActionSheet
//
//  Created by 李伟 on 2017/8/5.
//  Copyright © 2017年 李伟. All rights reserved.
//

#ifndef LWWeChatActionSheetConfig_h
#define LWWeChatActionSheetConfig_h

//视图大小
#define LWWeChatActionSheet_SCREEN_SIZE [UIScreen mainScreen].bounds.size
// 颜色
#define LWWeChatActionSheet_Color(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]
// 动画时长
#define LWWeChatActionSheet_DEFAULT_ANIMATION_DURATION 0.3f
//标题label 距上下多少
#define LWWeChatActionSheet_Title_top_H 10.0f
//btnTag
#define LWWeChatActionSheet_BTN_TAG 999
// 按钮高度
#define LWWeChatActionSheet_BUTTON_H 44.0f
//下面的间隙空白
#define LWWeChatActionSheet_space 5.0f

/* 距离底部的高度 */
#define  kBottomHeight (iPhoneX_After ? 34 : 0)
#define iPhoneX_After ([UIApplication sharedApplication].statusBarFrame.size.height == 44 ? YES :NO)

#define LWWeChatActionSheetPropStatementAndFuncStatement(propertyModifyWord,className, propertyPointerType, propertyName)                \
@property(nonatomic,propertyModifyWord)propertyPointerType  propertyName;                                               \
- (className * (^) (propertyPointerType propertyName)) propertyName##Set;

#define LWWeChatActionSheetPropSetFuncImplementation(className, propertyPointerType, propertyName)                                       \
- (className * (^) (propertyPointerType propertyName))propertyName##Set{                                                \
return ^(propertyPointerType propertyName) {                                                                            \
self.propertyName = propertyName;                                                                                       \
return self;                                                                                                            \
};                                                                                                                      \
}

#define LWWeChatActionSheetProperty(propertyModifyWord, propertyPointerType, propertyName)    \
@property(nonatomic,propertyModifyWord)propertyPointerType  propertyName;             \

#define LWWeChatActionSheetFunction(propertyModifyWord, className, functionName)  \
@property(nonatomic,propertyModifyWord)className *(^functionName)();

#endif /* LWWeChatActionSheetConfig_h */
