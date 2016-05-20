/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

@interface ReservationConfirmation : NSObject

@property (nonatomic, strong, readonly) NSString *reservationId;
@property (nonatomic, strong, readonly) NSString *message;

+ (instancetype)fromDictionary:(NSDictionary *)dict;

@end
