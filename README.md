# 100 Days of SwiftUI

**Up to: Day 32**

### Notes:

*removed days, so I can better put data into categories.
*Fark me day 13 had so much content, I couldn’t be bothered taking notes. I’ll add notes as I come across protocols in the projects section (just going to let it marinate for now)
*added xCode tips at the top

[] Need to review extensions and protocols, don't know what is happening

## Fun facts

- I find the examples different languages use to be funny, swiftUI might be one of my favorites using Taylor Swift as an example because you know.

```swift
let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)
```

- SwiftUI has this weird rule, I call it weird because I don’t know the reason for it. But, you can only put 10 children inside a parent so a form could only have 10 children. that is unless you use the `Group`
- There’s a saying among SwiftUI developers that our “views are a function of their state,” means that the way your user interface looks – the things people can see and what they can interact with – are determined by the state of your program
    - Good example of this in the video here, when the tip % changes or the check amount (state) changes the view updates
        
        [Screen Recording 2023-02-04 at 1.07.03 pm.mov](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/22baa392-b55c-4c0f-895b-bea1a9b04f9f/Screen_Recording_2023-02-04_at_1.07.03_pm.mov)
        
- A computed property is a property that is dynamically calculated based on other properties or values, while a stored property is a property that stores a value. The value of a stored property is set during initialization and can be changed throughout the lifetime of the object.
- **On day 26, I learned that xCode has a documents function where you can read the docs for anything. Yep on day 26 :| . You just need to click on the object in the ide and it shows up on the inspectors tab**
    
    ![Screenshot 2023-02-08 at 19.15.35.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c2bcf8e7-4c68-45ce-b2b4-e5ce15c57237/Screenshot_2023-02-08_at_19.15.35.png)
    

 ****

## Xcode tips

- Depending on Xcode’s configuration, you may or may not see file extensions in your project navigator. You can control this by going to Xcode’s preferences, choosing the General tab, then adjusting the File Extensions option.
- `Option+Cmd+P` will resume canvas preview

## Simple Datatypes

### Variables & Constants

- `var` = vary meaning it can change.
- `let` is a constant - meaning this is a value can’t change

```swift
let manger = "Michael Scott" 
var assistantManger = "Dwight Schrute"
```

### Strings

- have to use double quotes (annoying)
- Multi-line string

```swift
"""
This is a 
multi-line
string
"""
```

Some useful methods: 

```swift
someString.uppercased() 
someString.count 
someString.hasPrefix("Mr")
someString.hasSuffix(".png")

```

**Concatenation**

- As you would expect you can use the `+` operator to join strings

```swift
let first = "Luffy"
let middle = "D"
let last = "Monkey"

let full = first + " " + middle + ". " + last 
```

**Interpolation**

- to interpolate strings you use `\(someVariable)`

```swift
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)
```

### Numbers (Ints)

- Integers or `Int` are how swift types whole numbers.

```swift
let age = 33
```

- You can write big boy numbers out like this `100_000_000`
- They use all the standard operators: `-`, `+`, `*`, `/`
- Also have shorthand operators `+=` etc.
- useful method `isMultiple(:of)`

```swift
print(50.isMultiple(of: 5))
```

- Decimals or floating-point numbers are type `Double`, short for the mouthful “double-precision floating-point number”,
- You can’t YOLO it and add integers to decimals

```swift
let yoloMath = 0.1 + 1 // won't work because of type safety
```

<aside>
🦺 Type safety in Swift means that once Swift has decided what data type a constant or variable holds, it must always hold that same data type. So the below won’t work, it will say `Cannot assign value of type 'Double' to type 'String'`

</aside>

```swift
var name = "Nicolas Cage"
name = 2.0
```

- Sometimes you’ll see **`CGFloat`** floating around 😏 that is just an old fashion way of storing floats

### Bools

- `true` or `false` as you’d expect
- Booleans have a special operator `!` (guessing it’s bang like in JS) which means “not”. So, `!false = true`
- Bools have a cool method called `toggle()` which let you flip the value.

```swift
var luffyKingOfPirates = false
print(luffyKingOfPirates) // prints false

luffyKingOfPirates.toggle()
print(luffyKingOfPirates) // prints true 🤯
```

## Complete Datatypes

### Arrays

- `[]` is the standard Array syntax
- they are zero indexed

```swift
let originalCrew = ["zoro", "namni", "sanji", "usopp"]
let firstMember = originalCrew[0]
```

**Array methods**

- `append()` - adds it to the end of the array
- `count`
- `remove(at: index)`
- `contains()` - check if value is in an array
- `sorted()` sorted in ascending order
- `reversed()` reverses order
- You can create arrays like so `var someArray = [String]()` or `var someOtherArray = Array<String>()`
- With swift you need to tell it what type of data it is storing, however it is smart enough to know what type it is if you just pass it some initial values

```swift
var albums = ["stringArray"]
```

### Dictionaries

- I think these are like Objects in JS, except they confusingly use the same syntax as an array `[]`
    - same key, value pair setup (key on left, value on right)

