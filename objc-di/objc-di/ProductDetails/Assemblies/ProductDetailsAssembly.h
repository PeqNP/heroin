/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "DIAssembly.h"

@class ProductDetailsModel;
@class ProductDetailsViewModel;
@class ProductService;

@interface ProductDetailsAssembly : NSObject <DIAssembly>

@property (nonatomic, strong, readonly) ProductService *productService;
@property (nonatomic, strong, readonly) ProductDetailsModel *productDetailsDomain;
// Drives image carousel, customer reviews, product details, etc.
@property (nonatomic, strong, readonly) ProductDetailsViewModel *productDetailsViewModel;


@end
