/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>
#import "KSPromise.h"

@class BannerNotification;
@class CustomerReviewSlabViewModel;
@class ProductDetailsDomain;
@class SKU;
@class SKUThumbnailViewModel;
@class SuggestedProductViewModel;

@interface ProductDetailsViewModel : NSObject

@property (nonatomic, assign, readonly) BOOL isLoadingSelectedSkuImage;
@property (nonatomic, assign, readonly) BOOL isReserveProductButtonBusy;
@property (nonatomic, assign, readonly) BOOL isAddToShoppingCartButtonBusy;

@property (nonatomic, strong, readonly) BannerNotification *bannerNotification;
@property (nonatomic, strong, readonly) NSString *productName;
@property (nonatomic, strong, readonly) NSString *productId;
@property (nonatomic, strong, readonly) UIImage *selectedSkuImage;

- (instancetype)initWithProductDetailsDomain:(ProductDetailsDomain *)productDetailsDomain NS_DESIGNATED_INITIALIZER;

- (NSArray<SKUThumbnailViewModel *> *)skuThumbnailViewModels;
- (CustomerReviewSlabViewModel *)customerReviewSlabViewModel;
- (NSArray<SuggestedProductViewModel *> *)suggestedProducts;
- (void)reserveProductForPickup;
- (void)addToShoppingCart;
- (void)selectSku:(SKU *)sku;

@end