```swift
let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2020: "Tokyo"
]
```

- You can create an empty dictionary by using explicit types

```swift
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206
```

- Swift wants you to give default values in case there is nothing there, otherwise it complains `Expression implicitly coerced from 'String?' to 'Any'`
    - to fix we give it what it wants, a default value:
    
    ```swift
    print(heights["Yao Ming", default: 0])
    print(heights["Shaquille O'Neal", default: 0])
    print(heights["LeBron James", default: 0])
    ```
    
- You can reassign values in a dictionary like so:

```swift
olympics["2020"] = "Did not run"
olympics[2021] = "Tokyo"
```

### Sets

- Just like arrays but you can’t have any duplicates in a set.

```swift
let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
```

- It actually creates an array first with the `[]` and then creates a set.
- These don’t care about order
- Sets are way faster than arrays for lookups so they can be really useful for that

**Note: added concatenation & interpolation to strings section*

### Enums

- Good for when you have a set of specific values.

```swift
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday
```

- You can shorten the above like so:

```swift
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}
```

## Type annotations

- can set types like this:

```swift
let captain: String = "Luffy"
var crewMemberCount: Int = 10
var crewNames: [String] = ["Zoro", "Robin", ...]
var crewJoinOcen: [String: String] = ["Zoro": "Blue", "Robin": "Grandline", ...]

or when empty

var futureCrew: [String] = [String]()
```

- If you don’t provide initial data for swift to infer the type then you need to let it know the type e.g. `var teams: [String] = [String]()`
    - You need to provide the parentheses `()` when making empty arrays, dicts and sets
- Better way to explicitly tell swift type

```swift
var clues = [String]()
```

## Conditions

- if
    
    ```swift
    if score > 80 {
    	print("Condition Met")
    }
    ```
    
- comparison operators:
    - `==` is equal to
    - `!=` not equal to
    - `>=`
    - `<=`
    - `<`
    - `>`
- **if else**

```swift
if age >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}
```

- **if, else if, else**

```swift
if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}
```

- **********************************logical operators**********************************
    - `&&` and
    - `||` or
- Using enums as conditionals
    - interesting how you only need to use the `.value` syntax rather than `enumName.value`

```swift
enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path…")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}
```

### Switch Statements

```swift
switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
default: 
	print("It's Melbourne you stuffed")
}
```

- All **`switch`** statements *must* be exhaustive, meaning that all possible values must be handled in there so you can’t leave one off by accident. Hence why we have a `default`.
    - Order matters, because it goes through from top to bottom so you want `default` at the end
- Swift will execute the first case that matches the condition you’re checking, but no more. Unlike JS where you need to have a break otherwise it will carry on executing other code from all subsequent cases.
    - If you want it to keep going you can use `fallthrough` keyword, you just put it at the end of the case (above the would mean below the print statement).

### Ternary

- Similar to JS you use the `?` and the first option is if condition is true, second is if it is false

```swift
let canVote = age >= 18 ? "Yes" : "No"
```

*Cool little way to remember how ternaries work from the course ******WTF = what, true, false******

## Loops

Standard for loop over an array

```swift
let originalCrew = ["zoro", "namni", "sanji", "usopp"]

for crewMate in originalCrew {
	print("\(crewMate) joining in the great blue")
}
```

- Loop through a range

```swift
for i in 1...12 {
  print("5 x \(i) is \(5 * i)")
}

// loop up to but excluding final number uses <

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}
```

- while loop

```swift
var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")
```

### break / continue

- `continue` - stops executing current loop and skips to next loop, so below it would not execute the print statement when `.jgp` does not come up

```swift
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}
```

- `break` - just wrecks the loop and exits it as soon as it is called

## Functions

```swift
func nameOfFunction {
	// do something
}
```

Three things to basic functions: 

1. The `func` keyword
2. the name of the function followed by `()`
3. the body of the function

- To call a function you do `nameOfFunction()`
    - swift call this the functions *********call site,********* in laymans it means a place where the function is called

Writing parameters & arguments 

```swift
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)
```

- you give the parameter a name `number` and then an expected type `Int`
- then when you call it you have to actually use the parameter name and pass it the value so `number: 5`

### Returning values

To return data from a function you need two things

1. An arrow then data type before the opening curly bracket
2. the `return` keyword

```swift
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)
```

- The above also says the function must return an integer, which I didn’t pick up on during my first pass

Another example returns a `Bool`

```swift
func areLettersIdentical(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}
```

- In the above example we don’t even need the `return` keyword because swift is smart enough to know since there is only one line it must return that data **(but only works when single line in func)**

You can use **************`return` to force a function to exit early**

### Returning multiple values with tuples

```swift
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")
```

- the return type is a tuple that contains 2 strings
- The diff between dictionaries and tuples is that tuples don’t need to know whether the data is present ahead of time or not, so you don’t need to return a default value like you would with a dict.
    - This is because swift knows ahead of time what is available in a tuple. For instance if you tried to print `user.job` it would tell you the `Value of tuple type '(firstName: String, lastName: String)' has no member 'job'`

