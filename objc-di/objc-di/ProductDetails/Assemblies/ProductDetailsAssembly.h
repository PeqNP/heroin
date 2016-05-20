/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "DIAssembly.h"

@class ProductDetailsDomain;
@class ProductDetailsViewModel;
@class ProductService;

@interface ProductDetailsAssembly : NSObject <DIAssembly>

@property (nonatomic, strong, readonly) ProductService *productService;
@property (nonatomic, strong, readonly) ProductDetailsDomain *productDetailsDomain;
// Drives image carousel, customer reviews, product details, etc.
@property (nonatomic, strong, readonly) ProductDetailsViewModel *productDetailsViewModel;


@end
