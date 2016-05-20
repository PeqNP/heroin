/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "OnDemandImageView.h"
#import "di.h"
#import "MainAssembly.h"
#import "HTTPRequest.h"

@interface OnDemandImageView ()

di_property(HTTPRequest, imageRequest)

@property (nonatomic, strong) NSURL *url;

@end

@implementation OnDemandImageView

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
