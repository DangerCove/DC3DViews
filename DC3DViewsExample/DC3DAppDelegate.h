//
//  DC3DAppDelegate.h
//  DC3DViews
//
//  Created by Boy van Amstel on 12-07-12.
//  Copyright (c) 2012 Danger Cove. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DC3DSceneViewController.h"

@interface DC3DAppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet DC3DSceneViewController *_sceneController;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)reset:(id)sender;
- (IBAction)rotateUp:(id)sender;
- (IBAction)rotateDown:(id)sender;
- (IBAction)rotateRight:(id)sender;
- (IBAction)rotateLeft:(id)sender;

@end
