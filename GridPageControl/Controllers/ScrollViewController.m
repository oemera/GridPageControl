//
//  ScrollViewController.m
//  GridPageControl
//
//  Created by Ömer Avci on 23.12.12.
//  Copyright (c) 2012 Ömer Avci. All rights reserved.
//

#import "ScrollViewController.h"
#import "GridViewController.h"
#import "FirstGridViewController.h"
#import "SecondGridViewController.h"
#import "ThirdGridViewController.h"

static NSUInteger kNumberOfPages = 3;

@interface ScrollViewController () {
    BOOL pageControlUsed;
}

- (void)loadScrollViewWithPage:(int)page;
- (void)scrollViewDidScroll:(UIScrollView *)sender;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// view controllers are created lazily
    // in the meantime, load the array with placeholders which will be replaced on demand
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < kNumberOfPages; i++) {
        [controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;
	
    // a page is the width of the scroll view
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * kNumberOfPages, self.scrollView.frame.size.height);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.scrollsToTop = NO;
    self.scrollView.delegate = self;
	
    self.pageControl.numberOfPages = kNumberOfPages;
    self.pageControl.currentPage = 0;
    [self.view bringSubviewToFront:self.pageControl];
	
    // pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
}

#pragma mark - ScrolView Methods

- (void)loadScrollViewWithPage:(int)page {
    if (page < 0) return;
    if (page >= kNumberOfPages) return;
	
    // replace the placeholder if necessary
    GridViewController *controller = [self.viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null]) {
        CGRect bounds = CGRectMake(0, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
        UITapGestureRecognizer *backButtonTap =
            [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turnPageBack:)];
        backButtonTap.numberOfTapsRequired = 1;
        UITapGestureRecognizer *forwardButtonTap =
            [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turnPageForward:)];
        forwardButtonTap.numberOfTapsRequired = 1;
        
        if (page == 0) {
            controller = [[FirstGridViewController alloc] initWithFrame:bounds];
        } else if (page == 1) {
            controller = [[SecondGridViewController alloc] initWithFrame:bounds];
        } else if (page == 2) {
            controller = [[ThirdGridViewController alloc] initWithFrame:bounds];
        } else {
            controller = [[GridViewController alloc] initWithFrame:bounds];
        }
        
        [controller.menuGrid.backButton addGestureRecognizer:backButtonTap];
        [controller.menuGrid.forwardButton addGestureRecognizer:forwardButtonTap];
        controller.pageNumber = page;
        [self.viewControllers replaceObjectAtIndex:page withObject:controller];
    }
	
    // add the controller's view to the scroll view
    if (nil == controller.view.superview) {
        CGRect frame = self.scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [self.scrollView addSubview:controller.view];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    if (pageControlUsed) {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
	
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
}

#pragma mark - ScrolViewDelegate Methods

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}

#pragma mark - Actions

- (void)turnPageBack:(id)sender {
    int page = self.pageControl.currentPage;
    [self changePageWithPage:page - 1];
}

- (void)turnPageForward:(id)sender {
    int page = self.pageControl.currentPage;
    [self changePageWithPage:page + 1];
}

- (IBAction)changePage:(id)sender {
    int page = self.pageControl.currentPage;
    [self changePageWithPage:page];
}

- (void)changePageWithPage:(int)page {
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
	// update the scroll view to the appropriate page
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:YES];
    
	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
    self.pageControl.currentPage = page;
}

@end
