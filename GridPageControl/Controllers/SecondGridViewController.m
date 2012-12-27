//
//  SecondGridViewController.m
//  GridPageControl
//
//  Created by Ömer Avci on 25.12.12.
//  Copyright (c) 2012 Ömer Avci. All rights reserved.
//

#import "SecondGridViewController.h"
#import "SecondMenuGridView.h"

@implementation SecondGridViewController

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _menuGrid = [[SecondMenuGridView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:_menuGrid];
    }
    return self;
}

- (id)init {
    return [self initWithFrame:CGRectNull];
}

@end
