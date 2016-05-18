# objc-di

A simple dependency injector for Objective-C.

Replace your DI framework with a single file consisting of ~15 lines of code. This dependency injection model does not use swizzling or any other run-time magic to provide dependency injection. It is extremely simple, yet provides the same feature set as most DI frameworks.

By using this model you get:
- A clear understanding between your dependencies and the dependents that use them.
- Self documenting implementation files. It is easy to determine which properties are being injected.
- An extremely fast implementation. It does not use swizzling or any other run-time magic to provide DI.
- Macro for easy stubbing of assemblies when using the Cedar testing framework.
