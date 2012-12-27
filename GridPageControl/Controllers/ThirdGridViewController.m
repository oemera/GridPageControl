//
//  ThirdGridViewController.m
//  GridPageControl
//
//  Created by Ömer Avci on 25.12.12.
//  Copyright (c) 2012 Ömer Avci. All rights reserved.
//

#import "ThirdGridViewController.h"
#import "ThirdMenuGridView.h"

@interface ThirdGridViewController () {
    ThirdMenuGridView *_menu;
}
@end

@implementation ThirdGridViewController

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _menuGrid = [[ThirdMenuGridView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:_menuGrid];
    }
    return self;
}

- (id)init {
    return [self initWithFrame:CGRectNull];
}

@end
