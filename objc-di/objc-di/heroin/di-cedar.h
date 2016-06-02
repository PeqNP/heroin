/**
 Provide convenience methods to use in Cedar tests.
 
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#ifndef di_cedar_h
#define di_cedar_h

#import "di.h"

#define di_spy_sl() \
spy_on([DIServiceLocator class])

#define di_unspy_sl() \
stop_spying_on([DIServiceLocator class])

#define di_stub_sl(PROPERTY_NAME) \
[DIServiceLocator class] stub_method(@selector(PROPERTY_NAME)).and_return(PROPERTY_NAME)

#endif /* di_cedar_h */
