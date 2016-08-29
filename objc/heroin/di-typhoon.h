/**
 Typhoon helper class which allows integration with Typhoon DI framework.
 
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#ifndef di_typhoon_h
#define di_typhoon_h

#import "DIServiceLocator.h"

/** Method to get dependency from DIServiceLocator and returns a TyphoonDefinition. */
#define di_inject_typhoon(PROPERTY_TYPE, PROPERTY_NAME) \
- (PROPERTY_TYPE *)PROPERTY_NAME { \
    return [TyphoonDefinition withFactory:[DIServiceLocator class] selector:@selector(getDependency:) parameters:^(TyphoonMethod *factoryMethod) { \
            [factoryMethod injectParameterWith:OS_STRINGIFY(PROPERTY_NAME)]; \
        }]; \
}

#define di_inject_alias_typhoon(PROPERTY_TYPE, PROPERTY_NAME, ALIAS_NAME) \
- (PROPERTY_TYPE *)PROPERTY_ALIAS { \
    return [TyphoonDefinition withFactory:[DIServiceLocator class] selector:@selector(getDependency:) parameters:^(TyphoonMethod *factoryMethod) { \
            [factoryMethod injectParameterWith:OS_STRINGIFY(PROPERTY_NAME)]; \
        }]; \
}

#endif /* di_typhoon_h */
