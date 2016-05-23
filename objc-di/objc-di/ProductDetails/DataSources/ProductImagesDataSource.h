/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UICollectionView.h>

@class ProductDetailsViewModel;

@interface ProductImagesDataSource : NSObject <UICollectionViewDataSource>

- (instancetype)initWithProductDetailsViewModel:(ProductDetailsViewModel *)viewModel;

@end
