/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "CustomerReview.h"

@interface CustomerReview ()
@property (nonatomic, strong) NSString *customerAlias;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) float rating;
@end

@implementation CustomerReview

+ (instancetype)fromDictionary:(NSDictionary *)dict {
    CustomerReview *review = [[CustomerReview alloc] init];
    review.customerAlias = dict[@"customeralias"];
    review.message = dict[@"message"];
    review.rating = [dict[@"rating"] floatValue];
    return review;
}

@end
