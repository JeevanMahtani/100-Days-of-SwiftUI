import Cocoa

var greeting = "Hello, playground"


class Game {
    var score = 0 {
        didSet {
            print("score is no \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10



class Animal {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func printOurSpecies() {
        print("We are animals!")
    }
}

class Cat: Animal {
    let litterType: String
    
    init(name: String, litterType: String) {
        self.litterType = litterType
        super.init(name: name) 
    }
    
    func greeting(){
        print("I'm a cat named \(name)")
    }
    
    override func printOurSpecies() {
        print("I am a feline!")
    }
}

class Dog: Animal {
        
    func greeting(){
        print("I'm a dog named \(name)")
    }
    
    override func printOurSpecies() {
        print("I am a canine!")
    }
}



let dog = Dog(name: "Horlicks")

dog.printOurSpecies()
let cat = Cat(name: "Max", litterType: "Tofu")


class User {
    var username = "John"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
    
    deinit {
        print("bye")
    }
}

var user1 = User()
var user2 = user1.copy()
user2.username = "Horus"

print(user1.username)
print(user2.username)


