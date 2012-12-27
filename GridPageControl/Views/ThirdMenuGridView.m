//
//  ThirdMenuGridView.m
//  GridPageControl
//
//  Created by Ömer Avci on 25.12.12.
//  Copyright (c) 2012 Ömer Avci. All rights reserved.
//

#import "ThirdMenuGridView.h"

@interface ThirdMenuGridView () {
    UIView *_redBox;
    UIView *_greenBox;
    UIView *_blueBox;
    UIView *_yellowBox;
    UIView *_orangeBox;
}
@end

@implementation ThirdMenuGridView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.menuNameLabel.text = @"ThirdMenu";
        self.menuNameLabel.backgroundColor = [UIColor orangeColor];
        
        // CGRectMake(X, Y, width, height)
        CGRect frameRed = CGRectMake(47, 51, 75, 75);
        CGRect frameGreen = CGRectMake(123, 51, 75, 75);
        CGRect frameBlue = CGRectMake(199, 51, 75, 75);
        
        CGRect frameYellow = CGRectMake(47, 127, 113, 112.5f);
        CGRect frameOrange = CGRectMake(161, 127, 113, 112.5f);
        
        _redBox = [[UIView alloc] initWithFrame:frameRed];
        _greenBox = [[UIView alloc] initWithFrame:frameGreen];
        _blueBox = [[UIView alloc] initWithFrame:frameBlue];
        _yellowBox = [[UIView alloc] initWithFrame:frameYellow];
        _orangeBox = [[UIView alloc] initWithFrame:frameOrange];
        
        _redBox.backgroundColor = [UIColor redColor];
        _greenBox.backgroundColor = [UIColor greenColor];
        _blueBox.backgroundColor = [UIColor blueColor];
        _yellowBox.backgroundColor = [UIColor yellowColor];
        _orangeBox.backgroundColor = [UIColor orangeColor];
        
        [self addSubview:_redBox];
        [self addSubview:_greenBox];
        [self addSubview:_blueBox];
        [self addSubview:_yellowBox];
        [self addSubview:_orangeBox];
    }
    return self;
}

@end
