import Cocoa



func showWelcome() {
    print("Hello")
    print("Hi")
    print("Ola")
    print("Bonjour")
}

showWelcome()

func printTimesTable(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable(number: 5, end: 20)


let root = sqrt(130)
print(root)


func rollDice() -> Int {
    return Int.random(in: 1...6)
}



let result = rollDice()
print(result)


func sameLetters(first: String, second: String) -> Bool {
    let firstSorted = first.sorted()
    let secondSorted = second.sorted()
    
    if firstSorted.count != secondSorted.count {
        return false
    }
    return firstSorted == secondSorted
}

print(sameLetters(first: "lobo", second: "oblo"))

func pythagoras(a: Double, b:Double) -> Double {
    sqrt(a * a + b * b)
}

print(pythagoras(a: 3, b: 4))


func getUsers() -> [String] {
    ["Tom","Cruise"]
}

func getUser() -> (firstName:String, lastName: String) {
    (firstName: "John", lastName: "Travolta")
}

let user = getUser()
print(user.firstName, user.lastName)

func getOneUser() -> (String, String) {
    (firstName: "John", lastName: "Travolta")
}

let (firstName, lastName) = getOneUser()

print(firstName,lastName)


func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}
let results = isUppercase("Hey")


func printTimesTables(for number: Int) {
    for i in 1...10{
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 10)
