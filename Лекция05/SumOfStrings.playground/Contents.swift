import UIKit

var number1 = "132"
var number2 = "40"

func sum(number1: String, number2: String) -> String {
    return String(Int(number1)! + Int(number2)!)
}

var summa = sum(number1: number1, number2: number2)
