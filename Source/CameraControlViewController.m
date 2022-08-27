#import "CameraControlViewController.h"

@interface CameraControlViewController ()

@end

@implementation CameraControlViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Always keep the window on top, that seems to prevent the camera from freezing
	[[[self view] window] setLevel:NSStatusWindowLevel];
}

@end
