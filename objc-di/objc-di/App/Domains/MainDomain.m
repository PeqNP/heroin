/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "MainDomain.h"
#import "di.h"
#import "MainAssembly.h"
#import "ProductService.h"
#import "ProductDetailsModel.h"

@interface MainDomain ()
di_property(ProductService, productService)
@end

@implementation MainDomain

di_inject(MainAssembly, ProductService, productService)

- (KSPromise<ProductDetailsModel *> *)productDetailsDomainWithProductId:(NSString *)productId {
    return [[self.productService promiseForProductWithId:productId] then:^ProductDetailsModel *(Product *product) {
        return [[ProductDetailsModel alloc] initWithProduct:product];
    } error:^id(NSError *error) {
        return error;
    }];
}

@end
