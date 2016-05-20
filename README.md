# heroin

A simple dependency injection pattern for Objective-C.

Replace your DI framework with a single file consisting of ~6 lines of macro code. This dependency injection model does not use swizzling or any other run-time magic to provide dependency injection. It is extremely simple, yet provides the same feature set as most DI frameworks.

By using this model you get:
- Self documenting implementation files. The implementation file becomes the definition of which properties are injected. This provides a crystal clear, logical path to how depencies are wired into your dependent classes.
- An extremely fast implementation. It does not use swizzling or any other run-time magic to provide DI. Code-gen is used to provide compile-time checks. This enables you to quickly identify issues at _compile_ time and avoid having issues where dependencies are wired incorrectly at run-time.
- Can easily refactor classes. Many frameworks require you to update a method definition, if you use constructor initialization. This foregoes the need for constructor injection as well as any other "magic" dependency injection (such as annotating properties in comments), by requiring you to have visiiblity of the dependencies your classes require.
- Macros to easily stub assemblies at test time when using the Cedar testing framework.

The pattern used by this project is referred to as a Service Locater. It does not use dependency inversion. Dependency inversion, by its nature, _hides_ where the dependency originates from. Dependency inversion simply says, "I need this thing. Give it me. I don't care where or how you do it." This pattern _requires_ you to know where you get your dependencies, which in turn require you to know the assemblies responsible for providing the dependency. This provides a much greater level of code clarity, which is necessary in large projects. Necessary, because as your project becomes larger, and more complex, dependencies are *much* more difficult to track where they originate from. In addition, this pattern has the side-effect of enforcing developers to think which dependencies should live in which assemblies as the developer will _see_ that they are asking for the dependency from the same assembly. Doing this shrinks your assemblies to contain only the dependencies it needs. This prevents God assemblies where every single dependency is in a single assembly.

## TODO

- (?) Remove setInstance and remove from DIAssembly protocol.
- Remove need to call afterEach in Cedar specs.
- Methods to unset/destroy singleton instances for short-living assemblies. NOTE: This may actually not be necessary.
  - Example showing the life-cycle of short-lived assemblies.
- Move Specs into the Specs group and group the specs in the same way as the module is organized.
