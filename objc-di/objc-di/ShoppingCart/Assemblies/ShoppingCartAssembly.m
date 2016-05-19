/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "ShoppingCartAssembly.h"

@interface ShoppingCartAssembly ()
@property (nonatomic, strong) ShoppingCartService *shoppingCartService;
@end

static ShoppingCartAssembly *sInstance;

@implementation ShoppingCartAssembly

#pragma mark - DIAssembly

+ (instancetype)getInstance {
    return sInstance;
}

- (void)setInstance {
    sInstance = self;
}

@end