Three things worth knowing about tuples that you might see in the wild

1. You might see a the tuple without the names / parameters because swift already knows the name of the parameters and I’m guessing the only thing that matters is order
    
    ```swift
    func getUser() -> (firstName: String, lastName: String) {
        ("Taylor", "Swift")
    }
    ```
    
2. You can also access tuples with indices when they aren’t given names
    
    ```swift
    func getUser() -> (String, String) {
        ("Taylor", "Swift")
    }
    
    let user = getUser()
    print("Name: \(user.0) \(user.1)")
    ```
    
3. Tuples have a similar thing to destructuring in javascript, you just pass the  names inside of parentheses and they you can call those variables. 
    
    ```swift
    let (firstName, lastName) = getUser()
    print("Name: \(firstName) \(lastName)")
    ```
    

### Customizing parameter labels

**this is semi important I see this syntax all over the place and didn’t understand it until now*

- Swift gives us two ways we can customize parameter labels:
    1. we can use the `_` for the external name, meaning it doesn’t get used
        
        ```swift
        func isUppercase(string: String) -> Bool {
            string == string.uppercased()
        }
        
        let string = "HELLO, WORLD"
        let result = isUppercase(string: string)
        
        // vs 
        
        func isUppercase(_ string: String) -> Bool {
            string == string.uppercased()
        }
        
        let string = "HELLO, WORLD"
        let result = isUppercase(string)
        ```
        
        - Notice in the second example, we don’t need to use the external parameter label. **It is optional.**
        - *NB: External parameter is the parameter that is used when calling the function, so above the external parameter name is `_` and below it is `for`
    2. we can add a second parameter name so that we have both internal and external names
        
        ```swift
        func printTimesTables(for number: Int) {
            for i in 1...12 {
                print("\(i) x \(number) is \(i * number)")
            }
        }
        
        printTimesTables(for: 5)
        ```
        
        - here the external name is `for` and the internal name is `number` that is type int
        - when we call the function we use the external name parameter because it reads more human “print times tables for 5” vas. “print times table for number 5”. Five is already a number dummy.

### Default parameter values

- You can specify default values when you set the parameters of a function, similar to JS

```swift
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)
```

- best practice is to try to adhere to using sensible defaults that the user would expect

### Handling errors

- You can use `throw`

```swift
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}
```

- Another way to handle errors in functions is with a essentially a try catch block you’d use in JS. Except it is a `do`, `try`, `catch` block I think.
    
    ```swift
    let string = "12345"
    
    do {
        let result = try checkPassword(string)
        print("Password rating: \(result)")
    } catch {
        print("There was an error.")
    }
    ```
    
    - `try` has to be written before calling any functions that might through errors, so about the `checkPassword` might through an error.
    - `try` has to be inside a `do` block.

## Closures

You can assign functions directly to variables, and we call that a closure

```swift
let sayHello = {
    print("Hi there!")
}

sayHello()
```

- If you want a closure to except parameters you need to declare them inside the `{}` curly braces.
    
    ```swift
    let sayHello = { (name: String) -> String in
        "Hi \(name)!"
    }
    ```
    
    - here you have declared the parameter `name` with the type `String`
    - told swift the return value is a `String`
    - Then used the keyword `in`
- `in` is used to mark the end of the parameters and return type in a closure

You don’t need to to give a closure a return type, the below is valid because it is a `Void` type, that is it returns nothing

```swift
var cleanRoom = { (name: String) in
	print("I'm cleaning the \(name).")
}
cleanRoom("kitchen")
```

The thing to recognize with closures it that they start by assigning a variable and use the **`{}`.**

- You’ll see ones that don’t pass the parameter types or a return value:
    
    ```swift
    let captainFirstTeam = team.sorted { name1, name2 in
        if name1 == "Suzanne" {
            return true
        } else if name2 == "Suzanne" {
            return false
        }
    
        return name1 < name2
    } ****
    ```
    
- Ones that you don’t even need to even pass a parameter:
    
    ```swift
    let captainFirstTeam = team.sorted {
        if $0 == "Suzanne" {
            return true
        } else if $1 == "Suzanne" {
            return false
        }
    
        return $0 < $1
    }
    ```
    
- Ones where you don’t use a return
    
    ```swift
    let reverseTeam = team.sorted { $0 > $1 }
    ```
    

## Structs

Swift’s structs let us create our own custom, complex data types, complete with their own variables and their own functions.

```swift
struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()
```

- This creates a new type called Album
    - It has three constants - `title`, `artist`, `year`
        - A simple function `printSummary`

Structs have to use CamalCase, but inside we use camalCase (is that right? surely these have individual names, someone please leave a comment)

- When you create a new instance of a struct you need to **provide values for each of the constants in the order they were defined.** So above I couldn’t go `let red = Album(year: 2012, title: "Red", artist: "Taylor Swift"`)

If you create a struct using a constant like above, swift makes the struct and all of its data constant meaning we can’t reassign it. The below is an example of where this would be a problem: 

