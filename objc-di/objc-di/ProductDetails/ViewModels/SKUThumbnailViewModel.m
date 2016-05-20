/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "SKUThumbnailViewModel.h"
#import "ProductDetailsViewModel.h"

@interface SKUThumbnailViewModel ()
@property (nonatomic, strong) ProductDetailsViewModel *productDetailsViewModel;
@property (nonatomic, strong) SKU *sku;
@end

@implementation SKUThumbnailViewModel

- (instancetype)initWithProductDetailsViewModel:(ProductDetailsViewModel *)productDetailsViewModel sku:(SKU *)sku {
    self = [super init];
    if (self) {
        _productDetailsViewModel = productDetailsViewModel;
        _sku = sku;
    }
    return self;
}

- (void)select {
    [self.productDetailsViewModel selectSku:self.sku];
}

@end
