#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface CameraControlViewController : NSViewController <NSUserInterfaceValidations>
- (IBAction)toggleKeepOnTop:(NSMenuItem *)sender;
@property (weak) IBOutlet NSMenuItem *keepOnTopMenuItem;

@end

NS_ASSUME_NONNULL_END
