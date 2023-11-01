import Cocoa

var greeting = "Hello, playground"


protocol Building {
    var numberOfRooms: Int { get }
    var cost: Int { get set }
    var agentName: String { get set}
    func printSalesSummary()
}


struct House: Building {
    var numberOfRooms: Int
    
    var cost: Int
    
    var agentName: String
    
    func printSalesSummary() {
        print("This house costs $\(cost), sold by \(agentName) and has \(numberOfRooms) rooms")
    }
    
    
}

struct Office: Building {
    var numberOfRooms: Int
    
    var cost: Int
    
    var agentName: String
    
    func printSalesSummary() {
        print("This office costs $\(cost), sold by \(agentName) and has \(numberOfRooms) rooms")
    }
    
}


var house = House(numberOfRooms: 10, cost: 500000, agentName: "Agent A")
var office = Office(numberOfRooms: 50, cost: 5000000, agentName: "Agent B")

house.printSalesSummary()
office.printSalesSummary()
