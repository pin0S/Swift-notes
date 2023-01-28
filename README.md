# 100 Days of SwiftUI

# 100 Days of SwiftUI

**Up to: Day 13**

### Notes:

\*removed days, so I can better put data into categories.

## Fun facts

- I find the examples different languages use to be funny, swiftUI might be one of my favorites using Taylor Swift as an example because you know.

```swift
let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)
```

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

\*_Note: added concatenation & interpolation to strings section_

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

- ****************\*\*****************logical operators****************\*\*****************
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

\*Cool little way to remember how ternaries work from the course **\*\***WTF = what, true, false**\*\***

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
  - swift call this the functions ****\*****call site,****\***** in laymans it means a place where the function is called

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

You can use ******\*\*******`return` to force a function to exit early\*\*

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

3. Tuples have a similar thing to destructuring in javascript, you just pass the names inside of parentheses and they you can call those variables.

   ```swift
   let (firstName, lastName) = getUser()
   print("Name: \(firstName) \(lastName)")
   ```

### Customizing parameter labels

\*_this is semi important I see this syntax all over the place and didn’t understand it until now_

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
     - \*NB: External parameter is the parameter that is used when calling the function, so above the external parameter name is `_` and below it is `for`

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
