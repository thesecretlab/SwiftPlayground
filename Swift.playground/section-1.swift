// Playground - noun: a place where people can play
// Our learnings of Swift
// Secret Lab - http://www.secretlab.com.au

import UIKit

// ------
// Variables and Constants
var myVariable = 123
let myConstantVariable = 123

#if os(NOPE)
myVariable += 5

// (ERROR: can't change a constant variable)
myConstantVariable += 2
#endif


#if os(NOPE)
    let someConstant : Int
    // ERROR: constants must contain values when they're declared
#endif

#if os(NOPE)
    var someVariable : Int
    someVariable += 2
    someVariable = 2
    someVariable += 2
    // WORKS, because someVariable has a value to add to
#endif


// ------
// Types

// Implicit type of integer
let anInteger = 2

#if os(NOPE)
// ERROR: Can't add a string to an integer
anInteger += "Yes"
#endif

// Explicit type of integer
let anExplicitInteger : Int = 2

// Optional integer, allowed to be nil
var anOptionalInteger : Int? = nil
anOptionalInteger = 42

#if os(NOPE)
// Non-optional (regular), NOT allowed to be nil
var aNonOptionalInteger = 42

aNonOptionalInteger = nil
// ERROR: only optional values can be nil
#endif

if anOptionalInteger {
    println("It has a value!")
} else {
    println("It has no value!")
}

// Optional types must be unwrapped using !
anOptionalInteger = 2
1 + anOptionalInteger! // = 3

anOptionalInteger = nil
// 1 + anOptionalInteger!
// CRASH: anOptionalInteger = nil, can't use nil data


// Optionals can also be declared unwrapped; this means you don't have to unwrap them later, but is unsafe
var unwrappedOptionalInteger : Int!
unwrappedOptionalInteger = 1
1 + unwrappedOptionalInteger // = 2

// Types can be converted
let aString = String(anInteger)
// = "2"

#if os(NOPE)
    // ERROR: Can't directly convert between types
    let aString = anInteger
#endif

// Tuples
var aTuple = (1, "Yes")

// ------
// Arrays

// Array of integers
let arrayOfIntegers : Int[] = [1,2,3]

// Type of array is implied
let implicitArrayOfIntegers = [1,2,3]

// Can also create an empty array, but you have to provide the type
var anotherArray = Array<Int>()

// Arrays can be immutable, like all other types
let immutableArray = [42,24]

// Adding values to arrays
var myArray = [1,2,3]
myArray.append(4)
// = [1,2,3,4]

// Getting the number of items in an array
myArray.count
// = 4

// Inserting values in arrays
myArray.insert(5, atIndex: 0)
// = [5,1,2,3,4]

// Removing items from arrays
myArray.removeAtIndex(4)
// = [5,1,2,3]

// Reversing an array
myArray.reverse()
// = [3,2,1,5]

// ------
// Dictionaries

// Creating a dictionary of string keys and string values
var crew = [
    "Captain": "Jean-Luc Picard",
    "First Officer": "William Riker",
    "Second Officer": "Data"
];

// Retrieving values from a dictionary
crew["Captain"]
// = "Jean-Luc Picard"

// Setting values in a dictionary
crew["Intern"] = "Wesley Crusher"

// Dictionaries can contain any type
// This dictionary uses integers for both keys and values
var aNumberDictionary = [1: 2]
aNumberDictionary[21] = 23

// ------
// Flow control (loops, if)

if 1+1 == 2 {
    "The math checks out"
}

// For loops a for-in loop
var loopingArray = [1,2,3,4,5]
var loopSum = 0
for number in loopingArray {
    loopSum += number
}
loopSum // = 15 

// Ranges can be .. (exclusive) and ... (inclusive)
var firstCounter = 0
for index in 1 .. 10 {
    firstCounter++
}
// Loops 9 times
"Looped \(firstCounter) times"

var secondCounter = 0
for index in 1 ... 10 { // note the three dots, not two
    secondCounter++
}
// Loops 10 times
"Looped \(secondCounter) times"

// Using a for-condition-increment loop
var sum = 0
for var i = 0; i < 3; i++ {
    sum += 1
}
sum // = 3

// While loop
var countDown = 5
while countDown > 0 {
    countDown--
}
countDown // = 0

