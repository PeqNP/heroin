/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "ProductDetailsDomain.h"
#import "di.h"
#import "MainAssembly.h"
#import "ShoppingCartAssembly.h"
#import "User.h"
#import "MetricsService.h"
#import "ShoppingCartService.h"

@interface ProductDetailsDomain ()

di_property(MetricsService, metricsService)
di_property(User, user)
di_property(ShoppingCartService, shoppingCartService)

@property (nonatomic, strong) Product *product;

@end

@implementation ProductDetailsDomain

di_inject(MainAssembly, MetricsService, metricsService)
di_inject(MainAssembly, User, user)
di_inject(ShoppingCartAssembly, ShoppingCartService, shoppingCartService)

- (instancetype)initWithProduct:(Product *)product {
    self = [super init];
    if (self) {
        _product = product;
    }
    return self;
}

@end
