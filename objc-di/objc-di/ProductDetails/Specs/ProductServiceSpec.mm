#import <Cedar/Cedar.h>
#import "ProductService.h"
#import "MainAssembly.h"
#import "MetricsService.h"
#import "HTTPRequest.h"
#import "di.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ProductServiceSpec)

describe(@"ProductService", ^{
    __block ProductService *subject;
    __block MainAssembly *mainAssembly;
    __block MetricsService *metricsService;

    beforeEach(^{
        metricsService = nice_fake_for([MetricsService class]);
        mainAssembly = di_fake_assembly(MainAssembly);
        mainAssembly stub_method(@selector(metricsService)).and_return(metricsService);
        
        subject = [[ProductService alloc] init];
    });
    
    describe(@"fetch a product", ^{
        subjectAction(^{
            
        });
        
        it(@"should have sent a metric", ^{
            
        });
        
        context(@"when the request succeeds", ^{
            beforeEach(^{
                
            });
        });
        
        context(@"when the request fails", ^{
            
        });
    });
});

SPEC_END
