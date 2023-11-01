import Cocoa

var greeting = "Hello, playground"


func greetUser() {
    print("Hello")
}

var greetCopy = greetUser
greetCopy()

let sayHello = {
    print("Hello")
}

sayHello()

let sayHi = { (name: String) -> String in 
    "Hi \(name)!"
}

func getUserData(for id: Int) -> String {
    if id == 1990 {
        return "best year"
    }  else {
        return "boo"
    }
}

var data: (Int) -> String = getUserData
print(data(1990))

var h = ["Jacob","Jenny","Tom","Lex"]

func sortByCaptain(firstName: String, secondName: String) -> Bool{
    if firstName == "Tom"{
        return true
    }else if secondName == "Tom" {
        return false
    }
    
    return firstName < secondName
}
let j = h.sorted(by: sortByCaptain)
print(j)

let o = h.sorted { firstName, secondName in
    if firstName == "Tom"{
        return true
    }else if secondName == "Tom" {
        return false
    }
    
    return firstName < secondName
}


let p = h.sorted { 
    if $0 == "Tom"{
        return true
    }else if $1 == "Tom" {
        return false
    }
    
    return $0 < $1
}

print(o)


var difficultyRating = { (trick: String) -> Int in
    if trick == "ollie" {
        return 1
    } else if trick == "Yoyo Plant" {
        return 3
    } else if trick == "900" {
        return 5
    } else {
        return 0
    }
}
print(difficultyRating("ollie"))


//checkpoint 5
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let processedNumbers = luckyNumbers
    .filter { !$0.isMultiple(of: 2) }
    .sorted()
    .map { print("\($0) is a lucky number.")}
        
