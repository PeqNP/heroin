/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#ifndef di_h
#define di_h

#define di_property(PROPERTY_TYPE, PROPERTY_NAME) \
@property (nonatomic, strong, readonly) PROPERTY_TYPE *PROPERTY_NAME;

#define di_inject(ASSEMBLY_NAME, PROPERTY_TYPE, PROPERTY_NAME) \
- (PROPERTY_TYPE *)PROPERTY_NAME { \
    return [[ASSEMBLY_NAME getInstance] PROPERTY_NAME]; \
}

#endif /* di_h */
