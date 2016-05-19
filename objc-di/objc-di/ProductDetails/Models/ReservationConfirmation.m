/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "ReservationConfirmation.h"

@interface ReservationConfirmation ()
@property (nonatomic, strong) NSString *reservationId;
@property (nonatomic, strong) NSString *message;
@end

@implementation ReservationConfirmation

+ (instancetype)fromDictionary:(NSDictionary *)dict {
    ReservationConfirmation *reservation = [[ReservationConfirmation alloc] init];
    reservation.reservationId = dict[@"reservationid"];
    reservation.message = dict[@"message"];
    return reservation;
}

@end
