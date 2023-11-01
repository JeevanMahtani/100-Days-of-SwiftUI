import Cocoa

var greeting = "Hello, playground"

let opposites = [1: "Mario", 2: "Wario"]

if let mario = opposites[3] {
    print(mario)
} else {
    print("No Value!")
}


func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
if let unwrappedNum = number {
    print(square(number: unwrappedNum))
}

func printName(of name: String?) {
    guard let name = name else {
     print("No Name!")
     return
    }
    print("Hello \(name)")
}

printName(of: )
printName(of: "James")

let menu =  [
    1: "Chicken",
    2: "Fish",
    3: "Tofu"
]

let food = menu[4] ?? "Not Found"
print(food)

let tvShows = ["show1","show2","show3"]
let tvShow = tvShows.randomElement() ?? "None"
print(tvShow)

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "abc", author: nil)
let author = book.author ?? "No author"
print(author)

let input = ""
let num = Int(input) ?? 0
print(num)


let names = ["towel", "cloth", "brush", "lever"]

let object = names.randomElement()?.capitalized ?? "No object"
let firstLetter = names.randomElement()?.first?.uppercased() ?? "AA"
print(firstLetter)


enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
    
    
let user = (try? getUser(id: 23)) ?? "Anonymous"
    print(user)
}
