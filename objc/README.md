
# heroin

Heroin is an extremely small dependency injection library, composed of two macros (~10 lines of code) and a single class to manage dependencies.

## Installation

Download and copy the 'heroin' folder in the root directory of your project. Include all files into your project.

## Benefits

- Provide a declarative syntax, when declaring dependencies, in the interface. The implementation file becomes the definition for which properties are injected.
- An extremely fast implementation. It does not use swizzling or any other run-time magic to provide DI.
- An easy way to add, change or remove (refactor) classes. Many frameworks require you to update a method definition within the assembly, for a given dependency. If you use constructor initialization it's even more cumbersome as you have to change the definition for the init method within the assembly, the header and the implementation files. Changing a dependency is as simple as adding, or removing, the property that is being injected from within the implementation file.
- Provide a library that can be understood by anyone in about 15 minutes. Our projects are already large and complex enough. Having a complex DI library to add into the mix only makes some debugging tasks much more difficult.
- No configuration. The only configuration that your project should have is the configuration of the individual dependencies themselves. It should _not_ be necessary to configure the DI library.
- Tests must ensure that the dependency is being injected. Tests _must_ ensure that the class asks the DI for its respective dependency(ies). Because most DI frameworks are very large, require a lot of setup, and therefore slow down tests when they have to initialize the DI, most tests leave out this very important step. The result is that your tests pass without error, but at run-time the app exhibits unintended behavior (crashing, no-op, etc.).

## Examples

Heroin works with ‘Service Containers’. Containers provide the dependencies that are consumed by class instances. Containers can live for the life of the app, or live temporarily for a specific flow.

### Registering Containers
Note: Registering containers typically happens when the app is first launched.

To register a container, do the following:
```
NSDictionary *config = /* config dict goes here */;
MainContainer *mainContainer = [[MainContainer alloc] initWithConfiguration:config];

[DIServiceLocator registerContainer:mainContainer];
```

To unregister a container:
```
[DIServiceLocator unregisterContainer:mainContainer];
```

### Injecting Dependencies
Before we can inject a dependency, a dependency needs to be associated to a container. Using our previous MainContainer from above, let’s create a property on the container which provides a metrics service.

```
file: MainContainer.h

#import <Foundation/Foundation.h>
#import "DIServiceContainer.h"

@class MetricsService;

@interface MainContainer : NSObject <DIServiceContainer>

@property (nonatomic, strong, readonly) MetricsService *metricsService;

- (instancetype)initWithConfiguration:(NSDictionary *)config;

@end
```

```
file: MainContainer.h

#import "MainContainer.h"
#import "MetricsService.h"

@interface MainContainer ()
@property (nonatomic, strong) MetricsService *metricsService;
@end

@implementation MainContainer

- (instancetype)initWithConfiguration:(NSDictionary *)config {
    self = [super init];
    if (self) {
        _metricsService = [[MetricsService alloc] initWithAppKey:config[@"metrics-app-key"]];
    }
    return self;
}

@end
```

Now that our MainContainer has provided the metrics service, let’s use it in our class.
```
file: ProductDetailsViewController.m

#import "ProductDetailsViewController.h"
#import "di.h"
#import "MetricsService.h"
#import "Product.h"

@interface ProductDetailsViewController ()

// Use the convenience macro to declare our dependency.
di_property(MetricsService, metricsService)

@property (nonatomic, strong) Product *product;

@end

@implementation ProductDetailsViewController

// Use the macro to inject the necessary code to locate the metrics service.
di_inject(MetricsService, metricsService)

/* Init methods, view lifecycle, other methods, etc. */

- (IBAction)didTapBuyButton:(id)sender
{
    [self.metricService logEvent:[NSString stringWithFormat:@"Did tap buy button for product: %@", self.product.id]];
}

@end
```

## Testing
Heroin currently provides support for the Cedar BDD testing framework. Regardless, private methods, in DIServiceLocator+Private.h, are provided to expose the necessary methods to stub/mock the DIServiceLocator for tests.

```
file: ProductDetailsViewControllerSpec.h

#import <Cedar/Cedar.h>
#import "di-cedar.h"
#import "MetricsService.h"
#import "Product.h"

@interface ProductDetailsViewController (SpecHelper)
di_property(MetricsService, metricsService)
@end

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ProductDetailsViewController)

describe(@"ProductDetailsViewController", ^{
    __block ProductService *subject;
    __block MetricsService *metricsService;

    beforeEach(^{
        // This _must_ be called in the first before_each to stub the DIServiceLocator.
        di_fake();

        Product *product = nice_fake_for([Product class]);
        product stub_method(@selector(id)).and_return(@(10));
        subject = [[ProductDetailsViewController alloc] initWithProduct:product];
        
        metricsService = nice_fake_for([MetricsService class]);
        di_stub(metricsService);
    });
    
    describe(@"tap the buy button", ^{
        subjectAction(^{
            [subject didTapBuyButton:nil];
        });
        
        it(@"should have sent a metric", ^{
            metricsService should have_received(@selector(logEvent:)).with(@"Did tap buy button for product: 10");
        });        
    });
});

SPEC_END
```
