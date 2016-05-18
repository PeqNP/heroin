/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#ifndef di_h
#define di_h

/** Inject singleton instance, owned by DI Assembly, into dependent instance. */
#define di_property(PROPERTY_TYPE, PROPERTY_NAME) \
@property (nonatomic, strong, readonly) PROPERTY_TYPE *PROPERTY_NAME;

#define di_inject(ASSEMBLY_NAME, PROPERTY_TYPE, PROPERTY_NAME) \
- (PROPERTY_TYPE *)PROPERTY_NAME { \
    return [[ASSEMBLY_NAME getInstance] PROPERTY_NAME]; \
}

/** Cedar test convenience macros. TODO: These can live somewhere else. */
#define di_fake_assembly(ASSEMBLY_NAME) \
({ \
    ASSEMBLY_NAME *inst = nice_fake_for([ASSEMBLY_NAME class]); \
    spy_on([ASSEMBLY_NAME class]); \
    [ASSEMBLY_NAME class] stub_method(@selector(getInstance)).and_return(inst); \
    inst; \
})

#define di_unfake_assembly(ASSEMBLY_NAME) \
stop_spying_on([ASSEMBLY_NAME class]);


#endif /* di_h */
