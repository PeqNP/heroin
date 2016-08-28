/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "ProductDetailsViewModel.h"
#import "di.h"
#import "BannerNotification.h"
#import "ProductDetailsModel.h"
#import "Product.h"
#import "RACSignal.h"
#import "RACSubscriber.h"

@interface ProductDetailsViewModel ()

@property (nonatomic, strong) RACSignal *loadingSkuSignal;
@property (nonatomic, strong) RACSignal *reserveProductSignal;
@property (nonatomic, strong) RACSignal *addToShoppingCartSignal;
@property (nonatomic, strong) RACSignal *bannerSignal;

@property (nonatomic, strong) ProductDetailsModel *productDetailsModel;

@end

@implementation ProductDetailsViewModel

- (instancetype)init {
    [self doesNotRecognizeSelector:_cmd];
    return [self initWithProductDetailsModel:nil];
}

- (instancetype)initWithProductDetailsModel:(ProductDetailsModel *)productDetailsModel {
    self = [super init];
    if (self) {
        _productDetailsModel = productDetailsModel;
    }
    return self;
}

#pragma mark - Private

- (void)createSignals {
//    self.addToShoppingCartSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [subscriber sendNext:@YES];
//        [subscriber sendCompleted];
//    }];
}

#pragma mark - Properties

// FIXME: Leaking encapsulation. Is this OK so long as Product is an immutable object?

- (NSString *)productId {
    return self.productDetailsModel.product.productId;
}

- (NSString *)productName {
    return self.productDetailsModel.product.name;
}

- (NSString *)productPrice {
    return self.productDetailsModel.product.price;
}

- (NSArray<NSURL *> *)productImageUrls {
    return self.productDetailsModel.product.imageUrls;
}


#pragma mark - ViewModels

- (ProductInfoViewModel *)productInfo {
    return nil;
}

- (NSArray<SKUThumbnailViewModel *> *)skuThumbnails {
    return nil;
}

- (CustomerReviewSummaryViewModel *)customerReviewSummary {
    return nil;
}

- (NSArray<SuggestedProductViewModel *> *)suggestedProducts {
    return nil;
}

#pragma mark - Actions

- (void)addToShoppingCart {
    [[self.productDetailsModel addToShoppingCart] then:^id _Nullable(id empty) {
        return empty;
    } error:^id(NSError *error) {
//        self.bannerSignal = [[BannerNotification alloc] initWithType:BannerNotificationTypeError title:@"Shopping Cart Error" message:@"Failed to add product to your shopping cart. Call 1.888.HELP.MEOW"];
        return error;
    }];
    
}

- (void)reserveProductForPickup {
    
}

- (void)selectSku:(SKU *)sku {
    
}

@end
