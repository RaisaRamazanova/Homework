import UIKit

class Operation {
    func oper(num: [Int]) -> Bool {
        if num[3] == 1 {
            return num[0]+num[1] == num[2]
        }
        if num[3] == 2 {
            return num[0]-num[1] == num[2]
        }
            print("Не понимаю ваш пример")
            return false
    }
}

let n = Operation()

enum MathExamples: Error {
//    case doItAgain(message: String, value: Double)
    case wellDone
    case noExamples
    case redo
}


func checkNumbers (array: [String]) throws -> Result<MathExamples, MathExamples>{
    if array == [] {
        return .failure(MathExamples.noExamples)
    } else {
        for example in array {
            let num = getNumbers(array:example)
            if n.oper(num: num) == false { return .failure(MathExamples.redo)}
            }
        }
//    return .failure(MathExamples.wellDone)
    return .success(MathExamples.wellDone)
}

func typeOfNumbers (array: [Int]) -> Bool {
    return true
}

func checkTask (example: String) throws -> Result<MathExamples, MathExamples> {
    let num = getNumbers(array: example)
    if typeOfNumbers(array: num) == false { return .failure(MathExamples.noExamples) }
    if n.oper(num: num) == false {
        print("Правильный ответ \(num[0]+num[1])")
        return .failure(MathExamples.redo)}
    return .success(MathExamples.wellDone)
}
    


func getNumbers (array: String) -> [Int] {
    var number  = [0, 0, 0, 0]
    var j = 0
    for char in array {
        if char != " " && char != "+" && char != "-" && char != "=" {
            let b = Int(String(char)) ?? 0
            number[j] = b + 10 * number[j]
        } else {
            if char != " " {
                j += 1
                if char == "+" { number[3] = 1 }
                if char == "-" { number[3] = 2 }
                if char == "=" { continue }
            }
        }
    }
    return number
}

func summary (answer: Result<MathExamples, MathExamples>) {
    switch answer {
    case .success(_): print("Все верно")
    case let .failure(error):
        switch error {
        case .wellDone: print("Все верно")
        case .redo: print("Переделывай")
        case .noExamples: print("Нет примеров")
        }
    }
}


let arrayOfExamples =  try checkNumbers(array: ["4+6=10", "10-5=5"])
let oneExample = try checkTask(example: "10+5=15")

let a: () = summary(answer: arrayOfExamples)
let b: () = summary(answer: oneExample)
