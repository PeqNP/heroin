/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "ProductService.h"
#import "di.h"
#import "MainAssembly.h"
#import "MetricsService.h"
#import "HTTPRequest.h"
#import "Product.h"

@interface ProductService ()
di_property(MetricsService, metricsService)
di_property(HTTPRequest, secureRequest)
@end

@implementation ProductService

di_inject(MainAssembly, MetricsService, metricsService)
di_inject(MainAssembly, HTTPRequest, secureRequest)

- (KSPromise<Product *> *)promiseForProductWithId:(NSString *)productId {
    [self.metricsService logEvent:@"RequestedProduct"];
    return [[self.secureRequest request:@"/product" post:@{@"id": productId}] then:^Product *(NSDictionary *response) {
        return [Product fromDictionary:response];
    } error:^id(NSError *error) {
        return error;
    }];
}

@end
