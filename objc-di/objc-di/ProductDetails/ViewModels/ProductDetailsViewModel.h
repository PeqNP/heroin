/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>
#import "KSPromise.h"

@class BannerNotification;
@class CustomerReviewSummaryViewModel;
@class ProductDetailsModel;
@class ProductInfoViewModel;
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

- (instancetype)initWithProductDetailsDomain:(ProductDetailsModel *)productDetailsDomain NS_DESIGNATED_INITIALIZER;

/** Provides a view model which represents all of the product information including name, price, sale price, event (holiday) info, etc. */
- (ProductInfoViewModel *)productInfo;

/** Provides list of available SKUs. */
- (NSArray<SKUThumbnailViewModel *> *)skuThumbnails;

/** Provides customer review related information including the rating and the number of customer reviews. This view model provides a way for the user to access the customer reviews. */
- (CustomerReviewSummaryViewModel *)customerReviewSummary;

/** Provides list of suggested products. */
- (NSArray<SuggestedProductViewModel *> *)suggestedProducts;

- (void)reserveProductForPickup;
- (void)addToShoppingCart;
- (void)selectSku:(SKU *)sku;

@end
