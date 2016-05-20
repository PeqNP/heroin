/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "ProductDetailsViewController.h"

@interface ProductDetailsViewController ()
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

@end
