//
//  DC3DAppDelegate.m
//  DC3DViews
//
//  Created by Boy van Amstel on 12-07-12.
//  Copyright (c) 2012 Danger Cove. All rights reserved.
//

#import "DC3DAppDelegate.h"
#import "GradientFaceView.h"

@implementation DC3DAppDelegate

@synthesize window = _window;

// Default rotation
#define VERT_ANGLE 20.0f
#define HOR_ANGLE 15.0f
#define CUBE_FACE_SIZE 480.0f
#define CUBE_ROTATION_DURATION 0.2f
#define CUBE_RESET_DURATION 1.0f

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application

    // Create a standard frame
    NSRect faceRect = NSMakeRect(_sceneController.view.bounds.size.width / 2, _sceneController.view.bounds.size.height / 2, CUBE_FACE_SIZE, CUBE_FACE_SIZE);
    
    // Front face is a subclass of DC3DFaceView
    DC3DFaceViewController *frontFaceViewController = [[DC3DFaceViewController alloc] initWithView:[[GradientFaceView alloc] initWithFrame:faceRect]
                                                                                       andPosition:DC3DFACE_FRONT];

    // Left face is a subclass of DC3DFaceView
    DC3DFaceViewController *leftFaceViewController = [[DC3DFaceViewController alloc] initWithView:[[GradientFaceView alloc] initWithFrame:faceRect]
                                                                                       andPosition:DC3DFACE_LEFT];

    // Right face is a subclass of DC3DFaceView
    DC3DFaceViewController *rightFaceViewController = [[DC3DFaceViewController alloc] initWithView:[[GradientFaceView alloc] initWithFrame:faceRect]
                                                                                      andPosition:DC3DFACE_RIGHT];
    
    // Get the top face from a .xib
    DC3DFaceViewController *topFaceViewController = [[DC3DFaceViewController alloc] initWithNibName:@"CustomFace" bundle:nil andPosition:DC3DFACE_TOP];
    [topFaceViewController.view setFrame:faceRect]; // Set the frame so the x,y coordinates match up

    // Create a new cube
    [_sceneController setupCubeWithFront:frontFaceViewController    // Front face controller we just made
                                    left:leftFaceViewController     // Left face controller we just made
                                   right:rightFaceViewController    // Right face controller we just made
                                    back:nil                        // We're not using the back view
                                     top:topFaceViewController      // Top view controller with the .xib
                                  bottom:[[DC3DFaceViewController alloc] initWithScene:_sceneController andSize:CUBE_FACE_SIZE andPosition:DC3DFACE_BOTTOM]
                                                                    // Create the bottom view on the fly, from the default view
     ];
    
}

// Close the app when we close the window
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

// Some transformations, hooked up to the interface
- (IBAction)reset:(id)sender {
    [_sceneController resetTransformsWithDuration:CUBE_RESET_DURATION];
}
- (IBAction)rotateAngled:(id)sender {
    [_sceneController rotateWithX:30.0f andY:20.0f duration:CUBE_ROTATION_DURATION];
}
- (IBAction)rotateUp:(id)sender {
    [_sceneController rotateWithX:-VERT_ANGLE andY:0.0f duration:CUBE_ROTATION_DURATION];
}
- (IBAction)rotateDown:(id)sender {
    [_sceneController rotateWithX:VERT_ANGLE andY:0.0f duration:CUBE_ROTATION_DURATION];
}
- (IBAction)rotateRight:(id)sender {
    [_sceneController rotateWithX:0.0f andY:HOR_ANGLE duration:CUBE_ROTATION_DURATION];
}
- (IBAction)rotateLeft:(id)sender {
    [_sceneController rotateWithX:0.0f andY:-HOR_ANGLE duration:CUBE_ROTATION_DURATION];
}

@end
