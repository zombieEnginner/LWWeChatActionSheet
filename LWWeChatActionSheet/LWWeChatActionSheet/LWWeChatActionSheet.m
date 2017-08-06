//
//  LWWeChatActionSheet.m
//  LWWeChatActionSheet
//
//  Created by 李伟 on 2017/8/5.
//  Copyright © 2017年 李伟. All rights reserved.
//

#import "LWWeChatActionSheet.h"

@interface LWWeChatActionSheet()

LWWeChatActionSheetProperty(strong, UIWindow *, rootWindow)//弹出框的窗口
LWWeChatActionSheetProperty(strong, UIView *, shadowView)//弹出框阴影部分视图
LWWeChatActionSheetProperty(strong, UIView *, contentView)//弹出框显示界面的全部视图
LWWeChatActionSheetProperty(strong, UIScrollView *, scrollView)//一定数量后可滚动的视图
LWWeChatActionSheetProperty(strong, UIView *, titleView)//放置标题的view
LWWeChatActionSheetProperty(strong, UILabel *, titleLabel)//标题控件label
LWWeChatActionSheetProperty(strong, UIButton *, cancelBtn)//取消按钮控件

@end

@implementation LWWeChatActionSheet

LWWeChatActionSheetPropSetFuncImplementation(LWWeChatActionSheet, NSArray *, contentTitles);
LWWeChatActionSheetPropSetFuncImplementation(LWWeChatActionSheet, NSString *, title);
LWWeChatActionSheetPropSetFuncImplementation(LWWeChatActionSheet, NSString *, cancleButtonTitle);
LWWeChatActionSheetPropSetFuncImplementation(LWWeChatActionSheet, UIColor *, cancelBtnTextColor);
LWWeChatActionSheetPropSetFuncImplementation(LWWeChatActionSheet, UIFont *, cancelBtnTextFont);
LWWeChatActionSheetPropSetFuncImplementation(LWWeChatActionSheet, UIColor *, contentBtnTextColor);
LWWeChatActionSheetPropSetFuncImplementation(LWWeChatActionSheet, UIFont *, contentBtnTextFont);
LWWeChatActionSheetPropSetFuncImplementation(LWWeChatActionSheet, UIColor *, titleTextColor);
LWWeChatActionSheetPropSetFuncImplementation(LWWeChatActionSheet, UIFont *, titleTextFont);
LWWeChatActionSheetPropSetFuncImplementation(LWWeChatActionSheet, BOOL, actionSheetAllBtnNotEnabled)
LWWeChatActionSheetPropSetFuncImplementation(LWWeChatActionSheet, NSArray *, actionSheetBtnNotEnabledIndex)

#pragma mark - 懒加载

- (UIWindow *)rootWindow
{
    if (_rootWindow == nil) {
        _rootWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _rootWindow.windowLevel       = UIWindowLevelStatusBar;
        _rootWindow.backgroundColor   = [UIColor clearColor];
        _rootWindow.hidden = NO;
    }
    return _rootWindow;
}

- (UIView *)shadowView
{
    if (!_shadowView) {
        _shadowView = [[UIView alloc] init];
        [_shadowView setAlpha:0];
        [_shadowView setUserInteractionEnabled:NO];
        [_shadowView setFrame:(CGRect){0, 0, LWWeChatActionSheet_SCREEN_SIZE}];
        [_shadowView setBackgroundColor:LWWeChatActionSheet_Color(46, 49, 50)];
    }
    return _shadowView;
}

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        [_contentView setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.7]];
    }
    return _contentView;
}

