import Cocoa

var name = "Jeevan"
name = "Tom"
name = "tom2"
name = "yeah"

let team = "team1"

var user = "tim"
print(user, terminator: "")

user = "jon"

print(user, terminator: "")


user = "matthew is \"horny\" today"

print(user, terminator: "")

let longStringLine = """
A day in the life of multiline strings
I mean this looks really messy
What is this? Blogspot.com?
lawlz
"""

print(longStringLine.isEmpty)

print(longStringLine.hasPrefix("A "))
let arr = ["a day in the life","a day in your mum", "a day in clouds", "why are you running?", "fuck off", "jeez"]

let result = arr.filter{ text in
    return text.hasPrefix("a day")
}

print(result)

var num1 = 100
let num2 = 100_000_000____000
//num1 += 5

num1.quotientAndRemainder(dividingBy: 2)
num1.distance(to: 104)
print(num1.quotientAndRemainder(dividingBy: 2))

let val = num1.quotientAndRemainder(dividingBy: 2).quotient
let rem = num1.quotientAndRemainder(dividingBy: 2).remainder


let arr2 = [1,104,205,232,99]

let ans = arr2.filter { val in
    return val.isMultiple(of: 3)
}

print(ans)



let num = 0.1 + 0.2
print(num)

let a = 3
let b = 4.0
let c = Double(a) + b

let fileName = "myfile.jpg"

print(fileName.isEmpty)

var isAlertDisplayed = false

isAlertDisplayed.toggle()
print(isAlertDisplayed.description)


//string concat

let firstWord = "Hello"

let secondWord = "World"
let together = firstWord + " my " + secondWord
print(together)
let together2 = "\(firstWord.isEmpty) my \(secondWord)"
print(together2 )
