#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "UVCCameraControl.h"

@interface CameraControlAppDelegate : NSObject {
	AVCaptureSession * captureSession;
	AVCaptureDevice * videoDevice;
	AVCaptureDeviceInput * videoInput;
	
	UVCCameraControl * cameraControl;
	
	IBOutlet NSView *captureView;
	IBOutlet NSButton * autoExposureCheckBox;
	IBOutlet NSButton * autoWhiteBalanceCheckBox;
	IBOutlet NSSlider * exposureSlider;
	IBOutlet NSSlider * whiteBalanceSlider;
	IBOutlet NSSlider * gainSlider;
}

- (IBAction)sliderMoved:(id)sender;
- (IBAction)checkBoxChanged:(id)sender;

@end
