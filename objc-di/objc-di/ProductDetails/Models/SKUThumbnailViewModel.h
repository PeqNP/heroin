/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

@interface SKUThumbnailViewModel : NSObject

@property (nonatomic, assign, readonly) BOOL isImageLoading;

@property (nonatomic, strong, readonly) UIImage *image;
@property (nonatomic, strong, readonly) NSString *name;

@end
