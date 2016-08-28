/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

@class ProductDetailsViewModel;
@class SKU;

@interface SKUThumbnailViewModel : NSObject

@property (nonatomic, strong, readonly) UIImage *image;
@property (nonatomic, strong, readonly) NSString *name;

- (instancetype)initWithProductDetailsViewModel:(ProductDetailsViewModel *)productDetailsViewModel sku:(SKU *)sku;

- (void)select;

@end
