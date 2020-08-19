#import "CameraControlAppDelegate.h"


@implementation CameraControlAppDelegate {
	AVCaptureSession *m_captureSession;
	AVCaptureDevice *m_videoDevice;
	AVCaptureDeviceInput *m_videoInput;

	UVCCameraControl *m_cameraControl;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	m_videoDevice = [AVCaptureDevice deviceWithUniqueID:@"0x14400000045e0772"];

	if( !m_videoDevice ) {
		NSLog( @"No video input device" );
		exit( 1 );
	}

	m_videoInput = [[AVCaptureDeviceInput alloc] initWithDevice:m_videoDevice error:nil];

	m_captureSession = [[AVCaptureSession alloc] init];
	[m_captureSession addInput:m_videoInput];
	
	CALayer *captureViewLayer = [captureView layer];
	[captureViewLayer setBackgroundColor:CGColorGetConstantColor(kCGColorBlack)];
	AVCaptureVideoPreviewLayer *newPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:m_captureSession];
	[newPreviewLayer setFrame:[captureViewLayer bounds]];
	[newPreviewLayer setAutoresizingMask:kCALayerWidthSizable | kCALayerHeightSizable];
	[captureViewLayer addSublayer:newPreviewLayer];

	[m_captureSession startRunning];

	m_cameraControl = [[UVCCameraControl alloc] initWithVendorID:0x045e productID:0x0772];
	[m_cameraControl setAutoExposure:YES];
	[m_cameraControl setAutoWhiteBalance:YES];

	[exposureSlider setNumberOfTickMarks:[m_cameraControl numExposureValues]];
	[exposureSlider setAllowsTickMarkValuesOnly:YES];
}


- (IBAction)sliderMoved:(id)sender {
	
	// Exposure Time
	if( [sender isEqualTo:exposureSlider] ) {		
		[m_cameraControl setExposure:[exposureSlider closestTickMarkValueToValue:exposureSlider.floatValue]];
	}
	
	// White Balance Temperature
	else if( [sender isEqualTo:whiteBalanceSlider] ) {
		[m_cameraControl setWhiteBalance:whiteBalanceSlider.floatValue];
	}
	
	// Gain Value
	else if( [sender isEqualTo:gainSlider] ) {
		[m_cameraControl setBrightness:gainSlider.floatValue];
	}
}


- (IBAction)checkBoxChanged:(id)sender {
	
	// Auto Exposure
	if( [sender isEqualTo:autoExposureCheckBox] ) {
		if( autoExposureCheckBox.state == NSControlStateValueOn ) {
			[m_cameraControl setAutoExposure:YES];
			[exposureSlider setEnabled:NO];
		} 
		else {
			[m_cameraControl setAutoExposure:NO];
			[exposureSlider setEnabled:YES];
			[m_cameraControl setExposure:exposureSlider.floatValue];
		}
	}
	
	// Auto White Balance
	else if( [sender isEqualTo:autoWhiteBalanceCheckBox] ) {
		if( autoWhiteBalanceCheckBox.state == NSControlStateValueOn ) {
			[m_cameraControl setAutoWhiteBalance:YES];
			[whiteBalanceSlider setEnabled:NO];
		} 
		else {
			[m_cameraControl setAutoWhiteBalance:NO];
			[whiteBalanceSlider setEnabled:YES];
			[m_cameraControl setWhiteBalance:whiteBalanceSlider.floatValue];
		}
	}
}



@end

