/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "HTTPRequest.h"

@interface HTTPRequest ()
@property (nonatomic, strong) NSString *baseUrl;
@end

@implementation HTTPRequest

- (instancetype)init {
    [self doesNotRecognizeSelector:_cmd];
    return [self initWithBaseUrl:nil];
}

- (instancetype)initWithBaseUrl:(NSString *)baseUrl {
    self = [super init];
    if (self) {
        self.baseUrl = baseUrl;
    }
    return self;
}

- (KSPromise *)requestUrl:(NSURL *)url post:(NSDictionary *)post {
    return nil;
}

- (KSPromise *)requestUrl:(NSURL *)url get:(NSDictionary *)get {
    return nil;
}

@end
