/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "HTTPRequest.h"
#import "di.h"
#import "MainAssembly.h"
#import "User.h"
#import "KSDeferred.h"

@interface HTTPRequest ()
di_property(User, user)
@property (nonatomic, strong) NSURL *baseUrl;
@end

@implementation HTTPRequest

di_inject(MainAssembly, User, user)

- (instancetype)init {
    [self doesNotRecognizeSelector:_cmd];
    return [self initWithBaseUrl:nil];
}

- (instancetype)initWithBaseUrl:(NSString *)baseUrl {
    self = [super init];
    if (self) {
        self.baseUrl = [NSURL URLWithString:baseUrl];
    }
    return self;
}

- (KSPromise *)request:(NSString *)endpoint post:(NSDictionary *)post {
    NSURLSessionConfiguration *config = [[NSURLSessionConfiguration defaultSessionConfiguration] copy];
    config.HTTPAdditionalHeaders = @{
        @"Content-Type": @"application/json",
        @"Accept": @"application/json",
        @"Bearer": self.user.sessionId
    };
    
    NSURL *url = [NSURL URLWithString:endpoint relativeToURL:self.baseUrl];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:post options:kNilOptions error:nil];;
    
    KSDeferred *defer = [KSDeferred defer];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        if (error) {
            [defer rejectWithError:error];
            return;
        }
        [defer resolveWithValue:@(YES)];
    }];
    [task resume];
    return defer.promise;
}

- (KSPromise *)request:(NSString *)endpoint get:(NSDictionary *)get {
    return nil;
}

@end