```swift
struct Employee {
    let name: String
    var vacationRemaining: Int

    func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

let archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining) 
```

- This doesn’t work because the function isn’t allowed to change the struct’s data because we made it constant.
- To fix this we can add the `mutating` keyword in front of the func and create the `archer` struct as a variable

```swift
struct Employee {
    let name: String
    var vacationRemaining: Int

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining) 
```

- But if we change archer to a constant it won’t work again because we’re trying to call a `mutating` function on a constant struct, which isn’t allowed.

### Important struct terminology

- Variables and constants that belong to structs are called *properties*.
- Functions that belong to structs are called *methods*.
- When we create a constant or variable out of a struct, we call that an *instance* – you might create a dozen unique instances of the **`Album`** struct, for example.
- When we create instances of structs we do so using an *initializer* like this: **`Album(title: "Wings", artist: "BTS", year: 2016)`**.
    - Swift silently creates a special function inside the struct called **`init()`**, using all the properties of the struct as its parameters. It then automatically treats these two pieces of code as being the same:
        
        ```swift
        var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 14)
        var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)
        ```
        

### Computed & Stored Properties

- Structs have two type of properties:
    1. a stored property, a variable / constant that holds a piece of data inside the struct so above a stored prop would be `name` or `vacationRemaining`
    2. a computed property, calculates the value of a property each time it is accessed 
        
        ```swift
        struct Employee {
            let name: String
            var vacationAllocated = 14
            var vacationTaken = 0
        
            var vacationRemaining: Int {
                vacationAllocated - vacationTaken
            }
        }
        ```
        
        - The vacationRemaining is a computed property
- With computed properties you can use getters and setters. Below would be an example:
    
    ```swift
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
    
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
    ```
    
    - by the looks you can use the `newValue` keyword to store the value the user was trying to assign to the property. So if you say `archer.vacationRemaining = 30`, then the newValue is `30`
- computed properties must also have a specific type and **can’t be constants**
- computed properties must also return a value, they can’t just print a string for instance

### Custom initializers

You can create your own custom initializers in swift, there is only one thing your really need to know aside from the syntax and that is all properties must have a value by the time the initializer ends otherwise Swift would refuse to build our code.

```swift
struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}
```

- Above we use the `init` keyword, and pass it the param name.
    - we then initialize the name param with `self.name = name` and then set the number property to a random number btw 1 and 99
    - this works because we have given all properties values by the time the initializer ends (properties being `name` and `number`) at the top of the struct.

### Access Control

- Use **`private`** for “don’t let anything outside the struct use this.”
- Use **`fileprivate`** for “don’t let anything outside the current file use this.”
- Use **`public`** for “let anyone, anywhere use this.”
- **`private(set)`** “let anyone read this property, but only let my methods write it.”

### Static Properties & methods

- These can be accessed anywhere in your program.
- Really useful for sample data for when you are building your application
- Or for things that are going to be static that you might use throughout your application like you “privacy & terms url” or your apps version number

```swift
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}
```

Example of how to use for static sample data

```swift
struct Employee {
let username: String
let password: String

staticlet example = Employee(username: "cfederighi", password: "hairforceone")
}
```

## Classes

```swift
class BoardGame {
var name: String
var minimumPlayers = 1
var maximumPlayers = 4
init(name: String) {
self.name = name
	}
}
```

- all copies of a class instance share the same data, meaning that any changes you make to one copy will automatically change the other copies. This happens because classes are *reference types* in Swift, which means all copies of a class all *refer* back to the same underlying pot of data.

### Differences between classes and structs

- First, classes can inherit from other classes, which means they get access to the properties and methods of their parent class. You can optionally override methods in child classes if you want, or mark a class as being **`final`** to stop others subclassing it.
- Second, Swift doesn’t generate a memberwise initializer for classes, so you need to do it yourself. If a subclass has its own initializer, it must always call the parent class’s initializer at some point.
- Third, if you create a class instance then take copies of it, all those copies point back to the same instance. This means changing some data in one of the copies changes them all.
- Fourth, classes can have deinitializers that run when the last copy of one instance is destroyed.
- Finally, variable properties inside class instances can be changed regardless of whether the instance itself was created as variable.

### Inheritance

- You use a colon `:` to create inheritance in swiftui

```swift
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }

		func printSummary() {
	    print("I work \(hours) hours a day.")
		}
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()
robert.printSummary()
```

- To change parent method you need to use the `overrider` keyword down on the child method

```swift
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }

	override func printSummary() {
	    print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
	}
}

```

- If you know for sure that your class should not support inheritance, you can mark it as **`final`**
. This means the class itself can inherit from other things, but can’t be used to inherit *from*
 – no child class can use a final class as its parent.

### Adding initializers for classes

Say you have a class: 

```swift
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}
```

Now if you have a `Car` class that inherits from `Vehicle`, swift will refuse to build that class unless you tell it what the values for `isElectric` are. 

- To do that we use `super`, when we initialize any instances of the child class

```swift
class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)
```

## Protocols and Extensions