// Do-while loop
var countUp = 0
do {
    countUp++
} while countUp < 5
countUp // = 5

// Using If-let to unwrap conditions
var conditionalString : String? = "a string"

if let theString = conditionalString? {
    "The string is \(theString)"
} else {
    "The string is nil"
}

// ------
// Switches

// Switching on an integer
let integerSwitch = 3

switch integerSwitch {
case 0:
    "It's 0"
case 1:
    "It's 1"
case 2:
    "It's 2"
default: // note: default is mandatory if not all cases are covered (or can be covered)
    "It's something else"
}

// Switching on a string
let stringSwitch = "Hello"

switch stringSwitch {
case "Hello":
    "A greeting"
case "Goodbye":
    "A farewell"
default:
    "Something else"
}

// Switching on a tuple
let tupleSwitch = ("Yes", 123)

switch tupleSwitch {
case ("Yes", 123):
    "Tuple contains 'Yes' and '123'"
case ("Yes", _):
    "Tuple contains 'Yes' and something else"
default:
    break
}

// Switching on a range
var someNumber = 15

switch someNumber {
case 0..10:
    "Number is between 0 and 10"
case 11..20:
    "Number is between 11 and 20"
default:
    "Number is something else"
}

// ------
// Functions

// Defining a function with no parameters and no return
func firstFunction() {
    "Hello"
}
firstFunction()

// Defining a function that returns a value
func secondFunction() -> Int {
    return 123
}
secondFunction()

// Defining a function that takes parameters
func thirdFunction(firstValue: Int, secondValue: Int) -> Int {
    return firstValue + secondValue
}
thirdFunction(1, 2)

// Functions can return multiple values, using a tuple
func fourthFunction(firstValue: Int, secondValue: Int) -> (doubled: Int, quadrupled: Int) {
    return (firstValue * 2, secondValue * 4)
}
fourthFunction(2, 4)

// If a returned tuple has named components (which is optional), you can refer
// to those components by name:
// Accessing by number:
fourthFunction(2, 4).1 // = 16
// Same thing but with names:
fourthFunction(2, 4).quadrupled // = 16

// Function parameters can be given names
func addNumbers(firstNumber num1 : Int, toSecondNumber num2: Int) -> Int {
    return num1 + num2
}

addNumbers(firstNumber: 2, toSecondNumber: 3) // = 5

// You can shorthand this by adding a #
func multiplyNumbers(#firstNumber: Int, #multiplier: Int) -> Int {
    return firstNumber * multiplier
}
multiplyNumbers(firstNumber: 2, multiplier: 3) // = 6

// Function parameters can have default values, as long as they're at the end
func multiplyNumbers2 (firstNumber: Int, multiplier: Int = 2) -> Int {
    return firstNumber * multiplier;
}
// Parameters with default values can be omitted
multiplyNumbers2(2) // = 4

// Functions can receive a variable number of parameters
func sumNumbers(numbers: Int...) -> Int {
    // in this function, 'numbers' is an array of Ints
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}
sumNumbers(2,3,4,5) // = 14

// Functions can change the value of variables that get passed to them using 'inout'
func swapValues(inout firstValue: Int, inout secondValue: Int) {
    let tempValue = firstValue
    firstValue = secondValue
    secondValue = tempValue
}

var swap1 = 2
var swap2 = 3
swapValues(&swap1, &swap2)
swap1 // = 3
swap2 // = 2


// ------
// Closures and Function Types

// Functions can be stored in variables
var numbersFunc: (Int, Int) -> Int;
// numbersFunc can now store any function that takes two ints and returns an int
numbersFunc = addNumbers
numbersFunc(2, 3) // = 5

// Functions can receive other functions as parameters
func timesThree(number: Int) -> Int {
    return number * 3
}

func doSomethingToNumber(aNumber: Int, thingToDo: (Int)->Int) -> Int {
    // call the function 'thingToDo' using 'aNumber', and return the result
    return thingToDo(aNumber);
}

doSomethingToNumber(4, timesThree) // = 12

// Functions can return other functions
func createAdder(numberToAdd: Int) -> (Int) -> Int {
    func adder(number: Int) -> Int {
        return number + numberToAdd
    }
    return adder
}
var addTwo = createAdder(2)
addTwo(2) // = 4

