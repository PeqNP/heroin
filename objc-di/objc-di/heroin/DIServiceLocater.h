/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

@protocol DIAssembly;

@interface DIServiceLocater : NSObject

+ (void)registerAssembly:(id<DIAssembly>)assembly;
+ (id)getDependency:(Class)classRef;

@end
