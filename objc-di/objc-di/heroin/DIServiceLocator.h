/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

@protocol DIServiceContainer;

@interface DIServiceLocator : NSObject

+ (void)registerContainer:(id<DIServiceContainer>)container;
+ (void)unregisterContainer:(id<DIServiceContainer>)container;
+ (id)getDependency:(NSString *)dependency;

@end
