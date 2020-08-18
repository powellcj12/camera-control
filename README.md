#  CameraControl for macOS
The CameraControl app and underlying UVCCameraControl code were originally made availabe by [@phoboslab](https://github.com/phoboslab). The project doesn't seem to be on GitHub, but was shared on the [phoboslab site here](https://phoboslab.org/log/2009/07/uvc-camera-control-for-mac-os-x). Notably, that project is from 2009 and many things about macOS development have changed since then. This project attempts to update the project to work on more recent version of macOS.

## macOS Changes
I had been using a verison of this app on 10.14 Mojave without issue but in 10.15 Catalina, Apple dropped support for 32-bit apps meaning that the QTKit framework the original project relies on is no longer available. AVFoundation is meant to be a replacement as documented by Apple in [TN2300](https://developer.apple.com/library/archive/technotes/tn2300/_index.html). That's the main work happening in this project.
