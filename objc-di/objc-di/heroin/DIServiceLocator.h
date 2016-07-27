/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

@protocol DIAssembly;

@interface DIServiceLocator : NSObject

+ (void)registerAssembly:(id<DIAssembly>)assembly;
+ (void)unregisterAssembly:(id<DIAssembly>)assembly;
+ (id)getDependency:(NSString *)dependency;

@end
