//
//  SJVideoPlayerMoreSettingTwoSettingsColCell.m
//  SJVideoPlayerProject
//
//  Created by BlueDancer on 2017/9/25.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import "SJVideoPlayerMoreSettingTwoSettingsColCell.h"
#import "NSAttributedString+ZFBAdditon.h"
#import <Masonry/Masonry.h>
#import "UIView+SJExtension.h"
#import "SJVideoPlayerMoreSettingTwoSetting.h"

@interface SJVideoPlayerMoreSettingTwoSettingsColCell ()
@property (nonatomic, strong, readonly) UIButton *itemBtn;
@end

@implementation SJVideoPlayerMoreSettingTwoSettingsColCell

@synthesize itemBtn = _itemBtn;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if ( !self ) return nil;
    [self _SJVideoPlayerMoreSettingTwoSettingsCellSetupUI];
    return self;
}

- (void)clickedBtn:(UIButton *)btn {
    if ( self.model.clickedExeBlock ) self.model.clickedExeBlock(self.model);
}

- (void)setModel:(SJVideoPlayerMoreSettingTwoSetting *)model {
    _model = model;
    
    NSAttributedString *attr = [NSAttributedString mh_imageTextWithImage:model.image imageW:model.image.size.width imageH:model.image.size.height title:model.title ? model.title : @"" fontSize:[SJVideoPlayerMoreSetting titleFontSize] titleColor:[SJVideoPlayerMoreSetting titleColor] spacing:6];
    [_itemBtn setAttributedTitle:attr forState:UIControlStateNormal];
}

- (void)_SJVideoPlayerMoreSettingTwoSettingsCellSetupUI {
    [self.contentView addSubview:self.itemBtn];
    [_itemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}

- (UIButton *)itemBtn {
    if ( _itemBtn ) return _itemBtn;
    _itemBtn = [UIButton buttonWithImageName:@"" tag:0 target:self sel:@selector(clickedBtn:)];
    _itemBtn.titleLabel.numberOfLines = 3;
    _itemBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    return _itemBtn;
}

@end

