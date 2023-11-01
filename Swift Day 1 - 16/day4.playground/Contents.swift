import Cocoa

var greeting = "Hello, playground"



let name: String = "Jeevan"
var score: Int = 0

var albums: [String] = [""]
var setExample = (["hey","hi"])


var cities = [String]()
var citiesSet = Set<String>([])
citiesSet.insert("hey")
print(citiesSet)
print(setExample)

var studentscores = [String: Int]()
studentscores["Jeevan"] = 90
studentscores["Patrick"] = 80


enum Direction {
    
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

var firstDay: Direction = .monday


/*let names = ["Eleanor", "Chidi", "Tahani", "Jianyu", "Michael", "Janet"]
let jNames: [String] =  names.filter { name in
    return name.starts(with: "J")
}

print(jNames)*/

let namesDictionary = [String: Int]()
let names = ["John","Jane","Tom","Pete","Tom","John"]
print(names.count)
let uniqueNames = Set(names)
print(uniqueNames.count)
