import XCTest
@testable import sample_app

class sample_appTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        di_clear() // Put this in a global setUp method.
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        di_stub(type: MetricsService.self, value: MetricsService())
        _ = MyClass()
    }
}
