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
di_property(HTTPRequest, httpRequest)
@end

@implementation ProductService

di_inject(MainAssembly, MetricsService, metricsService)
di_inject(MainAssembly, HTTPRequest, httpRequest)

- (KSPromise<Product *> *)promiseForProductWithId:(NSString *)productId {
    [self.metricsService logEvent:@"RequestedProduct"];
    return [[self.httpRequest request:@"/product" post:@{@"id": productId}] then:^Product *(NSDictionary *response) {
        return [Product productFromDictionary:response];
    } error:^id(NSError *error) {
        return error;
    }];
}

@end
