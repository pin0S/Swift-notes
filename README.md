# Swift-notes

## Fun facts

- I find the examples different languages use to be funny, swiftUI might be one of my favorites using Taylor Swift as an example because you know.

```swift
let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)
```

# Day 1

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

# Day 2

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

**Note: added concatenation & interpolation to strings section** for day 2

# Day 3