// Functions can 'capture' values
func createIncrementor(incrementAmount: Int) -> () -> Int { // <1>
    var amount = 0 // <2>
    func incrementor() -> Int { // <3>
        amount += incrementAmount // <4>
        return amount 
    }
    return incrementor // <5>
}

var incrementByTen = createIncrementor(10) // <6>
incrementByTen() // = 10 <7>
incrementByTen() // = 20 

var incrementByFifteen = createIncrementor(15) // <8>
incrementByFifteen() // = 15 <9>

// You can write short, anonymous functions called 'closures'
var numbers = [2,1,56,32,120,13]

var numbersSorted = sort(numbers, { (n1: Int, n2: Int) -> Bool in
    // Sort so that small numbers go before large numbers
    return n2 > n1
}) // = [1, 2, 13, 32, 56, 120]

// The types of parameters and the return type can be inferred
var numbersSortedReverse = sort(numbers, {n1, n2 in
    return n1 > n2
}) // = [120, 56, 32, 13, 2, 1]

// If you don't care about the names of the parameters, use $0, $1, etc
// Also, if there's only a single line of code in the closure you can omit the 'return'
var numbersSortedAgain = sort(numbers, {
    $1 > $0
}) // = [1, 2, 13, 32, 56, 120]

// If the last parameter of a function is a closure, you can put the braces outside the parentheses
var numbersSortedReversedAgain = sort(numbers) {
    $0 > $1
} // = [120, 56, 32, 13, 2, 1]

// Closures can be stored in variables and used like functions
var comparator = {(a: Int, b:Int) in a < b}
comparator(1,2) // = true


// ------
// Objects


// Classes define the 'blueprint' for an object
class Vehicle {

    var colour: String?
    var maxSpeed = 80
    
    func description() -> String {
        return "A \(self.colour) vehicle"
    }
    
    func travel() {
        println("Travelling at \(maxSpeed) kph")
    }
}

var redVehicle = Vehicle()
redVehicle.colour = "Red"
redVehicle.maxSpeed = 90
redVehicle.travel() // prints "Travelling at 90 kph"
redVehicle.description() // = "A Red vehicle"

// ------
// Inheritance

// Classes can inherit from other classes


class Car: Vehicle {
    // Inherited classes can override functions
        override func description() -> String  {
            var description = super.description()
            return description + ", which is a car"
        }
}


// Classes have a special 'init' function
class Motorcycle : Vehicle {
    var manufacturer : String
    
    override func description() -> String  {
        return "A \(colour) \(manufacturer) bike"
    }
    
    // By the end of the init function, all variables that are not optional must have a value
    init(manufacturer: String = "No-Name Brand™")  {
        self.manufacturer = manufacturer
        
        // The superclass' init function must be called after all properties defined in this subclass have a value
        super.init()
        
        self.colour = "Blue"
        
    }
    
    // 'convenience' init functions let you set up default values, and must call the main init method first
    convenience init (colour : String) {
        self.init()
        self.colour = colour
    }
}

var firstBike = Motorcycle(manufacturer: "Yamaha")
firstBike.description() // = "A Blue Yamaha bike"

var secondBike = Motorcycle(colour: "Red")
secondBike.description() // = "A Red No-Name Brand™ bike"

// ------
// Properties

// Properties can be simple stored variables
class SimplePropertyExample {
    var number: Int = 0
}
var test1 = SimplePropertyExample()
test1.number = 2

// Properties can be computed
class Rectangle {
    var width: Double = 0.0
    var height: Double = 0.0
    var area : Double {
        // computed getter
        get { 
            return width * height
        }
        
        // computed setter
        set {            
            // Assume equal dimensions (ie a square)
            width = sqrt(newValue)
            height = sqrt(newValue)
        }
    }
}

var rect = Rectangle()
rect.width = 3.0
rect.height = 4.5
rect.area // = 13.5
rect.area = 9 // width & height now both 3.0

// You can run code when a property changes
class PropertyObserverExample {
    var number : Int = 0 {
        willSet(newNumber) {
            println("About to change to \(newNumber)")
        }
        didSet(oldNumber) {
            println("Just changed from \(oldNumber) to \(self.number)!")
        }
    }
}

var observer = PropertyObserverExample()
observer.number = 4
// prints "About to change to 4", then "Just changed from 0 to 5!"

