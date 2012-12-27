//
//  GridViewController.h
//  GridPageControl
//
//  Created by Ömer Avci on 25.12.12.
//  Copyright (c) 2012 Ömer Avci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuGridView.h"

@interface GridViewController : UIViewController {

@protected
    MenuGridView *_menuGrid;
}

@property (nonatomic, assign) int pageNumber;
@property (nonatomic, readonly) MenuGridView *menuGrid;

- (id)initWithFrame:(CGRect)frame;

@end
