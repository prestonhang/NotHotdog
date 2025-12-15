# NotHotdog
Ever wonder if that thing is a Hotdog or not? Now, there's an app for that.


Example video of the app is provided here. Note a few things:
- The simulator has limited functionality
  - Camera is not available on the simulator
  - My ML model keeps encountering the exception: `CSU exception: Failed to create espresso context`
    - I think this error is due to the model not properly working on simulator, but can on real devices
- I can't test the app on a physical device, due to signing on my app's selected team. I think it requires a subscription to be in Apple Developers

So the coolest thing about the app doesn't work. :(
But I guess I still wanted to show the work I did on creating this app. 

My important learnings:
- Swift
- SwiftUI
- ViewModels
- Interacting with the Camera/PhotoPicker library
- Creating an ML model

Enjoy!
