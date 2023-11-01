import Cocoa

var greeting = "Hello, playground"

let numbers: [Int]? = [56,43,87,90,235,545,23]

let number = numbers?.randomElement() ?? Int.random(in: 1...100)