- (UIView *)titleView
{
    if (!_titleView) {
        _titleView = [[UIView alloc] init];
        _titleView.backgroundColor = [UIColor whiteColor];
    }
    return _titleView;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

#pragma mark - init
- (instancetype)init
{
    if (self = [super init]) {
        [self config];
    }
    return self;
}

#pragma mark - 初始化配置
- (void)config
{
    self.cancelBtnTextColor = LWWeChatActionSheet_Color(255, 0, 30);
    self.cancelBtnTextFont = [UIFont systemFontOfSize:16];
    self.contentBtnTextColor = [UIColor grayColor];
    self.contentBtnTextFont = [UIFont systemFontOfSize:15];
    self.titleTextColor = [UIColor grayColor];
    self.titleTextFont = [UIFont systemFontOfSize:13];
    self.cancleButtonTitle = @"取消";
    self.actionSheetAllBtnNotEnabled = NO;
}

#pragma mark - 初始化UI
- (void)UI
{
    [self setFrame:(CGRect){0, 0, LWWeChatActionSheet_SCREEN_SIZE}];
    //阴影
    [self addSubview:self.shadowView];
    
    //标题
    if (self.title) {
        CGFloat titleLabelWidth = LWWeChatActionSheet_SCREEN_SIZE.width-40;
        CGSize contentSize = [self.title boundingRectWithSize:CGSizeMake(titleLabelWidth, MAXFLOAT)
                                                      options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                   attributes:@{NSFontAttributeName : self.titleTextFont}
                                                      context:nil].size;
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((LWWeChatActionSheet_SCREEN_SIZE.width-titleLabelWidth)/2, LWWeChatActionSheet_Title_top_H, titleLabelWidth, contentSize.height)];
        self.titleLabel.text = self.title;
        [self.titleLabel setBackgroundColor:[UIColor whiteColor]];
        self.titleLabel.textColor = self.titleTextColor;
        self.titleLabel.font = self.titleTextFont;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.numberOfLines = 0;
        [self.titleView addSubview:self.titleLabel];
        
        self.titleView.frame = CGRectMake(0, 0, LWWeChatActionSheet_SCREEN_SIZE.width, LWWeChatActionSheet_Title_top_H * 2 + contentSize.height);
        [self.contentView addSubview:self.titleView];
    }
    
    //按钮
    NSString *bundlePath = [[NSBundle bundleForClass:self.class] pathForResource:@"LWWeChatActionSheet" ofType:@"bundle"];
    if (self.contentTitles) {
        for (int i = 0; i < self.contentTitles.count; i++) {
            UIButton *btn = [[UIButton alloc] init];
            [btn setTag:i+LWWeChatActionSheet_BTN_TAG];
            [btn setBackgroundColor:[UIColor whiteColor]];
            [btn setTitle:self.contentTitles[i] forState:UIControlStateNormal];
            [[btn titleLabel] setFont:self.contentBtnTextFont];
            [btn setTitleColor:self.contentBtnTextColor forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
            [btn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
            
            if (self.actionSheetAllBtnNotEnabled) {
                btn.enabled = NO;
                btn.titleLabel.alpha = 0.7;
            } else {
                btn.enabled = YES;
                btn.titleLabel.alpha = 1.0;
            }
            
            CGFloat y = LWWeChatActionSheet_BUTTON_H * i;
            [btn setFrame:CGRectMake(0, y, LWWeChatActionSheet_SCREEN_SIZE.width, LWWeChatActionSheet_BUTTON_H)];
            [self.scrollView addSubview:btn];
            
            NSString *linePath = [bundlePath stringByAppendingPathComponent:@"cellLine@2x.png"];
            UIImage *lineImage = [UIImage imageWithContentsOfFile:linePath];
            
            // 功能按钮的分割线条
            UIImageView *line = [[UIImageView alloc] init];
            [line setImage:lineImage];
            [line setContentMode:UIViewContentModeTop];
            CGFloat lineY = LWWeChatActionSheet_BUTTON_H * i;
            if (i == 0) {
                line.hidden = YES;
            }
            [line setFrame:CGRectMake(0, lineY, LWWeChatActionSheet_SCREEN_SIZE.width, 1.0f)];
            [self.scrollView addSubview:line];
        }
        self.scrollView.contentSize = CGSizeMake(0, self.contentTitles.count * LWWeChatActionSheet_BUTTON_H);
        
        if (self.actionSheetBtnNotEnabledIndex.count > 0) {
            for (int i = 0; i < self.actionSheetBtnNotEnabledIndex.count; i++) {
                UIButton *btn = [self.scrollView viewWithTag:[self.actionSheetBtnNotEnabledIndex[i] integerValue]+LWWeChatActionSheet_BTN_TAG];
                btn.titleLabel.alpha = 0.7;
                btn.enabled = NO;
            }
        }
    }
    
    
    CGFloat height = 0;
    if (self.title) {
        height = self.titleView.frame.size.height + self.scrollView.contentSize.height + LWWeChatActionSheet_space + LWWeChatActionSheet_BUTTON_H;
        self.scrollView.frame = CGRectMake(0, CGRectGetMaxY(self.titleView.frame), LWWeChatActionSheet_SCREEN_SIZE.width, self.scrollView.contentSize.height);
    } else {
        height = self.scrollView.contentSize.height + LWWeChatActionSheet_BUTTON_H + LWWeChatActionSheet_space;
        self.scrollView.frame = CGRectMake(0, 0, LWWeChatActionSheet_SCREEN_SIZE.width, self.scrollView.contentSize.height);
    }
    
    if (height + 64 >= LWWeChatActionSheet_SCREEN_SIZE.height) {
        self.contentView.frame = CGRectMake(0, LWWeChatActionSheet_SCREEN_SIZE.height, LWWeChatActionSheet_SCREEN_SIZE.width, LWWeChatActionSheet_SCREEN_SIZE.height-64);
        self.scrollView.frame = CGRectMake(0, self.scrollView.frame.origin.y, LWWeChatActionSheet_SCREEN_SIZE.width, LWWeChatActionSheet_SCREEN_SIZE.height-64-self.titleView.frame.size.height-LWWeChatActionSheet_space-LWWeChatActionSheet_BUTTON_H);
    } else {
        self.contentView.frame = CGRectMake(0, LWWeChatActionSheet_SCREEN_SIZE.height, LWWeChatActionSheet_SCREEN_SIZE.width, height);
    }
    
    // 取消按钮
    self.cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0 , CGRectGetMaxY(self.scrollView.frame)+LWWeChatActionSheet_space, LWWeChatActionSheet_SCREEN_SIZE.width,LWWeChatActionSheet_BUTTON_H)];
    [self.cancelBtn setTag:-100];
    [self.cancelBtn setTitle:self.cancleButtonTitle forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:self.cancelBtnTextColor forState:UIControlStateNormal];
    [self.cancelBtn setBackgroundColor:[UIColor whiteColor]];
    [self.cancelBtn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
    [[self.cancelBtn titleLabel] setFont:self.cancelBtnTextFont];
    [self.contentView addSubview: self.cancelBtn];
    
    [self.contentView addSubview:self.scrollView];
    [self addSubview:self.contentView];
}

#pragma mark - 按钮点击
- (void)didClick:(UIButton *)btn
{
    [self dismiss:nil];
    
    //取消按钮
    if (btn && btn.tag == -100) {
        return;
    }
    
    if (self.actionSheetBlock) {
        self.actionSheetBlock(btn.tag-LWWeChatActionSheet_BTN_TAG);
    }
}

#pragma mark - 展示show
- (LWWeChatActionSheet * (^)())show
{
    return ^id(){
        
        [self UI];
        
        self.rootWindow.hidden = NO;
        [self.rootWindow addSubview:self];
        
        [UIView animateWithDuration:LWWeChatActionSheet_DEFAULT_ANIMATION_DURATION delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
            
            [self.shadowView setAlpha:LWWeChatActionSheet_DEFAULT_ANIMATION_DURATION];
            [self.shadowView setUserInteractionEnabled:YES];
            [self.shadowView addGestureRecognizer:singleTap];
    
            CGRect frame = self.contentView.frame;
            frame.origin.y -= frame.size.height;
            [self.contentView setFrame:frame];
            
        } completion:nil];
        return self;
    };
}

#pragma mark - 退出弹框
- (void)dismiss:(UITapGestureRecognizer *)tap
{
    [UIView animateWithDuration:LWWeChatActionSheet_DEFAULT_ANIMATION_DURATION delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self.shadowView setAlpha:0];
        [self.shadowView setUserInteractionEnabled:NO];
        
        CGRect frame = self.contentView.frame;
        frame.origin.y += frame.size.height;
        [self.contentView setFrame:frame];
        
    } completion:^(BOOL finished){
        [self removeFromSuperview];
        self.rootWindow.hidden = YES;
    }];
}

@end
