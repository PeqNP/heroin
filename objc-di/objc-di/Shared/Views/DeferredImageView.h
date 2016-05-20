/**
 Provides the ability to display a loading indicator, within the view, until the image has been downloaded from the server.
 
 The image will _not_ be loaded until the image view is within the viewable portion of the viewport. Therefore, there is no risk of having unnecessary network requests occurring in the background. In short, it is loaded JIT.
 
 TODO: Rename the class to something that is easier to understand such as JITImageView or OnDemandImageView.
 
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <UIKit/UIKit.h>

@interface DeferredImageView : UIView

- (instancetype)initWithUrl:(NSURL *)url;

@end
