/**
 Loads an image on demand when in view.
 
 This prevents unnecessary network requests from occurring in the background. In short, it is loaded JIT.
 
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <UIKit/UIKit.h>

@interface OnDemandImageView : UIView

- (instancetype)initWithUrl:(NSURL *)url;

/** Change the URL that is displayed in the image view. This follows the same rules, where the image will only be loaded when in view. */
- (void)loadUrl:(NSURL *url);

@end
