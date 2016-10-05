/**
 Provide convenience methods to use in Cedar tests.
 
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#ifndef di_cedar_h
#define di_cedar_h

#import "DIServiceLocator+Private.h"
#import "di.h"

#define di_fake() \
[DIServiceLocator setInstance:nice_fake_for([DIServiceLocator class])];

#define di_unfake() \
[DIServiceLocator setInstance:nil];

#define di_stub(PROPERTY_NAME) \
[DIServiceLocator getInstance] stub_method(@selector(getDependency:)).with(@OS_STRINGIFY(PROPERTY_NAME)).and_return(PROPERTY_NAME);

#endif /* di_cedar_h */
