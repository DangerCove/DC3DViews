//
//  GradientFaceView.m
//  DC3DViews
//
//  Created by Boy van Amstel on 16-07-12.
//  Copyright (c) 2012 Danger Cove. All rights reserved.
//

#import "GradientFaceView.h"

@implementation GradientFaceView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
    NSGradient *aGradient = [[NSGradient alloc] initWithStartingColor:[NSColor darkGrayColor] endingColor:[NSColor whiteColor]];
    [aGradient drawInRect:dirtyRect angle:45.0];  
    
    NSImageView *photoImageView = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 0, 480, 480)];
    [photoImageView setImage:[NSImage imageNamed:@"img_test.png"]];
    [self addSubview: photoImageView];
}

@end
