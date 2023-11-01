import Cocoa

var names = ["Tom", "James", "Lisa", "Susan", "Jordan", "Lola"]
var numbers = [3,56,74,32]
var temps = [32.4,26.5,17.2]

names.append("Jeevan")


//var scores = Array<Int>()





var scores = [Int]()
scores.append(100)
scores.append(80)
scores.append(70)
scores.forEach { s in
    print(s)
}

print(names.contains("Tom"))
print(names.sorted())
print(names.reversed())
let playlistSizes = (100, 200, 300)
playlistSizes.1



let employee = [
    "name": "Jeevan",
    "job": "Test Engineer",
    "company": "Dyson"
]

var gradStatus = [
    "Jeevan": false,
    "Tom": true,
    "Jod": true

]

var isFoodHot = [String: Bool]()
isFoodHot["acai"] = false
isFoodHot["curry"] = true

print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])
print(employee["Dyson",default: "unknown"])


//gradStatus.updateValue(true
 //                      , forKey: "Jeevan")

let filteredStatus = gradStatus.filter { $0.value == true }
print(filteredStatus)



let actors = Set([
"apple","Tom","grapes","Jollybeans"])
print(actors)

var items = Set<String>()
items.insert("pencil")
items.insert("pen")
items.insert("eraser")
items.insert("eraser")

print(items)



enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .friday



