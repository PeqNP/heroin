import Foundation
import NBApi

protocol DIContainer {

}

struct DIDependency {
    public let container: DIContainer?
    public let value: Any
}

class DIServiceLocator {
    private var containers: [DIContainer] = [DIContainer]()
    private var dependencies: [String : DIDependency] = [String : DIDependency]()

    /**
     Inject a property with a dependency registered with the service locator.
     */
    internal func inject(_ property: String) -> Any? {
        if let dependency = dependencies[property] {
            return dependency.value
        }
        return nil
    }

    /**
     Register a DI container which provides dependencies.
     */
    internal func register(container: DIContainer) {
        let mirrored = Mirror(reflecting: container)
        //Gets all properties from container instance
        for (_, attr) in mirrored.children.enumerated() {
            if let property_name = attr.label as String! {
                if let dependency = dependencies[property_name] {
                    let description = "The dependency \(property_name) for container \(String(describing: container.self)) has already been registered by a container \(String(describing: dependency.container))"
                    assert(false, description)
                }
                dependencies[property_name] = DIDependency(container: container, value: attr.value)
            }
        }
        containers.append(container)
    }

    internal func clean() {
        containers = [DIContainer]()
        dependencies = [String : DIDependency]()
    }

    internal func stub(property: String, value: Any) {
        dependencies[property] = DIDependency(container: nil, value: value)
    }
}
