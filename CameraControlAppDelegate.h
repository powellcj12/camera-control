#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "UVCCameraControl.h"

@interface CameraControlAppDelegate : NSObject {
	IBOutlet NSView *captureView;
	IBOutlet NSButton * autoExposureCheckBox;
	IBOutlet NSButton * autoWhiteBalanceCheckBox;
	IBOutlet NSSlider * exposureSlider;
	IBOutlet NSSlider * whiteBalanceSlider;
	IBOutlet NSSlider * gainSlider;
	__weak IBOutlet NSPopUpButton *cameraSelectButton;
}

- (IBAction)sliderMoved:(id)sender;
- (IBAction)checkBoxChanged:(id)sender;
- (IBAction)selectedCameraChanged:(id)sender;

@end
