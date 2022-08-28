#import "CameraControlWindowController.h"

@interface CameraControlWindowController ()

@end

@implementation CameraControlWindowController

- (IBAction)toggleKeepOnTop:(NSMenuItem *)sender {
	BOOL shouldSetKeepOnTop = [sender state] == NSControlStateValueOff;
	[sender setState:shouldSetKeepOnTop ? NSControlStateValueOn : NSControlStateValueOff];
	
	const NSWindowLevel windowLevel = shouldSetKeepOnTop ? NSStatusWindowLevel : NSNormalWindowLevel;
	[[self window] setLevel:windowLevel];

}
@end
