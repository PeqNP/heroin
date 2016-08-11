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
@class RACSignal;

@interface ProductDetailsViewModel : NSObject

@property (nonatomic, strong, readonly) RACSignal *loadingSkuSignal; // Provides UIImage
@property (nonatomic, strong, readonly) RACSignal *reserveProductSignal; // Provides ReservationMessage
@property (nonatomic, strong, readonly) RACSignal *addToShoppingCartSignal; // Provides YES/NO
@property (nonatomic, strong, readonly) RACSignal *bannerSignal; // Provides BannerNotification

@property (nonatomic, strong, readonly) NSString *productName;
@property (nonatomic, strong, readonly) NSString *productPrice;
@property (nonatomic, strong, readonly) NSString *productId;
@property (nonatomic, strong, readonly) NSArray<NSURL *> *productImageUrls;

- (instancetype)initWithProductDetailsModel:(ProductDetailsModel *)productDetailsModel NS_DESIGNATED_INITIALIZER;

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