- Let us define a series of properties and methods that we want to use, they don’t actually implement them. They just say hey, these properties and method must exist, they are kind of like a blue print.

```swift
protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}
```

- Above we have:
    - created a protocol with the keyword, with a name (it’s a type so has to be in capitals)
    - inside we list all the methods we require
    - as you can see the methods don’t actually contain function bodies, we are just specifying the name, parameters and return types.
- Now we can match a `Car` struct that conforms to the `Vehicle` protocol:
    
    ```swift
    struct Car: Vehicle {
        func estimateTime(for distance: Int) -> Int {
            distance / 50
        }
    
        func travel(distance: Int) {
            print("I'm driving \(distance)km.")
        }
    
        func openSunroof() {
            print("It's a nice day!")
        }
    }
    ```
    
    - All methods that exist in Vehicle must exist in Car otherwise car doesn’t conform to the vehicle protocol.
    - These methods must exist exactly the same, by that I mean they must have the same name, params and return types.
    - The difference is the methods in `Car` actually do something, they are the implementations.

To understand why Protocols are useful you can look at the below example. But basically, they 

If we create a function: 

```swift
func commute(distance: Int, using vehicle: Car) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)
```

- This works, but it doesn’t add value. The real value comes from changing the `vechical` param to the `Vehicle` protocol. Because swift knows that any type that conforms to the Vehicle type must have both the `estimateTime()` and `travel()` methods.
    - Why that is valuable is because it now allows you to call the function with any type of data as long as that data conforms to the Vehicle protocol.
    - So rewrite it like so:
    
    ```swift
    func commute(distance: Int, using vehicle: Vehicle) {
    ...
    }
    ```
    
- That is powerful because now you can create a new struct that conforms to the Vehicle type like Bicycle
    
    ```swift
    struct Bicycle: Vehicle {
        func estimateTime(for distance: Int) -> Int {
            distance / 10
        }
    
        func travel(distance: Int) {
            print("I'm cycling \(distance)km.")
        }
    }
    
    let bike = Bicycle()
    commute(distance: 50, using: bike)
    ```
    
    - Once we have that we could pass either `car` … //todo finish this once I’ve played with extensions in code

Here is the summary by Paul for extensions, protocols and opaque types

- Protocols are like contracts for code: we specify the functions and methods that we required, and conforming types must implement them.
- Opaque return types let us hide some information in our code. That might mean we want to retain flexibility to change in the future, but also means we don’t need to write out gigantic return types.
- Extensions let us add functionality to our own custom types, or to Swift’s built-in types. This might mean adding a method, but we can also add computed properties.
- Protocol extensions let us add functionality to many types all at once – we can add properties and methods to a protocol, and all conforming types get access to them

## Optionals

In Swift, an optional is a type that can either hold a value or be **`nil`**, representing the absence of a value. You use optionals when you're not sure whether a value will be present or not, and you want to handle both possibilities.

In swift optionals are represented as types with a question mark so `String?`, `Int?` or `[Int]?`

- If you have a variable where you’re not sure if it will have a value or not you would write it like so:

```swift
var username: String? = nil
```

- here the username `nil`, you're indicating that the `username` variable doesn't have a value yet, but we can update it later if we want because it isn’t a constant
- Then this conditional body would only run if username had a String value assigned to it

```swift
if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}
```

Okay what are these lil fuckers `if let variable = variable { do something }`

- this is called unwrapping and what it basically does is it creates a temporary variable that is only available inside the `{}` braces if the variable exists
- what a mouthful - but it is easier to look at it this way: `if let unwrappedVariable = variable { do something with unwrappedVariable}`
    - so if the `variable` exists then we create the `unwrappedVariable` and do something with it, we wan’t use it anywhere else in our code. Just in the local scope of the unwrapped varaible.
- the process of writing `if let variable = variable` is called shadowing and is a common pattern in swift

### Guard

```swift
func printSquare(of number: Int?) {
guardlet number = numberelse {
        print("Missing input")
return}

    print("\(number) x \(number) is \(number * number)")
}
```

This is kind of the opposite to `if let`, the ying to it’s yang. So if the value doesn’t exist it will run the code inside the `{}`

```swift
if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}

guard let unwrapped = myVar else {
    print("Run if myVar doesn't have a value inside")
}
```

- So, **`if let`** runs the code inside its braces if the optional had a value, and **`guard let`** runs the code inside its braces if the optional *didn’t* have a value.
- what **`guard`**provides that is different from `if let` is the ability to check whether our program state is what we expect, and if it isn’t to bail out

Using `guard` let’s us focus on the happy path, compare the two functions below: 

```swift
func printMeaningOfLife() {
    if let name = getMeaningOfLife() {
        print(name)
    }
}
```

```swift
func printMeaningOfLife() {
    guard let name = getMeaningOfLife() else {
        return
    }

    print(name)
}
```

- The second one let’s use focus on the happy path, because it has an early exit if the `getMeaningOfLife` function doesn’t return any value.
    - **`guard`** requires that we exit the current scope when it’s used, which in this case means we must return from the function if it fails. This is not optional: Swift won’t compile our code without the **`return`**.

