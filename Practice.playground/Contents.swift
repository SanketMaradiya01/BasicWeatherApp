// Example Swift file named "AccessExample.swift"

// Class with default internal access
class MyClass {
    var publicVariable: Int = 0
    internal var internalVariable: String = "Internal"
    fileprivate var filePrivateVariable: Double = 3.14
    private var privateVariable: Bool = true

    // Public function
    func publicFunction() {
        print("Public function")
    }

    // Internal function
    internal func internalFunction() {
        print("Internal function")
    }

    // Fileprivate function
    fileprivate func fileprivateFunction() {
        print("Fileprivate function")
    }

    // Private function
    private func privateFunction() {
        print("Private function")
    }
}

// Subclass in a different file
class SubclassOfMyClass: MyClass {
    override func publicFunction() {
        super.publicFunction()
        print("Overridden Public function in Subclass")
    }
}

let instance = MyClass()

print(instance.publicVariable)  // Accessible
print(instance.internalVariable)  // Accessible
 print(instance.filePrivateVariable)  // Not accessible from another file
// print(instance.privateVariable)  // Not accessible from another file

instance.publicFunction()  // Accessible
instance.internalFunction()  // Accessible
// instance.fileprivateFunction()  // Not accessible from another file
// instance.privateFunction()  // Not accessible from another file

let subclassInstance = SubclassOfMyClass()
subclassInstance.publicFunction()  // Overridden method in subclass


class MathOperations {
    // Static property
    static let pi = 3.14159

    // Static method
    static func square(_ number: Double) -> Double {
        return number * number
    }
}

// Accessing static property
print(MathOperations.pi)

// Calling static method
let result = MathOperations.square(5.0)
print(result)


class MySingleton {
    // Create a static constant instance of the class
    static let shared = MySingleton()

    // Private initializer to prevent creating instances outside of the class
    private init() {
        // Initialization code, if any
    }

    // Add your singleton's properties and methods here
    var someValue: Int = 0

    func doSomething() {
        print("Singleton is doing something!")
    }
}

// Singleton Class
// Example usage:
let mySingletonInstance = MySingleton.shared
mySingletonInstance.someValue = 42
print(mySingletonInstance.someValue)  // Output: 42

let anotherInstance = MySingleton.shared
print(anotherInstance.someValue)  // Output: 42

anotherInstance.doSomething()  // Output: Singleton is doing something!


// MARK: - Public Access Level

// Public class accessible from any module
public class PublicClass {
    // Public property accessible from any module
    public var publicProperty = 42
    
    // Public method accessible from any module
    public func publicMethod() {
        print("Public method called.")
    }
}

// MARK: - Internal Access Level

// Internal class (default access level) accessible within the same module
class InternalClass {
    // Internal property accessible within the same module
    var internalProperty = "Internal"
    
    // Internal method accessible within the same module
    func internalMethod() {
        print("Internal method called.")
    }
}

// MARK: - Private Access Level

// Class with private members
class PrivateClass {
    // Private property accessible only within the same file
    private var privateProperty = true
    
    // Private method accessible only within the same file
    private func privateMethod() {
        print("Private method called.")
    }
    
    // Public method that can access private members
    public func publicMethodWithPrivateAccess() {
        // Accessing private property and method
        print("Private property value: \(privateProperty)")
        privateMethod()
    }
}

// MARK: - Usage Example

// Instantiate objects from the classes
let publicInstance = PublicClass()
let internalInstance = InternalClass()
let privateInstance = PrivateClass()

// Accessing properties and methods from the instances
publicInstance.publicMethod()
print("Public property value: \(publicInstance.publicProperty)")

internalInstance.internalMethod()
print("Internal property value: \(internalInstance.internalProperty)")

privateInstance.publicMethodWithPrivateAccess()


//Closure

let globalClosure: () -> Void = {
    print("This is a global closure.")
}

// Calling the global closure
globalClosure()

func outerFunction() -> () -> Void {
    var counter = 0

    let nestedClosure: () -> Void = {
        counter += 1
        print("Counter inside closure: \(counter)")
    }

    return nestedClosure
}

// Creating an instance of the closure
let closureInstance = outerFunction()

// Calling the closure
closureInstance()  // Output: Counter inside closure: 1
closureInstance()  // Output: Counter inside closure: 2

let closureExpression: (Int, Int) -> Int = { (a, b) in
    return a + b
}

// Calling the closure expression
let result1 = (closureExpression(5, 3))
print("Result of closure expression: \(result1)")  // Output: Result of closure expression: 8


let shorthandClosure: (Int, Int, Int) -> Int = { $0 + $1 + $2 }

// Calling the shorthand closure
let resultShorthand = shorthandClosure(7, 2, 3)
print("Result of shorthand closure: \(resultShorthand)")  // Output: Result of shorthand closure: 9
