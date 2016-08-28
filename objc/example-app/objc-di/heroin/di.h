/**
 heroin
 
 This DI framework is composed of these macros, a service locater, and a protocol (which may
 may be removed at a later time if a good reason can't be named to keep it).
 
 The macros are simple.
   1) di_property is used to define the property that is intended to be injected with the appropriate memory access. It is _not_ necessary to use this macro. However, using it makes it obvious as to which properties are injected.
   2) di_inject is responsible for injecting the code necessary to get the dependency.
 
 The responsibility of the DIServiceLocator is to lazy load, and return, the respective dependency required by the class.
 
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#ifndef di_h
#define di_h

#import "DIServiceLocator.h"

/** Create property that will be injected with the required memory accessors. */
#define di_property(PROPERTY_TYPE, PROPERTY_NAME) \
@property (nonatomic, strong, readonly) PROPERTY_TYPE *PROPERTY_NAME;

/** Code gen getter method to return property's depenency. */
#define di_inject(PROPERTY_TYPE, PROPERTY_NAME) \
- (PROPERTY_TYPE *)PROPERTY_NAME { \
    return [DIServiceLocator getDependency:@OS_STRINGIFY(PROPERTY_NAME)]; \
}

#endif /* di_h */
