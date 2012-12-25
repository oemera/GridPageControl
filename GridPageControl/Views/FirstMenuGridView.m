//
//  FirstMenuGridView.m
//  GridPageControl
//
//  Created by Ömer Avci on 25.12.12.
//  Copyright (c) 2012 Ömer Avci. All rights reserved.
//

#import "FirstMenuGridView.h"

@interface FirstMenuGridView () {
    UIView *_redBox;
    UIView *_greenBox;
    UIView *_blueBox;
}
@end

@implementation FirstMenuGridView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.menuNameLabel.text = @"FirstMenu";
        self.menuNameLabel.backgroundColor = [UIColor blueColor];
        
        CGRect frameRed = CGRectMake(59.5f, 60, 100, 100);
        CGRect frameGreen = CGRectMake(160.5f, 60, 100, 100);
        CGRect frameBlue = CGRectMake(59.5f, 161, 201, 65);
        
        _redBox = [[UIView alloc] initWithFrame:frameRed];
        _greenBox = [[UIView alloc] initWithFrame:frameGreen];
        _blueBox = [[UIView alloc] initWithFrame:frameBlue];
        
        _redBox.backgroundColor = [UIColor redColor];
        _greenBox.backgroundColor = [UIColor greenColor];
        _blueBox.backgroundColor = [UIColor blueColor];
        
        [self addSubview:_redBox];
        [self addSubview:_greenBox];
        [self addSubview:_blueBox];
    }
    return self;
}

@end
