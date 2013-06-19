//
//  DCViewController.m
//  DCSegmentedControlApp
//
//  Created by Admin on 19.06.13.
//  Copyright (c) 2013 Dmitry Coolerov. All rights reserved.
//


#import "DCViewController.h"
#import "UISegmentedControl+DCSegmentedControl.h"


@interface DCViewController ()

@end


static NSInteger segmentCount = 4; // Change it if you need

@implementation DCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0f]; // Font with max size
    NSDictionary *textAttributes = @{UITextAttributeFont : font};
    [_segmentedControl setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    
    [_segmentedControl removeAllSegments];
    
    NSString *veryLongString = @"very long text";
    NSString *longText = @"long text";
    NSString *text = @"text";
    
    for (NSInteger i = 0; i < segmentCount; i ++) {
        [_segmentedControl insertSegmentWithTitle:veryLongString atIndex:i animated:NO];
    }
    
//    [_segmentedControl resizeTitleTextFontToFit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
