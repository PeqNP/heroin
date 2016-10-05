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

/** (Optional) Convenience macro which creates a property that will be injected with the required memory accessors. Note: If you not define the property you will not get auto-complete in Xcode. */
#define di_property(PROPERTY_TYPE, PROPERTY_NAME) \
@property (nonatomic, strong, readonly) PROPERTY_TYPE *PROPERTY_NAME;

#define di_property_protocol(PROPERTY_TYPE, PROPERTY_NAME) \
@property (nonatomic, strong, readonly) id<PROPERTY_TYPE> PROPERTY_NAME;

/** (Optional) Convenience macro to call out an injected property's getter method. */
#define di_method(PROPERTY_TYPE, PROPERTY_NAME) \
- (PROPERTY_TYPE *)PROPERTY_NAME;

/** (Required) Code generates the property's getter method used to return the respective dependency. */
#define di_inject(PROPERTY_TYPE, PROPERTY_NAME) \
- (PROPERTY_TYPE *)PROPERTY_NAME { \
    return [DIServiceLocator getDependency:@OS_STRINGIFY(PROPERTY_NAME)]; \
}

#define di_inject_protocol(PROPERTY_TYPE, PROPERTY_NAME) \
- (id<PROPERTY_TYPE>)PROPERTY_NAME { \
    return [DIServiceLocator getDependency:@OS_STRINGIFY(PROPERTY_NAME)]; \
}

#define di_inject_alias(PROPERTY_TYPE, PROPERTY_NAME, PROPERTY_ALIAS) \
- (PROPERTY_TYPE *)PROPERTY_ALIAS { \
return [DIServiceLocator getDependency:@OS_STRINGIFY(PROPERTY_NAME)]; \
}

#endif /* di_h */
