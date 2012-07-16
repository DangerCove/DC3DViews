//
//  DC3DSceneView.m
//  DC3DViews
//
//  Created by Boy van Amstel on 12-07-12.
//  Copyright (c) 2012 Danger Cove. All rights reserved.
//

#import "DC3DSceneView.h"

@implementation DC3DSceneView

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

@end
