/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "KSPromise.h"

@class ProductDetailsModel;

@interface MainDomain : NSObject

- (KSPromise<ProductDetailsDomain *> *)productDetailsDomainWithProductId:(NSString *)productId;

@end
