//
//  GreySceneView.m
//  DC3DViewsExample
//
//  Created by Boy van Amstel on 16-07-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GreySceneView.h"

@implementation GreySceneView

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
    [[NSColor grayColor] setFill];
    NSRectFill(dirtyRect);
}

@end
