import Cocoa

var greeting = "Hello, playground"

struct Address {
    let block: Int
    let level: Int
    let unit: Int
    let postalCode: Int
    
    func printAddress() {
        print("Block \(block), Level \(level), Unit \(unit), Postal \(postalCode)")
    }
}


let jeevanHome = Address(block: 90, level: 2, unit:42, postalCode: 391090)
let alvinHome = Address(block: 69, level: 10, unit:34, postalCode: 376543)
jeevanHome.printAddress()
alvinHome.printAddress()


struct Pet {
    var name: String
    var nickName: String = "unknown"
    var isAdopted: Bool
    
    var fullName: String {
        get {
            "\(name) \(nickName)"
        }
        
        set {
            let nameVals = newValue.split(separator: " ")
            if nameVals.count == 2{
                name = String(nameVals[0])
                nickName = String(nameVals[1])
            }
        }
    }

    mutating func isAvailable() {
        if !isAdopted {
            print("Available for adoption!")
            isAdopted = true
            print("You have adopted \(name)!")
        } else {
            print("Adopted!")
        }
    }
}

var dog = Pet(name: "Waffle", isAdopted: false)
var cat = Pet(name: "Pancake", nickName: "Fluffy", isAdopted: false)

print(cat.fullName)
cat.fullName = "Jack Ryan"
print(cat.fullName)

let a = 1
let b = 2.0
let c = Double(a) + b



struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New Value is: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value is: \(oldValue)")
        }
    }
}


var app = App()
app.contacts.append("Grey")
app.contacts.append("Yellow")
app.contacts.append("Blue")



struct Player {
    var name: String
    var number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Jill")
print(player.number)
