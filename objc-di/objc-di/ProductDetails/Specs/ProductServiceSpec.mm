#import <Cedar/Cedar.h>
#import "ProductService.h"
#import "MainAssembly.h"
#import "MetricsService.h"
#import "HTTPRequest.h"
#import "di.h"
#import "KSDeferred.h"
#import "Product.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ProductServiceSpec)

describe(@"ProductService", ^{
    __block ProductService *subject;
    __block MainAssembly *mainAssembly;
    __block MetricsService *metricsService;
    __block HTTPRequest *httpRequest;

    beforeEach(^{
        metricsService = nice_fake_for([MetricsService class]);
        httpRequest = nice_fake_for([HTTPRequest class]);
        mainAssembly = di_fake_assembly(MainAssembly);
        mainAssembly stub_method(@selector(metricsService)).and_return(metricsService);
        mainAssembly stub_method(@selector(httpRequest)).and_return(httpRequest);
        
        subject = [[ProductService alloc] init];
    });
    
    afterEach(^{
        // TODO: Remove.
        di_unfake_assembly(MainAssembly);
    });
    
    describe(@"fetch a product", ^{
        __block KSDeferred *deferred;
        __block NSError *error;
        __block Product *product;

        beforeEach(^{
            product = nil;
            error = nil;
            
            deferred = [KSDeferred defer];
            httpRequest stub_method(@selector(request:post:)).and_return(deferred.promise);
        });
        
        subjectAction(^{
            [[subject promiseForProductWithId:@"1234"] then:^id(Product *value) {
                product = value;
                return value;
            } error:^id(NSError *value) {
                error = error;
                return error;
            }];
        });
        
        it(@"should have sent a metric", ^{
            metricsService should have_received(@selector(logEvent:)).with(@"RequestedProduct");
        });
        
        context(@"when the request succeeds", ^{
            beforeEach(^{
                [deferred resolveWithValue:@{@"productid": @"3", @"name": @"Good-For-You Suppository"}];
            });
            
            it(@"should have returned a product", ^{
                product.productId should equal(@"3");
                product.name should equal(@"Good-For-You Suppository");
            });
        });
        
        context(@"when the request fails", ^{
            __block NSError *expectedError;
            
            beforeEach(^{
                expectedError = [NSError errorWithDomain:@"TestDomain" code:-1 userInfo:@{NSLocalizedDescriptionKey: @"An error occurred"}];
                [deferred rejectWithError:expectedError];
            });
            
            it(@"should pass-thru the error coming from response", ^{
                error should equal(expectedError);
            });
        });
    });
});

SPEC_END
