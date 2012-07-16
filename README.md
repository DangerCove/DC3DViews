# Overview

DC3DViews generates a cube with 6 separate (custom) NSViews and supplies some methods to rotate the cube.

I've added an example implementation that uses subclassing and Interface Builder to fill the views.
![Example](dangercove.github.com/DC3DViews/example.png)

Notice: this is not a perfect implementation of a 3D cube shaped user interface (see known issues). It works well with small rotations and suffices for what I'm trying to accomplish, but I'd love to see what others can do with this and will definitely merge pull requests.

# Usage

## Copying files

* Copy the DC3DViews folder into your project.

## Add the 3D scene in Interface Builder

* Add a new custom view to your window in Interface Builder and set its class to DC3DSceneView;
* Add an NSObject to your window in Interface Builder and set its class to DC3DSceneViewController;
* Control drag from the 'Scene View Controller' to the view you've just added and select the 'view' outlet.

## Hooking up the 3D scene to your code

* Import the 'Scene View Controller' in your header file:

    #import "DC3DSceneViewController.h"

* Create an outlet for the 3D scene controller in your header like so:

    IBOutlet DC3DSceneViewController *_sceneController;

* Attach the _sceneController to your 'Scene View Controller' in Interface Builder;
* Create a cube:

    // Create a new cube, with standard 480x480 views (they're transparent)
    [_sceneController setupCubeWithFront:[[DC3DFaceViewController alloc] initWithScene:_sceneController andSize:480.0f andPosition:DC3DFACE_FRONT]
                                    left:[[DC3DFaceViewController alloc] initWithScene:_sceneController andSize:480.0f andPosition:DC3DFACE_LEFT]
                                   right:[[DC3DFaceViewController alloc] initWithScene:_sceneController andSize:480.0f andPosition:DC3DFACE_RIGHT]
                                    back:[[DC3DFaceViewController alloc] initWithScene:_sceneController andSize:480.0f andPosition:DC3DFACE_BACK]
                                     top:[[DC3DFaceViewController alloc] initWithScene:_sceneController andSize:480.0f andPosition:DC3DFACE_TOP]
                                  bottom:[[DC3DFaceViewController alloc] initWithScene:_sceneController andSize:480.0f andPosition:DC3DFACE_BOTTOM]
     ];

Notice: the default cube faces are transparent, so basically the code above will generate an invisible cube ;). Subclass DC3DFaceView or use .xibs to change this.

* Add some code to rotate your cube on command:

    [_sceneController rotateWithX:30.0f andY:20.0f];

# Known issues

* User interaction (pressing buttons etc.) does not work on rotated views. It seems the clickable areas aren't rotated with the views.
* Only works with cubes (same length sides, no rectangle shaped views).
* Rotations > 45 degrees don't work too well (probably related to zPosition).
* There's some clipping during the rotation (probably related to zPosition).

# License

New BSD License, see `LICENSE` for details.
