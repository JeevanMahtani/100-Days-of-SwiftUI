import Cocoa

var greeting = "Hello, playground"


var number: Int = 0
var numArray: [Int] = [Int]()
numArray.append(contentsOf: [1,2])
print(numArray)
print("I am a \"good\" person")
let multiline: String = """
hello
this
is
a
multiline
"""

var a = multiline.count


let employee = [
    "name": "Tom",
    "job" : "IT",
    "age" : 23
    
] as [String : Any]

print(employee["age"] ?? "No age")

var numSet = Set<Int>([3,6,5,2,54,3])
numSet.insert(3)
var j = numSet.map { s in
    s * 3
}
print(j)


enum Weather {
    case sunny, rainy, cloudy, snowy
}

for i in stride(from: 6, through: 1, by: -1) {
    print(i)
}
