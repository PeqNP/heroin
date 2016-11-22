/**
 Provides a simple method to inject dependencies.
 
 - copyright: (c) 2016 Upstart Illustration LLC. All rights reserved.
 */

import Foundation

private let di = DIServiceLocator()

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

 This is used when the name of the property is the same name as the class with the first letter is lowercase:
 ```
 public let metricsService: MetricsService
 ```
 
 When the name of the property deviates from the name of the class you would use the di_inject(name:) method.
 
 - parameter property: The class of the dependency to inject.
 - returns: The instance of the dependency. The app will crash if the dependency is not found.
 */
public func di_inject(_ property: AnyClass) -> Any {
    let className = String(describing: property)
    var chars = Array(className.characters)
    let firstLetter = String(chars[0]).lowercased()
    let firstLetterChars = Array(firstLetter.characters)
    chars[0] = firstLetterChars[0]
    let propertyName = String(chars)
    return di.inject(propertyName)
}

/**
 Inject a dependency given the class's property name.
 
 When the name of the property does not follow the convention, where the property name of the dependency is the same name as the class but with a lowercase first letter, you will use this method.
 
 This is necessary when you have two different instances of the same class. A common use is when defining an instance of an HTTP builder, where one is a builder for non-secure URLs using 'http' and another for secure URLS using 'https':
 ```
 public let httpService: HTTPService // Use di_inject(property: AnyClass) for this property
 public let httpsService: HTTPService // Use di_inject(name: String) for this property
 ```
 
 Here is an example of how you would inject both of these dependencies:
 ```
 class MyClass {
    private let httpService = di_inject(HTTPService.self)
    private let httpsService = di_Inject("httpsService")
 }
 ```
 
 - parameter name: The name of the property assocaited to the dependency.
 - returns: The instance of the dependency. The app will crash if the dependency is not found.
 */
public func di_inject(_ name: String) -> Any {
    return di.inject(name)
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
public func di_stub(class: AnyClass, value: Any) {

}

/**
 Associate a name of a dependency with corresponding value. This should only be used in test.
 
 */
public func di_stub(name: AnyClass, value: Any) {

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
