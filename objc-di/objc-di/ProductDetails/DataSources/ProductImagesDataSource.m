/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "ProductImagesDataSource.h"

@interface ProductImagesDataSource ()
@property (nonatomic, strong) ProductDetailsViewModel *viewModel;
@end

@implementation ProductImagesDataSource

- (instancetype)initWithProductDetailsViewModel:(ProductDetailsViewModel *)viewModel {
    self = [super init];
    if (self) {
        _viewModel = self.viewModel;
    }
    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
