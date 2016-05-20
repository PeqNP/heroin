/**
 Entry-point into the services framework.
 
 TODO: Figure out a way to hide the instance of the App init methods entirely from the consumer. They should only see the appWithConfig: method.
 
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "KSPromise.h"

@class ProductDetailsModel;

@interface App : NSObject

+ (instancetype)appWithConfig:(NSDictionary *)config;

- (KSPromise<ProductDetailsModel *> *)productDetailsModelWithProductId:(NSString *)productId;

@end
