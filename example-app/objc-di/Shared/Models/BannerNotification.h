/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BannerNotificationType) {
    BannerNotificationTypeInfo,
    BannerNotificationTypeWarning,
    BannerNotificationTypeError
};

@interface BannerNotification : NSObject

@property (nonatomic, assign, readonly) BannerNotificationType type;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *message;

// TODO: Add button options, title and block, that the view model can then use to perform action depending on user input. Button:title,action

- (instancetype)initWithType:(BannerNotificationType)type title:(NSString *)title message:(NSString *)message NS_DESIGNATED_INITIALIZER;

@end
