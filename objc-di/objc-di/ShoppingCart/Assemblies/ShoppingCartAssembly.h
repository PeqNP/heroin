/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "DIAssembly.h"

@class ShoppingCartService;

@interface ShoppingCartAssembly : NSObject <DIAssembly>

@property (nonatomic, strong, readonly) ShoppingCartService *shoppingCartService;

@end
