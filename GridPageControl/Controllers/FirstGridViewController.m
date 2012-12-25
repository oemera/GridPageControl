//
//  GridViewController.m
//  GridPageControl
//
//  Created by Ömer Avci on 24.12.12.
//  Copyright (c) 2012 Ömer Avci. All rights reserved.
//

#import "FirstGridViewController.h"
#import "FirstMenuGridView.h"

@interface FirstGridViewController () {
    FirstMenuGridView *_menu;
}
@end

@implementation FirstGridViewController

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _menu = [[FirstMenuGridView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:_menu];
    }
    return self;
}

- (id)init {
    return [self initWithFrame:CGRectNull];
}

@end
