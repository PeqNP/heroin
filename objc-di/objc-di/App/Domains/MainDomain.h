/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "KSPromise.h"

@class ProductDetailsModel;

@interface MainDomain : NSObject

- (KSPromise<ProductDetailsModel *> *)productDetailsDomainWithProductId:(NSString *)productId;

@end
