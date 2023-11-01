import Cocoa

var greeting = "Hello, playground"


var score = 25
if score > 24 {
    print("bigger")
}


let speed = 88
let percentage = 85
let age = 17

if speed >= 88 {
    print("where we're going, we don't need roads")
}

if percentage < 85 {
    print("Sorry, you failed the test")
}

if age >= 18 {
    print("you're elligible to vote")
} else if age < 18 {
    print("Too young!")
}


let temp = 23

if temp > 20 && temp < 30 {
    print("pleasant day")
}

let ourName = "Jeevan"

let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent {
    print("You can buy the game")
}

let friendName = "John"

if ourName < friendName {
    print("ourname is smaller")
}

if ourName > friendName {
    print("ourname is bigger")
}


var numbers = [3,4,5]

numbers.append(6)
if numbers.count > 3 {
    numbers.removeFirst()
}

print(numbers)

if ourName == "Jeevan" {
    print("correct")
}

if friendName != "John" {
    print("yeah")
}

if !friendName.isEmpty {
    print("kosong")
}


enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first > second)


enum TransportOption {
    case airplane, helicopter, car, bicycle, train, bus
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("fly!")
} else if transport == .bicycle {
    print("cycle!")
} else if transport == .car {
    print("drive!")
} else {
    print("Too poor, loser!")
}

enum Weather {
    case sun , rain, windy
}

let forecast: Weather = .sun

switch(forecast) {
case .sun:
    print("sun")
case .rain:
    print("rain")
case .windy:
    print("windy")
}

switch(forecast) {
case .sun:
    print("sun")
    fallthrough
case .rain:
    print("rain")
    fallthrough
case .windy:
    print("windy")
}

let a = "ss"

switch(a){
case "sds":
    print("sds")
default:
    print("bye")
}

let points = 14

let hasPassed = points < 20 ? "Passed": "Failed"
print(hasPassed)

let names = ["jay", "susan"]
let namesCount = names.isEmpty ? 0 : names.count


