//
//  DC3DSceneViewController.m
//  DC3DViews
//
//  Created by Boy van Amstel on 12-07-12.
//  Copyright (c) 2012 Danger Cove. All rights reserved.
//

#import "DC3DSceneViewController.h"
#import "DC3DSceneView.h"

#import <QuartzCore/QuartzCore.h>

#import <objc/runtime.h>

@interface DC3DSceneViewController ()

@end

@implementation DC3DSceneViewController

// Rotate the DC3DFaceViewController by this much
- (void)rotate:(DC3DFaceViewController *)viewController withX:(float)x andY:(float)y duration:(float)duration {
    // Get its layer
    CALayer *layer = viewController.view.layer;
    [layer setAnchorPoint:NSMakePoint(0.5f, 0.5f)];
    // Create a new CATransform3D
    CATransform3D transform = CATransform3DIdentity;
    // Set the distance
    transform.m34 = 1.0 / -2300;
    // Move away, to we rotate from the center of the cube
    transform = CATransform3DTranslate(transform, 0.0f, 0.0f, -(layer.bounds.size.height / 2));
    // Translate x
    transform = CATransform3DRotate(transform, x * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
    // Translate y
    transform = CATransform3DRotate(transform, y * M_PI / 180.0f, 0.0f, 1.0f, 0.0f);
    // Apply the standard offset of the face
    transform = CATransform3DRotate(transform, viewController.transformOffset.angle * M_PI / 180.0f, viewController.transformOffset.x, viewController.transformOffset.y, viewController.transformOffset.z);
    // Move back to the center of the view
    transform = CATransform3DTranslate(transform, 0.0f, 0.0f, (layer.bounds.size.height / 2));
    // Animate
    if(duration > 0.0f) {
       CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform"];
        rotate.duration = duration;
        rotate.fromValue=[NSValue valueWithCATransform3D:layer.transform];
        rotate.toValue=[NSValue valueWithCATransform3D:transform];
        [layer addAnimation:rotate forKey:@"transform"];
    }
    // Apply the translation
    [layer setTransform:transform];
}

- (void)rotate:(DC3DFaceViewController *)viewController withX:(float)x andY:(float)y {
    [self rotate:viewController withX:x andY:y duration:0.0f];
}

// Setup with 6 faces
- (void)setupCubeWithFront:(DC3DFaceViewController *)front 
                      left:(DC3DFaceViewController *)left 
                     right:(DC3DFaceViewController *)right
                      back:(DC3DFaceViewController *)back
                       top:(DC3DFaceViewController *)top
                    bottom:(DC3DFaceViewController *)bottom
{
    // Front
    if(front) {
        _frontFaceViewController = front;
        [self.view addSubview:_frontFaceViewController.view];
        [self rotate:_frontFaceViewController withX:0.0f andY:0.0f]; // Apply startup position
    }
    
    // Left
    if(left) {
        _leftFaceViewController = left;
        [self.view addSubview:_leftFaceViewController.view];
        [self rotate:_leftFaceViewController withX:0.0f andY:0.0f];
    }

    // Right
    if(right) {
        _rightFaceViewController = right;
        [self.view addSubview:_rightFaceViewController.view];
        [self rotate:_rightFaceViewController withX:0.0f andY:0.0f];
    }
    
    // Back
    if(back) {
        _backFaceViewController = back;
        [self.view addSubview:_backFaceViewController.view];
        [self rotate:_backFaceViewController withX:0.0f andY:0.0f];
    }

    // Top
    if(top) {
        _topFaceViewController = top;
        [self.view addSubview:_topFaceViewController.view];
        [self rotate:_topFaceViewController withX:0.0f andY:0.0f];
    }

    // Bottom
    if(bottom) {
        _bottomFaceViewController = bottom;
        [self.view addSubview:_bottomFaceViewController.view];
        [self rotate:_bottomFaceViewController withX:0.0f andY:0.0f];
    }
}

// Reset all faces to their startup positions
- (void)resetTransformsWithDuration:(float)duration {
    [self rotate:_frontFaceViewController withX:0.0f andY:0.0f duration:duration];
    [self rotate:_leftFaceViewController withX:0.0f andY:0.0f duration:duration];        
    [self rotate:_rightFaceViewController withX:0.0f andY:0.0f duration:duration];        
    [self rotate:_backFaceViewController withX:0.0f andY:0.0f duration:duration];        
    [self rotate:_topFaceViewController withX:0.0f andY:0.0f duration:duration];        
    [self rotate:_bottomFaceViewController withX:0.0f andY:0.0f duration:duration];
}
- (void)resetTransforms {
    [self resetTransformsWithDuration:0.0f];
}

// Rotate the cube with all six faces
- (void)rotateWithX:(float)x andY:(float)y duration:(float)duration {
    [self rotate:_frontFaceViewController withX:x andY:y duration:duration];
    [self rotate:_leftFaceViewController withX:x andY:y duration:duration];
    [self rotate:_rightFaceViewController withX:x andY:y duration:duration];
    [self rotate:_backFaceViewController withX:x andY:y duration:duration];
    [self rotate:_topFaceViewController withX:x andY:y duration:duration];
    [self rotate:_bottomFaceViewController withX:x andY:y duration:duration];
}
- (void)rotateWithX:(float)x andY:(float)y {
    [self rotateWithX:x andY:y duration:0.0f];
}

@end
