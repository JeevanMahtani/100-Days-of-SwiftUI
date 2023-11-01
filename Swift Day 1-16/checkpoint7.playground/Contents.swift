import Cocoa

var greeting = "Hello, playground"


class Animal {
    var legs: Int

    init(legs: Int) {
        self.legs = legs
    }
 
}

class Dog: Animal {
    
    func speak() {
        print("Bark!")
    }
}


class Poodle: Dog {
    override func speak() {
        print("Poodle Bark!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Corgi Bark!")
    }
}


class Cat: Animal {
    var isTame: Bool
    init(legs:Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    func speak() {
        print("Meow!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Persian Meow!")
    }
}

class Lion: Cat {
    override func speak() {
        print("Lion Raaaaawr!")
    }
}


let cat = Cat(legs: 4, isTame: true)
