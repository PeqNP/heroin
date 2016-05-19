/**
 The ProductDetailsDomain model provides all business logic to add products to the cart or reserve product for later pickup. It is meant to provide a simple interface hiding the wiring muck between server and application.
 
 It will contain state when looking at a specific product.
 
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "KSPromise.h"

@class CustomerReview;
@class Product;
@class ReservationConfirmation;
@class SKU;
@class SuggestedProduct;
@class UIImage;

@interface ProductDetailsDomain : NSObject

@property (nonatomic, strong, readonly) Product *product;

- (instancetype)initWithProduct:(Product *)product NS_DESIGNATED_INITIALIZER;

- (KSPromise<NSArray<UIImage *> *> *)getProductImages;
- (KSPromise<NSArray<CustomerReview *> *> *)getCustomerReviews;
- (KSPromise<NSArray<SuggestedProduct *> *> *)getSuggestedProducts;

/** By default, the amount to purchase is 1. */
- (void)setAmount:(NSInteger)amount;

/** Sets error if SKU is unavailable, etc. */
- (BOOL)selectSku:(SKU *)sku error:(NSError *)error;

- (KSPromise *)addToShoppingCart;
- (KSPromise<ReservationConfirmation *> *)reseveForPickup;

@end
