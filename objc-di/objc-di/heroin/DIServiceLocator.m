/**
 Copyright (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

#import "DIServiceLocater.h"

@interface DIServiceLocater ()
@property (nonatomic, strong) NSMutableArray<id<DIAssembly>> *assemblies;
@end

static DIServiceLocater *sInstance;

@implementation DIServiceLocater

+ (instancetype)getInstance
{
    if (!sInstance) {
        sInstance = [[DIServiceLocater alloc] init];
    }
    return sInstance;
}

#pragma mark - Public

+ (void)registerAssembly:(id<DIAssembly>)assembly
{
    // TODO: Assert if assembly has already been registered?
    [[self getInstance] registerAssembly:assembly];
}

+ (id)getDependency:(Class)classRef
{
    // TODO: Return the dependnecy which maps to the given class.
    // TODO: Instead of class, use selector as key. If selector does not exist on any assembly, throw Exception.
    return nil;
}

#pragma mark - Private

- (instancetype)init
{
    self = [super init];
    if (self) {
        _assemblies = [NSMutableArray array];
    }
    return self;
}

- (void)registerAssembly:(id<DIAssembly>)assembly
{
    // TODO: Register all methods associated to assembly to create tree which provides a given dependency.
    // If there is a duplicate depenency, call it out here.
    [self.assemblies addObject:assembly];
}

@end
