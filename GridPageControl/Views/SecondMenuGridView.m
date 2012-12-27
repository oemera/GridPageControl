//
//  SecondMenuGridView.m
//  GridPageControl
//
//  Created by Ömer Avci on 25.12.12.
//  Copyright (c) 2012 Ömer Avci. All rights reserved.
//

#import "SecondMenuGridView.h"

@interface SecondMenuGridView () {
    UIView *_redBox;
    UIView *_greenBox;
    UIView *_blueBox;
    UIView *_yellowBox;
}
@end

@implementation SecondMenuGridView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.menuNameLabel.text = @"SecondMenu";
        
        // CGRectMake(X, Y, width, height)
        CGRect frameRed = CGRectMake(59.5f, 45, 100, 100);
        CGRect frameGreen = CGRectMake(160.5f, 45, 100, 100);
        CGRect frameBlue = CGRectMake(59.5f, 146, 100, 100);
        CGRect frameYellow = CGRectMake(160.5f, 146, 100, 100);
        
        _redBox = [[UIView alloc] initWithFrame:frameRed];
        _greenBox = [[UIView alloc] initWithFrame:frameGreen];
        _blueBox = [[UIView alloc] initWithFrame:frameBlue];
        _yellowBox = [[UIView alloc] initWithFrame:frameYellow];
        
        _redBox.backgroundColor = [UIColor redColor];
        _greenBox.backgroundColor = [UIColor greenColor];
        _blueBox.backgroundColor = [UIColor blueColor];
        _yellowBox.backgroundColor = [UIColor yellowColor];
        
        [self addSubview:_redBox];
        [self addSubview:_greenBox];
        [self addSubview:_blueBox];
        [self addSubview:_yellowBox];
    }
    return self;
}

@end
