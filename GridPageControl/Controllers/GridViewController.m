//
//  GridViewController.m
//  GridPageControl
//
//  Created by Ömer Avci on 24.12.12.
//  Copyright (c) 2012 Ömer Avci. All rights reserved.
//

#import "GridViewController.h"
#import "ColorViewController.h"

@interface GridViewController () {
    UIView *_redBox;
    UIView *_greenBox;
    UIView *_blueBox;
}

@end

@implementation GridViewController

- (id)init {
    self = [super init];
    if (self) {

        CGRect frameRed = CGRectMake(59.5f, 50, 100, 100);
        CGRect frameGreen = CGRectMake(160.5f, 50, 100, 100);
        CGRect frameBlue = CGRectMake(59.5f, 151, 201, 65);
        CGRect pageNumberFrame = CGRectMake(59.5f, 0, 200, 30);
        
        _redBox = [[UIView alloc] initWithFrame:frameRed];
        _greenBox = [[UIView alloc] initWithFrame:frameGreen];
        _blueBox = [[UIView alloc] initWithFrame:frameBlue];
        self.pageNumberLabel = [[UILabel alloc] initWithFrame:pageNumberFrame];
        
        _redBox.backgroundColor = [UIColor redColor];
        _greenBox.backgroundColor = [UIColor greenColor];
        _blueBox.backgroundColor = [UIColor blueColor];
        
        self.pageNumberLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:_redBox];
        [self.view addSubview:_greenBox];
        [self.view addSubview:_blueBox];
        [self.view addSubview:self.pageNumberLabel];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.pageNumberLabel.text = [NSString stringWithFormat:@"Page %d", self.pageNumber + 1];
    //self.view.backgroundColor = [ColorViewController pageControlColorWithIndex:self.pageNumber];
    self.view.backgroundColor = [UIColor orangeColor];
}

@end
