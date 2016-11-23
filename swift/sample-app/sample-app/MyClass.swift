import Foundation

class MyClass {
    private let metricsService = di_inject(MetricsService.self)
    
    init() {
        print(metricsService.name)
    }
}
