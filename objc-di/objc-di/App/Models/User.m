/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "User.h"

@interface User ()
@property (nonatomic, strong) NSString *sessionId;
@end

@implementation User

- (instancetype)init {
    [self doesNotRecognizeSelector:_cmd];
    return [self initWithSessionId:nil];
}

- (instancetype)initWithSessionId:(NSString *)sessionId {
    self = [super init];
    if (self) {
        self.sessionId = sessionId;
    }
    return self;
}

@end
