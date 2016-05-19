#import <Cedar/Cedar.h>
#import "ProductDetailsViewModel.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ProductDetailsViewModelSpec)

describe(@"ProductDetailsViewModel", ^{
    __block ProductDetailsViewModel *subject;

    beforeEach(^{
        subject = [[ProductDetailsViewModel alloc] init];
    });
});

SPEC_END
