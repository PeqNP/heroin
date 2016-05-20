/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "BannerNotification.h"

@implementation BannerNotification

- (instancetype)init {
    [self doesNotRecognizeSelector:_cmd];
    return [self initWithType:BannerNotificationTypeError title:nil message:nil];
}

- (instancetype)initWithType:(BannerNotificationType)type title:(NSString *)title message:(NSString *)message {
    self = [super init];
    if (self) {
        _type = type;
        _title = title;
        _message = message;
    }
    return self;
}

@end
