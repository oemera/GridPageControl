//
//  MenuGridView.m
//  GridPageControl
//
//  Created by Ömer Avci on 25.12.12.
//  Copyright (c) 2012 Ömer Avci. All rights reserved.
//

#import "MenuGridView.h"

@implementation MenuGridView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat buttonWidth = 30;
        CGFloat buttonHeight = 30;
        CGRect backButtonFrame = CGRectMake(0, 0, buttonWidth, buttonHeight);
        CGRect forwardButtonFrame = CGRectMake(290, 0, buttonWidth, buttonHeight);
        CGPoint buttonCenter = CGPointMake((backButtonFrame.size.width / 2), (backButtonFrame.size.height / 2));
        
        _backButton = [[UIView alloc] initWithFrame:backButtonFrame];
        _forwardButton = [[UIView alloc] initWithFrame:forwardButtonFrame];
        
        UIImageView *arrowLeft = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow-left.png"]];
        UIImageView *arrowRight = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow-right.png"]];
        
        arrowLeft.center = buttonCenter;
        arrowRight.center = buttonCenter;
        
        [_backButton addSubview:arrowLeft];
        [_forwardButton addSubview:arrowRight];
        
        CGRect menuNameFrame = CGRectMake(0, 0, 320, 30);
        _menuNameLabel = [[UILabel alloc] initWithFrame:menuNameFrame];
        _menuNameLabel.textAlignment = NSTextAlignmentCenter;
        _menuNameLabel.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:_menuNameLabel];
        [self addSubview:_backButton];
        [self addSubview:_forwardButton];
    }
    return self;
}

@end
