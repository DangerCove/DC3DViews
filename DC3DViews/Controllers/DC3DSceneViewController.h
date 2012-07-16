//
//  DC3DSceneViewController.h
//  DC3DViews
//
//  Created by Boy van Amstel on 12-07-12.
//  Copyright (c) 2012 Danger Cove. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DC3DFaceViewController.h"

@interface DC3DSceneViewController : NSViewController {
    DC3DFaceViewController *_frontFaceViewController;
    DC3DFaceViewController *_backFaceViewController;
    DC3DFaceViewController *_leftFaceViewController;
    DC3DFaceViewController *_rightFaceViewController;
    DC3DFaceViewController *_topFaceViewController;
    DC3DFaceViewController *_bottomFaceViewController;
}

- (void)setupCubeWithFront:(DC3DFaceViewController *)front 
                      left:(DC3DFaceViewController *)left 
                     right:(DC3DFaceViewController *)right
                      back:(DC3DFaceViewController *)back
                       top:(DC3DFaceViewController *)top
                    bottom:(DC3DFaceViewController *)bottom;
- (void)resetTransforms;
- (void)rotateWithX:(float)x andY:(float)y;

@end
