//
//  DC3DFaceViewController.h
//  DC3DViews
//
//  Created by Boy van Amstel on 12-07-12.
//  Copyright (c) 2012 Danger Cove. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DC3DFaceView.h"

#define DC3DFACE_FRONT  0
#define DC3DFACE_LEFT   1
#define DC3DFACE_RIGHT  2
#define DC3DFACE_BACK   3
#define DC3DFACE_TOP    4
#define DC3DFACE_BOTTOM 5

typedef struct {
    float angle;
    float x;
    float y;
    float z;
} DC3DTransform;

@interface DC3DFaceViewController : NSViewController

@property (assign) DC3DTransform transformOffset;

- (void)setPosition:(int)thePosition;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andPosition:(int)thePosition;
- (id)initWithView:(DC3DFaceView *)theView andPosition:(int)thePosition;
- (id)initWithScene:(NSViewController *)theScene andSize:(float)theSize andPosition:(int)thePosition;

@end
