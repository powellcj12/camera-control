#import "CameraControlViewController.h"

@interface CameraControlViewController () {
	BOOL isKeepOnTopSelected;
}

@end

@implementation CameraControlViewController

- (BOOL)validateUserInterfaceItem:(id<NSValidatedUserInterfaceItem>)item
{
	if (item == _keepOnTopMenuItem) {
		[_keepOnTopMenuItem setState:isKeepOnTopSelected ? NSControlStateValueOn : NSControlStateValueOff];
	}
	
	return YES;
}

- (IBAction)toggleKeepOnTop:(NSMenuItem *)sender {
	isKeepOnTopSelected = !isKeepOnTopSelected;
	const NSWindowLevel windowLevel = isKeepOnTopSelected ? NSStatusWindowLevel : NSNormalWindowLevel;
	[[[self view] window] setLevel:windowLevel];
}
@end
