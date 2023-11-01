import Cocoa

//celsius to farenheit converter
var containsDecimal = false
let celsiusTemp = 15
let farenheitTemp = ((celsiusTemp * 9) / 5) + 32
print("Temperate in celsius: \(celsiusTemp)°C. Temperature in Farenheit: \(farenheitTemp)°F")

let temps = [3,3.6,5,6.89,3,4.5,9]

let solidTemps = temps.filter { val in
    let remainder = val.truncatingRemainder(dividingBy: 1)
    return remainder == 0
}

print(solidTemps)