### nil coalescing

Unwrap an optional and provide a default value if the value is empty

```swift
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"
```

- the nil coalescing (`??`) operator lets us provide a default value for an optional
    - so if `"Serenity”` exists in `captains` it will return the value otherwise it will return `“N/A”`

### Optional chaining

Works just like in Javascript, except you can use nil coalescing at the end to give a default value 

```swift
struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)
```

# SwiftUI Stuff

- **`struct ContentView: View`** creates a new struct called **`ContentView`**, saying that it conforms to the **`View`** protocol.
    - **`View`** comes from SwiftUI and is the protocol that must be adopted by anything to be displayed on the screen, such as text, buttons, and images.
    - The **`View`** protocol has only one requirement, which is that you have a computed property called **`body`** that returns **`some View`**
- The **`body`** property has an interesting type: **`some View`**. This means it will return something that conforms to the **`View`** protocol, which is our layout. This means we expect some type to be returned, but we don't know what it will be, so we have you covered.
- The **`ContentView_Previews`** struct conforms to the **`PreviewProvider`** protocol. This code is not part of the final app that goes to the App Store; it is only used by Xcode to display a preview of the UI design alongside the code.

### Why structs and not classes

Probably the most important reason for structs is that it forces us to think about isolating state in a clean way.

## SwiftUI View

- It is important to note that **for SwiftUI developers, there is nothing behind our view.** Meaning that when you try to make white space behind font turn `red` you shouldn’t do that with weird hacks or tricks.
- Therefore it is important to try to think in the mindset of **what you see is what you have.**
    - if you have this mindset then instead of thinking how to I make the color behind the text box a different color you think how do I make the text box bigger. Practically it would look like this:
        
        ```swift
        Text("Hello, world!")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.red)
        ```
        
- all something needs to do in order to conform to the **`View`** protocol is to have a single computed property called **`body`** that returns **`some View`**

### Some View

What **`some View`** lets us do is say “this will be a view, such as **`Button`** or **`Text`**, but I don’t want to say what.” So, the hole that **`View`** has will be filled by a real view object, but we aren’t required to write out the exact long type.

- Not sure how important this is going to be, basically `some View` is like an any type, saying put anything inside me and I’ll figure it out by creating a tuple and listing the types. If I struggle with stuff later on I can [revisit this lesson](https://www.hackingwithswift.com/books/ios-swiftui/why-does-swiftui-use-some-view-for-its-view-type)

### View composition (components??)

Swift lets you break up views into multiple smaller views. Below is an example:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("First")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())

            Text("Second")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())
        }
    }
}
```

- This can be made DRY

```swift
struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
            CapsuleText(text: "Second")
        }
    }
}
```

- What I’m not sure on yet is if, you put these in another file or if the convention is for these to live inside the parent.

## Stacks

A way for swiftui’s View to return multiple things, you have three options that I know about now:

1. `**HStack**` - horizontal
2. `**VStack**` - vertical 
3. `**ZStack**` - zindex (depth)
    1. **`ZStack`** draws its contents from top to bottom, back to front. This means if you have an image then some text **`ZStack`** will draw them in that order, placing the text on top of the image.

- I think of these kind of like flex box, in that `HStack` sets it to `flex-direction: column` and `VStack` sets it to `flex-direction` row. While ZStack let’s you play with z-indexs
- Vertical and horizontal stacks automatically fit their content, and prefer to align themselves to the center of the available space. If you want to change that you can use one or more **`Spacer`** views to push the contents of your stack to one side.

## Temp useful components section

*NB put these into sections that make more sense once I get a better idea of where they are commonly used

************`Picker`** - these are like a select input in html.  ************************

`**Stepper`** - simple - | + button takes text, value, range and steps

```swift
@State private var sleepAmount = 8.0

Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25) ****
```

****`DatePicker`** - way for users to set a date (docs are good for these)

```swift
@State private var wakeUp = Date.now

DatePicker("Please enter a date", selection: $wakeUp) ********
```

**`List`** - a scrolling table of data.

- One cool thing about lists is you can mix in static and dynamic data

```swift
List {
    Section("Section 1") {
        Text("Static row 1")
        Text("Static row 2")
    }

    Section("Section 2") {
        ForEach(0..<5) {
            Text("Dynamic row \($0)")
        }
    }

    Section("Section 3") {
        Text("Static row 3")
        Text("Static row 4")
    }
}
```

### View with loops

`**ForEach`** - lets you loop over values and create views, basic example: 

```swift
Form {
    ForEach(0..<100) { number in
        Text("Row \(number)")
    }
}

// or shorthand closure syntax 
Form {
    ForEach(0 ..< 100) {
        Text("Row \($0)")
    }
}

