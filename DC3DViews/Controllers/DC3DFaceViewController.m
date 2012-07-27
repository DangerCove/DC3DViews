//
//  DC3DFaceViewController.m
//  DC3DViews
//
//  Created by Boy van Amstel on 12-07-12.
//  Copyright (c) 2012 Danger Cove. All rights reserved.
//

#import "DC3DFaceViewController.h"

@interface DC3DFaceViewController ()

@end

@implementation DC3DFaceViewController

@synthesize transformOffset = _transformOffset;

// Apply the standard position
- (void)setPosition:(int)thePosition {
    DC3DTransform offset;
    switch(thePosition) {
        case DC3DFACE_FRONT:
            self.view.layer.zPosition = 60.0;
            offset.angle = 0.0f; // Translate the angle by this much
            offset.x = 0.0f; // To translate x set this to 1.0f
            offset.y = 0.0f; // To translate y set this to 1.0f
            break;
        case DC3DFACE_LEFT:
            self.view.layer.zPosition = 20.0;
            offset.angle = -90.0f;
            offset.x = 0.0f;
            offset.y = 1.0f;        
            break;
        case DC3DFACE_RIGHT:
            self.view.layer.zPosition = 20.0;
            offset.angle = 90.0f;
            offset.x = 0.0f;
            offset.y = 1.0f;
            break;
        case DC3DFACE_BACK:
            // You can add it, but it won't work too well..
            self.view.layer.zPosition = 10.0;
            offset.angle = 180.0f;
            offset.x = 0.0f;
            offset.y = 1.0f;
            break;
        case DC3DFACE_TOP:
            self.view.layer.zPosition = 30.0;
            offset.angle = -90.0f;
            offset.x = 1.0f;
            offset.y = 0.0f;
            break;
        case DC3DFACE_BOTTOM:
            self.view.layer.zPosition = 30.0;
            offset.angle = 90.0f;
            offset.x = 1.0f;
            offset.y = 0.0f;        
            break;
    }
    self.transformOffset = offset; // Offset, so we can reset to its default position
}

// Init with a nib and its position on the cube
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andPosition:(int)thePosition {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        [self setPosition:thePosition];
    }
    return self;
}

// Init with a DC3DFaceView
- (id)initWithView:(DC3DFaceView *)theView andPosition:(int)thePosition {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Initialization code here.
        self.view = theView;
        [self setPosition:thePosition];
    }
    return self;
}

// Init with just a scene, generate a DC3DFaceView on the fly according to the supplied size
- (id)initWithScene:(NSViewController *)theScene andSize:(float)theSize andPosition:(int)thePosition {
    return [self initWithView:[[DC3DFaceView alloc] initWithFrame:NSMakeRect(theScene.view.bounds.size.width / 2, theScene.view.bounds.size.height / 2, theSize, theSize)] andPosition:thePosition];
}

@end
