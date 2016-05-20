/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "ProductDetailsViewModel.h"
#import "di.h"
#import "BannerNotification.h"
#import "ProductDetailsAssembly.h"
#import "ProductDetailsDomain.h"

@interface ProductDetailsViewModel ()

@property (nonatomic, assign) BOOL isLoadingSelectedSkuImage;
@property (nonatomic, assign) BOOL isReserveProductButtonBusy;
@property (nonatomic, assign) BOOL isAddToShoppingCartButtonBusy;

@property (nonatomic, strong) BannerNotification *bannerNotification;
@property (nonatomic, strong) UIImage *selectedSkuImage;

@property (nonatomic, strong) ProductDetailsDomain *productDetailsDomain;

@end

@implementation ProductDetailsViewModel

- (instancetype)init {
    [self doesNotRecognizeSelector:_cmd];
    return [self initWithProductDetailsDomain:nil];
}

- (instancetype)initWithProductDetailsDomain:(ProductDetailsDomain *)productDetailsDomain {
    self = [super init];
    if (self) {
        _productDetailsDomain = productDetailsDomain;
    }
    return self;
}

- (NSArray<SKUThumbnailViewModel *> *)skuThumbnailViewModels {
    return nil;
}

- (void)addToShoppingCart {
    self.isAddToShoppingCartButtonBusy = YES;
    [[self.productDetailsDomain addToShoppingCart] then:^id _Nullable(id empty) {
        self.isAddToShoppingCartButtonBusy = NO;
        return empty;
    } error:^id(NSError *error) {
        self.bannerNotification = [[BannerNotification alloc] initWithType:BannerNotificationTypeError title:@"Shopping Cart Error" message:@"Failed to add product to your shopping cart. Call 1.888.HELP.MEOW"];
        self.isAddToShoppingCartButtonBusy = NO;
        return error;
    }];
    
}

- (void)reserveProductForPickup {
    
}

- (void)selectSku:(SKU *)sku {
    
}

@end
