import UIKit

// MARK: - Swift Initializers

/* In this section we will learn about different types of initializers in swift. We will also deep dive into how and when to use them.*/

/// **Designated**
/// These type of initializers ensure that the object is ready to be used and all its properties are initialized.
/// These are primary initializers.
/// We can have multiple designated initializers.
class Person {
    var name: String
    var age: Int?

    // designated initializers, since all non-optional properties are ready to use.
    init() {
        name = "None"
    }
}

let person1 = Person()
print(person1.name)


/// **Convenience**
/// These type of initializers allows us to pre-configure the object in certain ways
/// They may depend on Designated initializers to ensure that the object is ready to use.
/// This can also be useful when you want to configure the existing designated initializers specifically.
class People {
    var name: String
    var age: Int?
    var gender: String?
    var netWorth: Int?

    // designated initializers, since all non-optional properties are ready to use.
    init() {
        name = "None"
    }

    convenience init(_ gender: String, _ netWorth: Int) {
        // Need to call designated initializers, else compiler will throw an error. And this will ensure all the remaining properties are initialized.
        self.init()

        self.gender = gender
        self.netWorth = netWorth
    }
}

let person2 = People("Male", 8999999)
print(person2.name)
print(person2.gender ?? "")
print(person2.netWorth ?? "")

enum Delay {
    case interval(TimeInterval)
    case until(Date)
}

class Operation {
    var delay: Delay

    // Designated
    init(delay: Delay) {
        self.delay = delay
    }

    // Convenience 1: When user wants to pass time as a delay.
    convenience init(timeInterval: TimeInterval) {
        self.init(delay: .interval(timeInterval))
    }

    // Convenience 2: When user wants to pass date as a delay.
    convenience init(date: Date) {
        self.init(delay: .until(date))
    }
}


/// **Required**
/// These initializers as name suggest needs to be implemented if we are subclassing from any class.
/// For example when we sub class from UIViewController, we need to implement: 
/// 
/// required init?(coder: NSCoder) {
///           fatalError("init(coder:) has not been implemented)
///     }
///



/// **Failable**
/// These initialzers are used when any property of that class can be initialized incorrectly.
/// If the class has any other initializers they have to be marked with "?", since the initialization can fail.
class Student {
    var name: String
    var subject: String?

    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }

    convenience init?(name: String, subject: String) {
        self.init(name: name)
    }
}

let student1 = Student(name: "Kailash")
let student2 = Student(name: "")

print(student1)
print(student2) // This will print "nil", since the user has entered an empty string.
