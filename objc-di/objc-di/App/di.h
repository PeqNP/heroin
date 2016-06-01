/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#ifndef di_h
#define di_h

#import "DIServiceLocater.h"

/** Create property that will be injected with the required memory accessors. */
#define di_property(PROPERTY_TYPE, PROPERTY_NAME) \
@property (nonatomic, strong, readonly) PROPERTY_TYPE *PROPERTY_NAME;

/** Code gen getter method to return property's depenency. */
#define di_inject(PROPERTY_TYPE, PROPERTY_NAME) \
- (PROPERTY_TYPE *)PROPERTY_NAME { \
    return [DIServiceLocater getDependency:[PROPERTY_TYPE class]]; \
}

#endif /* di_h */
