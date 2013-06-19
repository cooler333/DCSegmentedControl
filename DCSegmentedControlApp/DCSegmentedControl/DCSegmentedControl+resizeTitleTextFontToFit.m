//
//  UISegmentedControl+DCSegmentedControl.m
//  DCSegmentedControlApp
//
//  Created by Admin on 19.06.13.
//  Copyright (c) 2013 Dmitry Coolerov. All rights reserved.
//


#import "DCSegmentedControl+resizeTitleTextFontToFit.h"


@implementation UISegmentedControl (resizeTitleTextFontToFit)

- (void)resizeTitleTextFontToFit {
    
    UIFont *font;
    CGFloat textWidth = 0;
    NSString *maxString = [NSString string];
    
    UIView *segmentView = self.subviews[0];
    
    // Find font
    for (UILabel *label in segmentView.subviews) {
        if ([label isKindOfClass:[UILabel class]]) {
            font = label.font;
    
            NSString *string = label.text;
            CGSize size1 = self.frame.size;
            CGFloat numberOfSegments = self.numberOfSegments;
            CGFloat spaceWidth = size1.width/numberOfSegments;
            CGFloat newtextWidth = [string sizeWithFont:font forWidth:spaceWidth lineBreakMode:NSLineBreakByCharWrapping].width;
            if (textWidth < newtextWidth) {
                textWidth = newtextWidth;
                maxString = string;
            }
            
            spaceWidth = spaceWidth-10;
            if (spaceWidth <= 0) {
                NSLog(@"Warning: Frame isn't set yet. It may be because you made this in ViewDidLoad");
                return;
            }
            CGSize size = CGSizeMake(spaceWidth-10, self.frame.size.height);
            UIFont *newFont = [self getFontForString:maxString toFitWithSize:size seedFont:font];
            
            if (font.pointSize > newFont.pointSize) {
                font = newFont;
            }
        }
    }
    
    [self setTitleTextAttributes:@{UITextAttributeFont : font} forState:UIControlStateNormal];
}

- (UIFont*)getFontForString:(NSString*)string
             toFitWithSize:(CGSize )size
                  seedFont:(UIFont*)seedFont{
    UIFont* returnFont = seedFont;
    CGSize stringSize = [string sizeWithFont:returnFont];
    
    while(stringSize.width > size.width){
        returnFont = [UIFont systemFontOfSize:returnFont.pointSize -1];
        stringSize = [string sizeWithFont:returnFont];
    }
    
    return returnFont;
}

@end
