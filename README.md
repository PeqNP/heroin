# heroin

A simple dependency injection pattern for Objective-C.

Replace your DI framework with a single file consisting of ~6 lines of macro code. This dependency injection model does not use swizzling or any other run-time magic to provide dependency injection. It is extremely simple, yet provides the same feature set as most DI frameworks.

By using this model you get:
- Self documenting implementation files. The implementation file becomes the definition of which properties are injected.
- An extremely fast implementation. It does not use swizzling or any other run-time magic to provide DI.
- An easy way to add, change or remove (refactor) classes. Many frameworks require you to update a method definition within the assembly, for a given dependency. If you use constructor initialization it's even more cumbersome as you have to change the definition for the init method within the assembly, the header and the implementation files. Changing a dependency is as simple as adding, or removing, the property that is being injected from within the implementation file.

## How does it work?

Macros are used to generate the property and implementation code which is used to request the respective dependency from a DI Service Locater. Typically a Service Locator is an anti-pattern in the context of DI. That being said, this specific pattern mitigates the anti-pattern entirely by providing a mapping layer which hides the assembly responsible for providing the dependency. In effect, this does exactly what all DI frameworks do.

## The cons

You must use a macro to code-gen the respective getter method within your implementation file. This is a single additional step all DI frameworks do not require. What offsets this con is that it produces less code necessary to inject the property, keeps the definition of the injected properties contained within a single file and removes a large dependency from your codebase.

## TODO

- (?) Remove setInstance and remove from DIAssembly protocol.
- Remove need to call afterEach in Cedar specs.
- Methods to unset/destroy singleton instances for short-living assemblies. NOTE: This may actually not be necessary.
  - Example showing the life-cycle of short-lived assemblies.
- Move Specs into the Specs group and group the specs in the same way as the module is organized.
