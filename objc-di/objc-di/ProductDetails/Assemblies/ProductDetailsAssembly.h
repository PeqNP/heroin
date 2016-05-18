/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "DIAssembly.h"

@class UIViewController;

@interface ProductDetailsAssembly : NSObject <DIAssembly>

- (UIViewController *)productDetailsControllerWithProductId:(NSString *)productId;

@end
