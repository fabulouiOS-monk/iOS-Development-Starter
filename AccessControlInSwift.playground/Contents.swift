import UIKit

/// Topics covered: Access control & Type property (static)

// MARK: - Access Control

/* This section will dive us through the types of access modifiers and there uses.*/

/// **Swift’s ** access control model is based on the concept of modules, source files, and packages.

/// **Open** access and **Public** access enable entities to be used within any source file from their defining module, and also in a source file from another module that imports the defining module. You typically use open or public access when specifying the public interface to a framework. The difference between open and public access is described below.

// open class someClass { }

/// **Package** access enables entities to be used within any source files from their defining package but not in any source file outside of that package. You typically use package access within an app or framework that’s structured into multiple modules.

/// **Internal** access enables entities to be used within any source file from their defining module, but not in any source file outside of that module. You typically use internal access when defining an app’s or a framework’s internal structure.

// class someClass {} "by default in swift every entity is internal"

/// **File-private** access restricts the use of an entity to its own defining source file. Use file-private access to hide the implementation details of a specific piece of functionality when those details are used within an entire file.

// fileprivate let someVariable = 2

/// **Private** access restricts the use of an entity to the enclosing declaration, and to extensions of that declaration that are in the same file. Use private access to hide the implementation details of a specific piece of functionality when those details are used only within a single declaration.

// private var someVariable: int = 0 "can only be modified and access in the declaration block"

// MARK: - Type Property (static)

/* This section will dive us through the "static" keyword and how useful it is.*/

/// **static** keyword allows the properties or methods belong to the type instead of the instance of the type
/// This is mostly used to create **Singleton**.
/// **static** property is implicitly lazy. That means it doesn't get initialized until called.

struct Example {
    static let myExample = "This property belongs to struct Example"
    var name: String
}

let ex1 = Example(name: "John")
let ex2 = Example(name: "Mary")

/// ex1 & ex2 are instances so they won't be able to access "myExample"

print(Example.myExample)
