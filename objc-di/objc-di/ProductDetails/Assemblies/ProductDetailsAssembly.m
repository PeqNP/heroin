/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "ProductDetailsAssembly.h"
#import "di.h"
#import "ProductService.h"

@interface ProductDetailsAssembly ()
@property (nonatomic, strong) ProductService *productService;
@property (nonatomic, strong) ProductDetailsModel *productDetailsDomain;
@end

static ProductDetailsAssembly *sInstance;

@implementation ProductDetailsAssembly

- (instancetype)init {
    [self doesNotRecognizeSelector:_cmd];
    return [self initWithProductDetailsDomain:nil];
}

- (instancetype)initWithProductDetailsDomain:(ProductDetailsModel *)productDetailsDomain {
    self = [super init];
    if (self) {
        _productDetailsDomain = productDetailsDomain;
        _productService = [[ProductService alloc] init];
    }
    return self;
}

#pragma mark - Assemblies

#pragma mark - DIAssembly

+ (instancetype)getInstance {
    return sInstance;
}

- (void)setInstance {
    sInstance = self;
}

@end