// Properties can be made 'lazy': they aren't set up until they're first called

class SomeExpensiveClass {
    init(id : Int) {
        println("Expensive class \(id) created!")
    }
}

class LazyPropertyExample {
    var expensiveClass1 = SomeExpensiveClass(id: 1)
    // note that we're actually constructing a class,
    // but it's labelled as @lazy
    @lazy var expensiveClass2 = SomeExpensiveClass(id: 2)
    
    
    init() {
        println("First class created!")
    }
}

var lazyExample = LazyPropertyExample() // prints "Expensive class 1 created", then "First class created!"
lazyExample.expensiveClass1 // prints nothing, it's already created
lazyExample.expensiveClass2 // prints "Expensive class 2 created!"


// ------
// Protocols

// Protocols are lists of methods and properties that classes can contain

protocol Blinking {
    
    // This property must be (at least) gettable
    var isBlinking : Bool { get }
    
    // This property must be gettable and settable
    var blinkSpeed: Double { get set }
    
    // This function must exist, but what it does is up to the implementor
    func startBlinking(blinkSpeed: Double) -> Void
}

class Light : Blinking {
    var isBlinking: Bool = false
    
    var blinkSpeed : Double = 0.0
    
    func startBlinking(blinkSpeed : Double) {
        println("I am now blinking")
        isBlinking = true
        self.blinkSpeed = blinkSpeed
    }
}

var aBlinkingThing : Blinking?
// can be ANY object that has the Blinking protocol

aBlinkingThing = Light()
aBlinkingThing!.startBlinking(4.0) // prints "I am now blinking"
aBlinkingThing!.blinkSpeed // = 4.0

// ------
// Extensions

// Types can be extended to include new properties and methods

extension Int {
    var doubled : Int {
        return self * 2
    }
    func multiplyWith(anotherNumber: Int) -> Int {
        return self * anotherNumber
    }
}

2.doubled // = 4
4.multiplyWith(32) // = 128


// Types can also be made to conform to a protocol
extension Int : Blinking {
    var isBlinking : Bool {
        return false;
    }
    
    var blinkSpeed : Double {
        get {
            return 0.0;
        }
        set {
            // Do nothing
        }
    }
    
    func startBlinking(blinkSpeed : Double) {
        println("I am the integer \(self). I do not blink.")
    }
}
2.isBlinking // = false
2.startBlinking(2.0) // prints "I am the integer 2. I do not blink."

// ------
// Interoperating with Objective-C

// Creating Objective-C objects
var view = UIView(frame: CGRect(x: 0,y: 0,width: 100,height: 100))

// Working with Objective-C properties
view.bounds

// Calling Objective-C methods
view.pointInside(CGPoint(x: 20, y: 20), withEvent:nil) // = true

// ------
// Modules

import AVFoundation

// ------
// Memory Management

// References to other classes are strong, but can be made explicitly weak
class Class1 {
    init() {
        println("Class 1 being created!")
    }
    
    deinit {
        println("Class 1 going away!")
    }
}

class Class2 {
    // Weak vars are implicitly optional
    weak var weakRef : Class1?
}

// ------
// Initialization and Deinitialisation

class InitAndDeinitExample {
    // Designated (i.e. main) initialiser
    init () {
        println("I've been created!")
    }
    // Convenience initialiser
    convenience init (text: String) {
        self.init() // this is mandatory
        println("I was called with the convenience initialiser!")
    }
    // Deinitialiser
    deinit {
        println("I'm going away!")
    }
}

var example : InitAndDeinitExample?

// using the designated initialiser
example = InitAndDeinitExample() // prints "I've been created!"
example = nil // prints "I'm going away"

// using the convenience initialiser
example = InitAndDeinitExample(text: "Hello") 
// prints "I've been created!" and then
//  "I was called with the convenience initialiser"

// ------
// Mutable and Immutable Objects

var mutableString = ""
let immutableString = "Yes"

mutableString += "Internet"
// immutableString += "Hello"
// ERROR: Can't modify an immutable object


// ------
// Working with Strings

// Strings can be empty
let emptyString = ""

let anotherEmptyString = String()

// You can check to see if a string is empty
emptyString.isEmpty // = true

// You can add strings together
var composingAString = "Hello"
composingAString += ", World!" // = "Hello, World!"

