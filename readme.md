## Facebook

The purpose of this homework is to leverage animations and gestures to transition between screens. We're going to use the techniques from this week to implement some interactions in Facebook.

Time spent: 12 hours

### Features

#### Required

- [x] Tapping on a photo in the news feed should expand the photo full screen.
- [x] Tapping the Done button should animate the photo back into its position in the news feed.
- [ ] On scroll of the full screen photo, the background should start to become transparent, revealing the feed.
- [x] If the user scrolls a large amount and releases, the full screen photo should dismiss.

#### Optional

- [x] The full screen photo should be zoomable.
- [ ] The user should be able to page through the other photos in full screen mode.

#### The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. passing variables between view controllers
2. Adding subviews to window

### Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://github.com/stephancharbit/Facebook/blob/master/facebook_walkthrough.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

* Very tough to make the transation work well – I think it's because I'm not adding a temporary subview for the transition (I just don't have time to fix it!)
