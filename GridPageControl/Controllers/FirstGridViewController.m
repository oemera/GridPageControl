//
//  GridViewController.m
//  GridPageControl
//
//  Created by Ömer Avci on 24.12.12.
//  Copyright (c) 2012 Ömer Avci. All rights reserved.
//

#import "FirstGridViewController.h"
#import "FirstMenuGridView.h"

@implementation FirstGridViewController

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _menuGrid = [[FirstMenuGridView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:_menuGrid];
    }
    return self;
}

- (id)init {
    return [self initWithFrame:CGRectNull];
}

@end
