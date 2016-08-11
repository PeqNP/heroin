/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "ShoppingCartServiceContainer.h"
#import "di.h"

@interface ShoppingCartServiceContainer ()
@property (nonatomic, strong) ShoppingCartService *shoppingCartService;
@end

static ShoppingCartServiceContainer *sInstance;

@implementation ShoppingCartServiceContainer



+ (instancetype)getInstance {
    return sInstance;
}

- (void)setInstance {
    sInstance = self;
}

@end
