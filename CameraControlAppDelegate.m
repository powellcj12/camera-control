#import "CameraControlAppDelegate.h"


@implementation CameraControlAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	videoDevice = [AVCaptureDevice deviceWithUniqueID:@"0x14400000045e0772"];

	if( !videoDevice ) {
		NSLog( @"No video input device" );
		exit( 1 );
	}

	videoInput = [[AVCaptureDeviceInput alloc] initWithDevice:videoDevice error:nil];

	captureSession = [[AVCaptureSession alloc] init];
	[captureSession addInput:videoInput];
	
	CALayer *captureViewLayer = [captureView layer];
	[captureViewLayer setBackgroundColor:CGColorGetConstantColor(kCGColorBlack)];
	AVCaptureVideoPreviewLayer *newPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:captureSession];
	[newPreviewLayer setFrame:[captureViewLayer bounds]];
	[newPreviewLayer setAutoresizingMask:kCALayerWidthSizable | kCALayerHeightSizable];
	[captureViewLayer addSublayer:newPreviewLayer];

	[captureSession startRunning];

	cameraControl = [[UVCCameraControl alloc] initWithVendorID:0x045e productID:0x0772];
	[cameraControl setAutoExposure:YES];
	[cameraControl setAutoWhiteBalance:YES];
}


- (IBAction)sliderMoved:(id)sender {
	
	// Exposure Time
	if( [sender isEqualTo:exposureSlider] ) {		
		[cameraControl setExposure:exposureSlider.floatValue];
	}
	
	// White Balance Temperature
	else if( [sender isEqualTo:whiteBalanceSlider] ) {
		[cameraControl setWhiteBalance:whiteBalanceSlider.floatValue];
	}
	
	// Gain Value
	else if( [sender isEqualTo:gainSlider] ) {
		[cameraControl setBrightness:gainSlider.floatValue];
	}
}


- (IBAction)checkBoxChanged:(id)sender {
	
	// Auto Exposure
	if( [sender isEqualTo:autoExposureCheckBox] ) {
		if( autoExposureCheckBox.state == NSControlStateValueOn ) {
			[cameraControl setAutoExposure:YES];
			[exposureSlider setEnabled:NO];
		} 
		else {
			[cameraControl setAutoExposure:NO];
			[exposureSlider setEnabled:YES];
			[cameraControl setExposure:exposureSlider.floatValue];
		}
	}
	
	// Auto White Balance
	else if( [sender isEqualTo:autoWhiteBalanceCheckBox] ) {
		if( autoWhiteBalanceCheckBox.state == NSControlStateValueOn ) {
			[cameraControl setAutoWhiteBalance:YES];
			[whiteBalanceSlider setEnabled:NO];
		} 
		else {
			[cameraControl setAutoWhiteBalance:NO];
			[whiteBalanceSlider setEnabled:YES];
			[cameraControl setWhiteBalance:whiteBalanceSlider.floatValue];
		}
	}
}


- (void)dealloc {
	[captureSession release];
	[videoInput release];
	[videoDevice release];
	
	[cameraControl release];
	[super dealloc];
}

@end

