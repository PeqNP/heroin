/**
 The ProductDetailsModel provides all business logic to add products to the cart or reserve product for later pickup. It is meant to provide a simple interface hiding the wiring muck between server and application.
 
 It will contain state when looking at a specific product.
 
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "KSPromise.h"

@class CustomerReview;
@class Product;
@class ReservationConfirmation;
@class SKU;
@class SKUThumbnail;
@class SuggestedProduct;
@class UIImage;

@interface ProductDetailsModel : NSObject

@property (nonatomic, strong, readonly) Product *product;

- (instancetype)initWithProduct:(Product *)product NS_DESIGNATED_INITIALIZER;

- (KSPromise<NSArray<UIImage *> *> *)productImages;
- (KSPromise<NSArray<CustomerReview *> *> *)customerReviews;
- (KSPromise<NSArray<SuggestedProduct *> *> *)suggestedProducts;
- (KSPromise<NSArray<SKUThumbnail *> *> *)skuThumbnails;

/** By default, the amount to purchase is 1. */
- (void)setAmount:(NSInteger)amount;

/** Sets error if SKU is unavailable, etc. */
- (BOOL)selectSku:(SKU *)sku error:(NSError *)error;

- (KSPromise *)addToShoppingCart;
- (KSPromise<ReservationConfirmation *> *)reseveForPickup;

@end
