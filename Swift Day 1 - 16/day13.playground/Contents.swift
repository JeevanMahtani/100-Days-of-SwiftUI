import Cocoa

var greeting = "Hello, playground"


protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
    var name: String { get }
    var currentPassengers: Int { get set }
}


struct Car: Vehicle {
    let name = "car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    func openSunroof() {
        print("It's a nice day")
    }
    
}

struct Bicycle: Vehicle {
    let name = "bike"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km")
    }
}



func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("too slow using")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    vehicles.forEach { 
        print("\($0.name): \($0.estimateTime(for: distance)) hours to travel \(distance)")
    }	
}

let car = Car()
let bike = Bicycle()
commute(distance: 100, using: car)
commute(distance: 100, using: bike)
getTravelEstimates(using: [car,bike], distance: 150)



func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}



var text = "this is what a sentence looks like "
var multiline = """
one line
two line
three line
four line
"""
let processedText = text.trimmingCharacters(in: .whitespacesAndNewlines)


extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}
let text2 = text.trimmed()
print(text2)
text.trim()
print(multiline.lines.count)


struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
    

}


let lotr = Book(title: "Lord of the rings", pageCount: 1000)


extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}


extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["a","b","c"]
if guests.isNotEmpty {
    print("nope")
}
