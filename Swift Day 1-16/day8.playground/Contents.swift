import Cocoa

var greeting = "Hello, playground"


func printTimesTable(for number: Int = 2,end: Int = 10) {
    for i in 1...end {
        print("\(i) x \(number) is \( i * number)")
    }
}

printTimesTable()


enum PasswordError: Error {
    case short, obvious
}

func checkPassword (_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short}
    if password == "12345" { throw PasswordError.obvious}
    
    if password.count > 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}


//checkpoint 4
// don't consider doubles
enum NumberError: Error {
    case outofbounds, noroot
}


func squareRoot(of number: Int) throws -> Int {
    if number < 1 || number > 10000 { throw NumberError.outofbounds }
    for i in 1...100 {
        if number / i == i {
            return i
        }
    }
   throw NumberError.noroot

}


    do {
        let root = try squareRoot(of: 144)
        print(root)
    } catch NumberError.outofbounds {
        print("Number out of bounds.")
    } catch NumberError.noroot {
        print("No root")
    }



let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please us er a longer password.")
} catch PasswordError.obvious {
    print("Too obvious!")
} catch {
    print("Unknown error: \(error.localizedDescription)")
}
