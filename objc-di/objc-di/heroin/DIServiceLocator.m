/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import <objc/runtime.h>

#import "DIServiceLocator.h"

#define EXCLUDED_PROPERTIES @[@"hash", @"superclass", @"description", @"debugDescription"]

@interface DIServiceLocator ()
@property (nonatomic, strong) NSMutableDictionary<NSString*, id<DIAssembly>> *dependencies;
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

+ (void)registerAssembly:(id<DIAssembly>)assembly
{
    // TODO: Assert if assembly has already been registered?
    [[self getInstance] registerAssembly:assembly];
}

+ (void)unregisterAssembly:(id<DIAssembly>)assembly
{
    [[self getInstance] unregisterAssembly:assembly];
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

- (NSArray<NSString *> *)propertiesForAssembly:(id<DIAssembly>)assembly
{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([(NSObject *)assembly class], &count);
    
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

- (void)registerAssembly:(id<DIAssembly>)assembly
{
    NSArray<NSString *> *properties = [self propertiesForAssembly:assembly];
    for (NSString *property in properties) {
        id<DIAssembly> existingAssembly = [self.dependencies objectForKey:property];
        if (existingAssembly) {
            NSString *error = [NSString stringWithFormat:@"The assembly (%@) contains dependency (%@) which is already provided by assembly (%@).", NSStringFromClass([(NSObject *)assembly class]), property, NSStringFromClass([(NSObject *)existingAssembly class])];
            NSAssert(false, error);
        }
        else {
            [self.dependencies setObject:assembly forKey:property];
        }
    }
}

- (void)unregisterAssembly:(id<DIAssembly>)assembly
{
    // TODO: Test
    NSDictionary<NSString*, id<DIAssembly>> *dependencies = [self.dependencies copy];
    for (NSString *property in dependencies) {
        if ([self.dependencies objectForKey:property] == assembly) {
            [self.dependencies removeObjectForKey:property];
        }
    }
}

- (id)getDependency:(NSString *)dependency
{
    id<DIAssembly> assembly = [self.dependencies valueForKey:dependency];
    if (assembly) {
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        id instance = [(NSObject *)assembly performSelector:NSSelectorFromString(dependency)];
        #pragma clang diagnostic pop
        return instance;
    }
    NSString *error = [NSString stringWithFormat:@"Assembly which provides dependency for %@ has not been registered.", dependency];
    NSAssert(false, error);
    return nil;
}

@end
