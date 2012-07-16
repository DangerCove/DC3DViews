//
//  DC3DFaceView.m
//  DC3DViews
//
//  Created by Boy van Amstel on 12-07-12.
//  Copyright (c) 2012 Danger Cove. All rights reserved.
//

#import "DC3DFaceView.h"

@implementation DC3DFaceView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        [self setWantsLayer:YES];
        [self setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawOnSetNeedsDisplay];
    }
    
    return self;
}

- (void)viewDidMoveToSuperview {
    self.layer.anchorPoint = NSMakePoint(0.5f, 0.5f);
}

@end
