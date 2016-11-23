/**
 Provides a simple method to inject dependencies.
 
 - copyright: (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

import Foundation

private let di = DIServiceLocator()

private func get_property_name<T>(_ property: T.Type) -> String {
    let className = String(describing: property.self)
    var chars = Array(className.characters)
    let firstLetter = String(chars[0]).lowercased()
    let firstLetterChars = Array(firstLetter.characters)
    chars[0] = firstLetterChars[0]
    let propertyName = String(chars)
    return propertyName
}

/**
 Register a container with the DI service.
 
 - parameter containers: A list of DIContainer.
 */
public func di_register(containers: [DIContainer]) {
    for container in containers {
        di.register(container: container)
    }
}

/**
 Register a single container with the DI Service.

 */
public func di_register(container: DIContainer) {
    di.register(container: container)
}

/**
 Inject a dependency given the class type.

 When there is only a single instance of a given class, it is expected to name the variable the same as the class but with the first letter lowercased. For instance, the property name for the instance of 'MetricsService' will be 'metricsService'. This is provided as a convience.
 ```
 public let metricsService: MetricsService
 ```
 
 When the name of the property deviates from the name of the class you would then provide the 'name' of the public property which references the instance of the class. Below is an example where there are two instance of the `HTTPService` object. One is for HTTP, which uses the naming convention of having the first letter lowercase, and the other for HTTPS, which adds an 's' at the end of 'http'.
 ```
 public let httpService: HTTPService // Use di_inject(property: AnyClass) for this property
 public let httpsService: HTTPService // Use di_inject(name: String) for this property
 ```
 
 This is how you would inject both of these dependencies:
 ```
 class MyClass {
    private let httpService = di_inject(HTTPService.self)
    private let httpsService = di_inject(HTTPService.self, name: "httpsService")
 }
 ```
 
 - parameter property: The class of the dependency to inject.
 - parameter name: (optional) The name of the property associated to the dependency.
 - returns: The instance of the dependency. The app will crash if the dependency is not found.
 */
public func di_inject<T>(_ type: T.Type, name: String? = nil) -> T {
    if let propertyName = name {
        return di.inject(propertyName) as! T
    }
    let propertyName = get_property_name(type)
    return di.inject(propertyName) as! T
}

/**
 Clear all dependencies previously used by the DI. This should only be used in test before.

 */
public func di_clear() {
    di.clear()
}

/**
 Associate a class dependency with a value. This should only be used in test.

 */
public func di_stub<T>(type: T.Type, value: Any) {
    let name = get_property_name(type)
    di.stub(property: name, value: value)
}

/**
 Associate a name of a dependency with corresponding value. This should only be used in test.
 
 */
public func di_stub(name: String, value: Any) {
    di.stub(property: name, value: value)
}

public protocol DIContainer {

}

private struct DIDependency {
    public let container: DIContainer?
    public let value: Any
}

private class DIServiceLocator {
    private var containers: [DIContainer] = [DIContainer]()
    private var dependencies: [String : DIDependency] = [String : DIDependency]()

    /**
     Inject a property with a dependency registered with the service locator.
     */
    internal func inject(_ property: String) -> Any {
        if let dependency = dependencies[property] {
            return dependency.value
        }
        assert(false, "property \(property) has not been registered with any container.")
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

    internal func clear() {
        containers = [DIContainer]()
        dependencies = [String : DIDependency]()
    }

    internal func stub(property: String, value: Any) {
        dependencies[property] = DIDependency(container: nil, value: value)
    }
}
