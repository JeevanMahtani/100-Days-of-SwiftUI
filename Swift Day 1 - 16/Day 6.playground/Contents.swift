import Cocoa

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}


for i in 1...12 {
print("This is the \(i) times table")
    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }
    print()
}


for i in 1...5 {
    print(i)
}

print() 

for i in 1..<5 {
    print(i)
}


var lyrics = "Haters gonna"

for _ in 1...6 {
    lyrics += " hate"
}
 print()

var countdown = 10

while countdown > 0 {
    print(countdown)
    countdown -= 1
}

let id = Int.random(in: 1...1000)

let amount = Double.random(in: 0...1)

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("Rolled \(roll)")
}

print("Critical hit!")

var cats: Int = 0
while cats < 10 {
    cats += 1
    print("I'm getting another cat.")
    if cats == 4 {
        print("Enough cats!")
        cats = 10
    }
}

let names = ["tom", "hardy", "joan", "jett"]

for name in names {
    if !name.starts(with: "j") {
        continue
    }
    print(name)
}

let num1 = 4
let num2 = 14

var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: num1) && i.isMultiple(of: num2) {
        multiples.append(i)
    }
    
    if multiples.count == 10 {
        break
    }
}

print(multiples)


//fizz buzz problem


for i in 1...100 {
    if (i.isMultiple(of: 3) && i.isMultiple(of: 5)) {
        print("FizzBuzz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else if i.isMultiple(of: 3)  {
        print("Fizz")
    } else {
        print(i)
    }
}


///read a file of names
/// Process some data
/// filter out any non png files
/// filter out any files that have numbers in the name
/// if there are duplicate file names regardless of case sensitivity, filter them out

let filesToProcess = ["tomProfilePic.png",
                      "janeProfilePic.jpg",
                      "joeProfilePic.jpg",
                      "janeprofilePic.png",
                      "crenProfilePic.jpg",
                      "juliusProfilePic.png",
                      "s4anProfilePic.png"]


var filteredFiles = Set<String>()
var originalFileNames = [String:String]()

outerLoop: for file in filesToProcess {
    let originalFile = file
    var lowercasedFile = file.lowercased()
    var isValid = true
    if !lowercasedFile.hasSuffix(".png") {
        continue
    }
    
    for char in lowercasedFile {
        if char.isNumber {
            break outerLoop
        }
        
        
    }
    filteredFiles.insert(originalFile)
   
}
print(filteredFiles)
