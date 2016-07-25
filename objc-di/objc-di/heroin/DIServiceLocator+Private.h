
#import "DIServiceLocator.h"

@interface DIServiceLocator (Private)

+ (void)setInstance:(DIServiceLocator *)serviceLocator;
+ (instancetype)getInstance;

- (id)getDependency:(NSString *)dependency;

@end
