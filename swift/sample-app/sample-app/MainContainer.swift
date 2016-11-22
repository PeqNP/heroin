import Foundation

class MainContainer: DIContainer {
    public let metricsService: MetricsService

    init() {
        metricsService = MetricsService()
    }
}
