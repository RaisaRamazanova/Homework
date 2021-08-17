import UIKit

var number1 = "132"
var number2 = "40"

func sum(num1: String, num2: String) -> String {
    return String(Int(num1)! + Int(num2)!)
}

var summa = sum(num1: number1, num2: number2)

print(sum(num1: "0", num2: "99807654321") == "99807654321")
print(sum(num1: String(Int.max), num2: String(Int.max)) == "18446744073709551614")
print(sum(num1: "0", num2: "0") == "0")

print(sum(num1: "98765", num2: "5") == "98770")

print(sum(num1: "98765", num2: "495") == "99260")
print(sum(num1: "1126351526125351621621261", num2: "123212136263623127182182818218212121212") == "123212136263624253533708943569833742473")
