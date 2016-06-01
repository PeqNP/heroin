/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "ProductDetailsModel.h"
#import "di.h"
#import "User.h"
#import "MetricsService.h"
#import "ShoppingCartService.h"

@interface ProductDetailsModel ()

di_property(MetricsService, metricsService)
di_property(User, user)
di_property(ShoppingCartService, shoppingCartService)

@property (nonatomic, assign) NSInteger amount;
@property (nonatomic, strong) SKU *selectedSku;
@property (nonatomic, strong) Product *product;

@end

@implementation ProductDetailsModel

di_inject(MetricsService, metricsService)
di_inject(User, user)
di_inject(ShoppingCartService, shoppingCartService)

- (instancetype)init {
    [self doesNotRecognizeSelector:_cmd];
    return [self initWithProduct:nil];
}

- (instancetype)initWithProduct:(Product *)product {
    self = [super init];
    if (self) {
        _amount = 1;
        _product = product;
    }
    return self;
}
            

- (KSPromise<NSArray<UIImage *> *> *)productImages {
    return nil;
}

- (KSPromise<NSArray<CustomerReview *> *> *)customerReviews {
    return nil;
}

- (KSPromise<NSArray<SuggestedProduct *> *> *)suggestedProducts {
    return nil;
}

- (KSPromise<NSArray<SKUThumbnail *> *> *)skuThumbnails {
    return nil;
}

- (void)setAmount:(NSInteger)amount {
    self.amount = amount;
}

- (BOOL)selectSku:(SKU *)sku error:(NSError *)error {
    self.selectedSku = sku;
    return YES;
}

- (KSPromise *)addToShoppingCart {
    return nil;
}

- (KSPromise<ReservationConfirmation *> *)reseveForPickup {
    return nil;
}

@end