```

- With for each loops we often need to pass **`id: \.self`** because SwiftUI needs to be able to identify every view on the screen uniquely, so it can detect when things change.
    - It looks like this **`ForEach(students, id: \.self)`**

## Forms

- Create a basic one with `Form` view type.
- You can split forms up using `Section`

```swift
Form {
    Section {
        Text("Hello, world!")
    }

    Section {
        Text("Hello, world!")
        Text("Hello, world!")
    }
}
```

## Navigation

- Navigation bars are useful for avoiding your UI hitting the “safe area”, you can do this with **`NavigationView`**

```swift
var body: some View {
    NavigationView {
        Form {
            Section {
                Text("Hello, world!")
            }
        }
    }
}
```

- You place the **`.navigationTitle()`** modifier on the closing brackets of the last child, so it would be on the `Form` in the above example

## State

### Modifying state

- (might need to move this)*property wrapper’s,* are special attributes we can place before our properties that effectively gives them super-powers.

### @State

- **`@State`** - lets us store the programs state and lets us get around the fact that `ContentView`'s are immutable and computed properties
- **`@State`** allows values to be stored separately by SwiftUI in a place that *can* be modified.
- **`@State`** is specifically designed for simple properties that are stored in one view. As a result, Apple recommends we add **`private`** access control to those properties, like this: **`@State private var tapCount = 0`**

example: 

```swift
struct ContentView: View {
    @State var tapCount = 0

    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}
```

- **Why self?** the use of `self`  is necessary because inside the closure of the button, **`tapCount`** is a property of **`self`**, and without using **`self`**, Swift would assume you're trying to access a local variable instead of a property. By using **`self`**, you can modify the **`tapCount`** property of the struct, which updates the view when the property changes.

### Binding state with *two-way binding*

- Two-way binding in SwiftUI is a mechanism that allows you to synchronize the state of a view with its associated data model. In other words, it allows changes made to the view to be reflected in the model and vice versa.

```swift
struct ContentView: View {
    @State var name: String = ""

    var body: some View {
        TextField("Enter your name", text: $name)
				Text("Your name is \(name)")
    }
}
```

- Here, the **`TextField`** view takes a **`Binding`** to a **`String`** value, which is declared as a **`State`** property in the parent **`ContentView`**. **********The `$` creates the two way binding between the State property and the view.**
- But notice how we use `name` and not `$name` in the Text view that is because we don’t want the two way binding here, we just want to ****read**** the value.

## Colors and Frames

- **`Color.primary`** - is the default color of text, will be either black or white depending on user’s device settings
- **`Color.secondary`** - also either black or white depending one the device, but has slight transparency so that a little color behind shines through
- You can create specific colors with rgb `Color(red: 1, green: 0.2, blue: 0)`
    - they take values from 0 - 1
- Frames are like `divs` - you can set width, height and other things and they cover that space.
    
    ```swift
    VStack {
    	Color.red
        .frame(width: 200, height: 200)	
    }
    ```
    
- If you were to set the body to `Color.red`, you’d notice that there is a white bar at the top and the bottom of the screen, the space where it is red is called the *safe area.* Apple deliberately does this so you don’t put important UI elements of your app in the status bar etc.
    - If you do want your content to go under the safe area. You can use the `.ignoreSafeArea()` modifier
- the `background()` modifier also accepts `materials` which allows you to create some depth affects

### Gradients

There are three kind of gradients available in swiftUI:

1. `LinearGradient`
2. `RadialGradient`
3. `AngularGradient`

## Alerts

A basic SwiftUI alert has a title and button that dismisses it.

- You present an alert with `myAlert.show()`
- Because our “views are a function of our state”, you need to setup some state that determines if the user should see the alert or not e.g. `@State **private** **var** showingAlert = false`
    
    ```swift
    @State private var showingAlert = false
    
        var body: some View {
            Button("Show Alert") {
                showingAlert = true
            }
            .alert("Important message", isPresented: $showingAlert) {
                Button("OK") { }
            }
        }
    ```
    
    - I think swift automatically sets `showingAlert` to false if you press the “OK” button on the alert, because all actions in an alert dismiss the alert after the action runs.

## Modifiers

- When we add a modifier to a view, we are creating a new view with that change applied
- So order matters with modifiers, take the below example
    
    ```swift
    Button("Hello, world!") {
        // do nothing
    }    
    .background(.red)
    .frame(width: 200, height: 200)
    //.border(Color.black, width: 1)
    ```
    
- The above produces a small red box and then a white 200x200 frame, if you add `.border(Color.black, width: 1)` you’ll see the frame.
- To crystalize this, have a look at what happens when you use swifts `type(:of)` method
    
    ```swift
    Button("Hello, world!") {
        print(type(of: self.body))
    }    
    .background(.red)
    .frame(width: 200, height: 200)
    ```
    
- The above outputs **`ModifiedContent<ModifiedContent<Button<Text>, _BackgroundStyleModifier<Color>>, _FrameLayout>`**
    - Things to notice here are:
        - every time you use a modifier swift applies that modifier using generics `ModifiedContent<OurThing, OurModifier>`
        - What is happening above is they are getting stacked, **`<ModifiedContent<ModifiedContent`**
    - To read it you need to work from the inner most type, out. So the inner most is **`ModifiedContent<Button<Text>, _BackgroundStyleModifier<Color>`**: our button has some text with a background color applied. Then around that we have **`ModifiedContent<…, _FrameLayout>`**, which takes our first view (button + background color) and gives it a larger frame.

### custom modifiers

Using the `VIewModifier` protocol, you can create your own custom modifiers. 

```swift
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

