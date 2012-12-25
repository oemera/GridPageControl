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
        CGRect menuNameFrame = CGRectMake(0, 0, 320, 30);
        _menuNameLabel = [[UILabel alloc] initWithFrame:menuNameFrame];
        _menuNameLabel.textAlignment = NSTextAlignmentCenter;
        _menuNameLabel.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:_menuNameLabel];
    }
    return self;
}

@end
