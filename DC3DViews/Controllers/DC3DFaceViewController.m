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
    switch(thePosition) {
        case DC3DFACE_FRONT:
            self.view.layer.zPosition = 60.0;
            DC3DTransform fOffset;
            fOffset.angle = 0.0f; // Translate the angle by this much
            fOffset.x = 0.0f; // To translate x set this to 1.0f
            fOffset.y = 0.0f; // To translate y set this to 1.0f
            self.transformOffset = fOffset; // Offset, so we can reset to its default position
            break;
        case DC3DFACE_LEFT:
            self.view.layer.zPosition = 20.0;
            DC3DTransform lOffset;
            lOffset.angle = -90.0f;
            lOffset.x = 0.0f;
            lOffset.y = 1.0f;        
            self.transformOffset = lOffset;
            break;
        case DC3DFACE_RIGHT:
            self.view.layer.zPosition = 20.0;
            DC3DTransform rOffset;
            rOffset.angle = 90.0f;
            rOffset.x = 0.0f;
            rOffset.y = 1.0f;
            self.transformOffset = rOffset;
            break;
        case DC3DFACE_BACK:
            // You can add it, but it won't work too well..
            break;
        case DC3DFACE_TOP:
            self.view.layer.zPosition = 30.0;
            DC3DTransform tOffset;
            tOffset.angle = -90.0f;
            tOffset.x = 1.0f;
            tOffset.y = 0.0f;
            self.transformOffset = tOffset;
            break;
        case DC3DFACE_BOTTOM:
            self.view.layer.zPosition = 30.0;
            DC3DTransform bOffset;
            bOffset.angle = 90.0f;
            bOffset.x = 1.0f;
            bOffset.y = 0.0f;        
            self.transformOffset = bOffset;
            break;
    }
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
