/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "ProductDetailsViewController.h"
#import "ProductDetailsViewModel.h"
#import "RACSignal.h"
//#import "NSObject+RACPropertySubscribing.h"

@interface ProductDetailsViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *produtImagesCollectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *productImagesPageControl;
@property (weak, nonatomic) IBOutlet UICollectionView *skuThumbnailsCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *reserveProductButton;
@property (weak, nonatomic) IBOutlet UIButton *addToShoppingCartButton;

@property (nonatomic, strong) ProductDetailsViewModel *viewModel;

@end

@implementation ProductDetailsViewController

- (instancetype)initWithProductDetailsViewModel:(ProductDetailsViewModel *)viewModel {
    self = [super init];
    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

// bindToViewModel:
- (void)registerSignals {
    [self.viewModel.loadingSkuSignal subscribeNext:^(UIImage *skuImage) {
        // Referesh product image co
    }];
}

@end
