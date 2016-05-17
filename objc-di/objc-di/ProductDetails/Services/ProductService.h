/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

@class KSPromise;
@class Product;

@interface ProductService : NSObject

- (KSPromise<Product *> *)promiseForProductWithId:(NSString *)productId;

@end