// You can loop over a string's characters
var reversedString = ""
for character in "Hello" {
    reversedString = character + reversedString
}
reversedString // = "olleH"

// You can get the number of characters in a string
countElements("Hello") // = 5


// ------
// Comparing Strings

// Compare to see if two strings are the same text using ==
var string1 = "Hello"
var string2 = "Hel" + "lo"

if string1 == string2 {
    println("The strings are equal")
}

// Compare to see if two strings are the same object with ===
if string1 === string2 {
    println("The strings are the same object")
}

// Check to see if a string has a certain suffix or prefix
if string1.hasPrefix("H") {
    println("String begins with an H")
}
if string1.hasSuffix("llo") {
    println("String ends in 'llo'")
}

// Converting a string to uppercase and lowercase
string1.uppercaseString // = "HELLO"
string2.lowercaseString // = "hello"
// ------
// Searching Strings

// NOTE: NOT SURE ABOUT THIS. SEEMS WEIRD.


// ------
// NSValue and NSNumber

// NSValues and NSNumbers contain values and numbers
var anNSNumber : NSNumber = 2
var aNumber = 3
aNumber + anNSNumber.integerValue


// ------
// Data

var stringToConvert = "Hello, Swift"
var data = "foo".dataUsingEncoding(4) // Ugh, we can't use the enum NSStringEncoding here, because it appears to not exist

//var data2 = "foo".dataUsingEncoding(NSStringEncoding.NSUTF8StringEncoding) this would be better but appears to not work?

// ------
// Loading Data from Files and URLs

// Loading from URL
var fileURL = NSBundle.mainBundle().URLForResource("A File", withExtension: "txt")
if (fileURL) {
    var loadedDataFromURL = NSData(contentsOfURL:fileURL)
}

// Loading from a file
var filePath = NSBundle.mainBundle().pathForResource("Something", ofType: "jpg")
if (filePath) {
    var loadedDataFromPath = NSData(contentsOfFile:filePath)
}

// ------
// Serialization and Deserialization

class SerializableObject : NSObject, NSCoding {
    
    var name : String?
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(name, forKey:"name")
    }
    init() {
        self.name = "My Object"
    }
    init(coder aDecoder: NSCoder!)  {
        self.name = aDecoder.decodeObjectForKey("name") as? String
    }
}

var anObject = SerializableObject()

// converting it to data
var objectConvertedToData = NSKeyedArchiver.archivedDataWithRootObject(anObject)

// loading it from data - SHOULD work, throws an exception :(
#if os(NOPE)
var loadedObject = NSKeyedUnarchiver.unarchiveObjectWithData(objectConvertedToData) as? SerializableObject
#endif


// ------
// Delegation

// Define a protocol that has a function called doSomething
protocol MyClassDelegate {
    func doSomething()
}

class MyClass {
    // The delegate can be any object that conforms to the MyClassDelegate
    // protocol
    var delegate : MyClassDelegate?
    
    func somethingHappened() {
        // Check to see if the delegate is there, then call it
        delegate?.doSomething()
    }
}

class SomeOtherThing : MyClassDelegate {
    func doSomething() {
        println("I'm being useful!")
    }
}


var myClassObject = MyClass()
myClassObject.somethingHappened() // does nothing

var someOtherObject = SomeOtherThing()
myClassObject.delegate = someOtherObject
myClassObject.somethingHappened() // prints "I'm being useful!"

// ------
// Key-Value Observing

class Boat : NSObject {
    var colour = 1
}

class ObservingClass : NSObject {
    func observeObject(theObject : NSObject) {
        theObject.addObserver(self, forKeyPath: "colour", options: NSKeyValueObservingOptions.New | NSKeyValueObservingOptions.Old, context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String!, ofObject object: AnyObject!, change: NSDictionary!, context: CMutableVoidPointer) {
        
        var oldColour = change[NSKeyValueChangeOldKey] as? String
        var newColour = change[NSKeyValueChangeNewKey] as? String
        
        println("Colour changed from \(oldColour) to \(newColour)")
        
    }
}

var aNewBoat = Boat()
aNewBoat.colour = 2

var observerObject = ObservingClass()
observerObject.observeObject(aNewBoat) // NOTE: this appears to be throwing some kind of exception, will revisit later




