/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <objc/runtime.h>

#import "DIServiceLocator.h"

#define EXCLUDED_PROPERTIES @[@"hash", @"superclass", @"description", @"debugDescription"]

@interface DIServiceLocator ()
@property (nonatomic, strong) NSMutableDictionary<NSString*, id<DIServiceContainer>> *dependencies;
@end

static DIServiceLocator *sInstance;

@implementation DIServiceLocator

+ (void)setInstance:(DIServiceLocator *)serviceLocator
{
    sInstance = serviceLocator;
}

+ (instancetype)getInstance
{
    if (!sInstance) {
        sInstance = [[DIServiceLocator alloc] init];
    }
    return sInstance;
}

#pragma mark - Public

+ (void)registerContainer:(id<DIServiceContainer>)container
{
    // TODO: Assert if container has already been registered?
    [[self getInstance] registerContainer:container];
}

+ (void)unregisterContainer:(id<DIServiceContainer>)container
{
    [[self getInstance] unregisterContainer:container];
}

+ (id)getDependency:(NSString *)dependency
{
    return [[self getInstance] getDependency:dependency];
}

#pragma mark - Private

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dependencies = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSArray<NSString *> *)propertiesForContainer:(id<DIServiceContainer>)container
{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([(NSObject *)container class], &count);
    
    NSMutableArray<NSString *> *rv = [NSMutableArray array];
    
    unsigned i;
    for (i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        if (![EXCLUDED_PROPERTIES containsObject:name]) {
            [rv addObject:name];
        }
    }
    
    free(properties);
    
    return rv;
}

- (void)registerContainer:(id<DIServiceContainer>)container
{
    NSArray<NSString *> *properties = [self propertiesForContainer:container];
    for (NSString *property in properties) {
        id<DIServiceContainer> existingContainer = [self.dependencies objectForKey:property];
        if (existingContainer) {
            __unused NSString *error = [NSString stringWithFormat:@"The container (%@) contains dependency (%@) which is already provided by container (%@).", NSStringFromClass([(NSObject *)container class]), property, NSStringFromClass([(NSObject *)existingContainer class])];
            NSAssert(false, error);
        }
        else {
            [self.dependencies setObject:container forKey:property];
        }
    }
}

- (void)unregisterContainer:(id<DIServiceContainer>)container
{
    // TODO: Test
    NSDictionary<NSString*, id<DIServiceContainer>> *dependencies = [self.dependencies copy];
    for (NSString *property in dependencies) {
        if ([self.dependencies objectForKey:property] == container) {
            [self.dependencies removeObjectForKey:property];
        }
    }
}

- (id)getDependency:(NSString *)dependency
{
    id<DIServiceContainer> container = [self.dependencies valueForKey:dependency];
    if (container) {
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        id instance = [(NSObject *)container performSelector:NSSelectorFromString(dependency)];
        #pragma clang diagnostic pop
        return instance;
    }
    __unused NSString *error = [NSString stringWithFormat:@"Container which provides dependency for %@ has not been registered.", dependency];
    NSAssert(false, error);
    return nil;
}

@end