Text("Hello World")
    .modifier(Title())
```

- You can use `extension`'s to make the easier to use:

```swift
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

Text("Hello World")
    .titleStyle()
```

## Working with Dates

- You can create a basic `Date` type with `Date.now` , which gives you the date and time for that exact moment
- Swift lets you get more general by using the `DateComponents`
    - This lets you read or write specific parts of a date rather than the whole thing
    
    ```swift
    var components = DateComponents()
    components.hour = 8
    components.minute = 0
    let date = Calendar.current.date(from: components) ?? Date.now // use nil coalescing 
    // because date(from:) returns an optional date
    ```
    
    - Above we representing 8am today

## URLs

You can access files in your bundle using the `Bundle.main.url()` method. 

- If the file exists it is sent back to us otherwise it will return `nil`

```swift
if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
    // we found the file in our bundle!
}
```

- Once you have the file you can load it into a a string with `String(contentsOf: )`

```swift
if let fileContents = try? String(contentsOf: fileURL) {
    // we loaded the file into a string!
}
```

- You need the `try?` because if the file can’t be loaded it throws an error

## Animations

You can use the `animation` modifier to smoothly transition changes.

- It takes a animation type like “*ease-in ease-out”* (default)
- It also has a value that it listens for, so it knows when to animate so in the example below it listens for when the `animationAmount` property changes

```swift
struct ContentView: View {
    @State private var animationAmount = 1.0

    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount)
    }
}
```

- When the button gets tapped its action is to add on to `animationAmount` which updates the property, the animation modifier is listening for that and thus it smoothly scales it up and applies blur.
    - without the `animationModifier` the `blur` and `scaleEffect` would appear more stuttered
- You would call these implicit animations because they always need to listen for a value to change

A really cool feature is that swiftUI has spring animations built in

- you can use the `interpolatingSpring` modifier inside of the `animation` modifier
    
    ```swift
    .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
    ```
    
    - `stiffness` of the spring which sets its initial velocity when the animation starts
    - `damping` how fast the animation should be “`damped`” lower values cause the spring to bounce back and forth for longer.

You can also set `duration` on the animation

```swift
.animation(.easeInOut(duration: 2), value: animationAmount)
```

- When you pass the duration argument you are actually creating a new instance of a `Animation` struct that has it’s own modifiers
    - so you can attach modifiers like `delay` or `repeatCount` directly to animation

```swift
.animation(
    .easeInOut(duration: 2)
        .delay(1),
    value: animationAmount
)

// or 

.animation(
    .easeInOut(duration: 1)
        .repeatCount(3, autoreverses: true),
    value: animationAmount
)
```

The **`animation()`** modifier can be applied to any SwiftUI binding, which causes the value to animate between its current and new value, in the below example animationAmount is passed to the `scaleEffect` modifier but it only animates when we use the stepper not on the button press.

```swift
struct ContentView: View {
    @State private var animationAmount = 1.0

    var body: some View {
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)

            Spacer()

            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}
```

- So animation amount is tied to the button press and the stepper press but only one makes them animate.

### Explicit animations

**Above was all implicit animations*

You can explicitly tell swiftui to animate changes occurring as the result of a state change

- Using the `withAnimation` closure, swiftUI ensures any changes resulting from the new state will automatically be animated
    
    ```swift
    struct ContentView: View {
        @State private var animationAmount = 0.0
    
        var body: some View {
            Button("Tap Me") {
                withAnimation {
                    animationAmount += 360
                }
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        }
    }
    ```
    
    - so above you’ll notice there is no `.animation` modifier, rather explicitly saying when the button is tapped add 360 to the animationAmount with an animation. And because animation amount is bound to the `rotation3DEffect` it is animated.
    - You could swap `rotation3DEffect` with the `scaleEffect` we’ve been using and it would still work
        
        ```swift
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount += 1
        	  }
          }
          .padding(50)
          .background(.red)
          .foregroundColor(.white)
          .clipShape(Circle())
          .scaleEffect(animationAmount)
        }
        ```
        

## Showing / hiding views with transitions

You can use the `transition` modifier to animate how a view is show and hidden

- You need some state the toggles the change between whether the view is shown or hidden
- You then wrap that view in the condition
- when the condition changes the transition modifier will handle the change smoothly
- You can also make the transition asymmetric meaning the transition effect will be different on show and hide

```swift
struct ContentView: View {
	@State private var isShowingRed = false

    var body: some View {
        VStack {
            Button("Tap Me") {
                isShowingRed.toggle()
            }
					
					// wrap the view in a condition
          if isShowingRed {
				    Rectangle()
				        .fill(.red)
				        .frame(width: 200, height: 200)
								.transition(.asymmetric(insertion: .scale, removal: .opacity))
					}
    }
}
```