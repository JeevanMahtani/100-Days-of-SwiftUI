import Cocoa

var greeting = "Hello, playground"


struct BankAccount {
    private var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)

let success = account.withdraw(amount: 200)

if success {
    print("Withdrawn successfull!")
} else {
    print("Insufficient funds!")
}

struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school")
        studentCount += 1
    }
}

School.add(student: "Student 1")
print(School.studentCount)


struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}




struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "dummyuser", password: "123456")
}


//checkpoint 4

struct Car {
    
    enum Direction {
        case up, down, neutral
    }
    
    let model: String
    let seats: Int
    private (set)var currentGear: Int

    init(model: String, seats: Int) {
        self.model = model
        self.seats = seats
        self.currentGear = 0
    }
    
    mutating func changeGear(_ direction: Direction) {
        if currentGear == 0 && direction == .down {
            print("Already at neutral!")
        } else if currentGear == 10 && direction == .up {
            print("Already at max gear!")
        } else {
            switch(direction){
            case .up:
                currentGear += 1
            case .down:
                currentGear -= 1
            case .neutral:
                currentGear = 0
            }
        }
    }
}

var car1 = Car(model: "Toyota", seats: 5)
print("Current Gear: \(car1.currentGear)")
car1.changeGear(.up)
print("Current Gear: \(car1.currentGear)")
car1.changeGear(.up)
print("Current Gear: \(car1.currentGear)")
car1.changeGear(.up)
print("Current Gear: \(car1.currentGear)")
car1.changeGear(.up)
print("Current Gear: \(car1.currentGear)")
car1.changeGear(.up)
car1.changeGear(.up)
car1.changeGear(.up)
car1.changeGear(.up)
car1.changeGear(.up)
car1.changeGear(.up)
print("Current Gear: \(car1.currentGear)")
car1.changeGear(.up)

