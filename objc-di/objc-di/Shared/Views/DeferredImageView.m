/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "DeferredImageView.h"
#import "di.h"
#import "MainAssembly.h"
#import "HTTPRequest.h"

@interface DeferredImageView ()

di_property(HTTPRequest, imageRequest)

@property (nonatomic, strong) NSURL *url;

@end

@implementation DeferredImageView

di_inject(MainAssembly, HTTPRequest, imageRequest)

- (instancetype)initWithUrl:(NSURL *)url {
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}

// TODO: When in view, display loading indicator, load image and then display it.

@end
