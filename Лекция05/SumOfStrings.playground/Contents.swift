import UIKit

func pow(_ x: Int, _ y: Int) -> Int {
  var result = 1
    for _ in 0..<y {
    result *= x
  }
  return result
}


func sum(num1: String, num2: String) -> String {
    var i = 0
    var summa = ""
    var n1 = num1
    var n2 = num2
    var count = 0
    var flag = 0
    if num1.count < num2.count {
        count = num2.count
    } else {count = num1.count}
    
    while i < num1.count && i < num2.count {
        var timeSum = 0
        timeSum = Int(String(n1[n1.index(before: n1.endIndex)]))! + Int(String(n2[n2.index(before: n2.endIndex)]))!
        print("timeSum = ", timeSum)
        if flag == 1 {
            timeSum += 1
            flag = 0
        }
        if timeSum > 9 {
            timeSum = timeSum - 10
            flag = 1
        }
        
        summa.append(String(timeSum))
        n1.remove(at: n1.index(before: n1.endIndex))
        n2.remove(at: n2.index(before: n2.endIndex))
        i += 1
    }
    if n1 == "" {
        while i < count {
            var timeSum = Int(String(n2[n2.index(before: n2.endIndex)]))!
            if flag == 1 {
                timeSum += 1
                flag = 0
            }
            if timeSum > 9 {
                timeSum = timeSum - 10
                flag = 1
            }
            summa.append(String(timeSum))
            n2.remove(at: n2.index(before: n2.endIndex))
            i += 1
        }
    }
    if n2 == "" {
        while i < count {
            var timeSum = Int(String(n1[n1.index(before: n1.endIndex)]))!
            if flag == 1 {
                timeSum += 1
                flag = 0
            }
            if timeSum > 9 {
                timeSum = timeSum - 10
                flag = 1
            }
            summa.append(String(timeSum))
            n1.remove(at: n1.index(before: n1.endIndex))
            i += 1
        }
    }
    
    if flag == 1 {
        summa.append(String(1))
    }
    let str = String(summa.reversed())
    return str
}


print(sum(num1: "123456", num2: "123") == "123579")
print(sum(num1: String(Int.max), num2: String(Int.max)) == "18446744073709551614")
print(sum(num1: "0", num2: "0") == "0")

print(sum(num1: "98765", num2: "5") == "98770")

print(sum(num1: "98765", num2: "495") == "99260")
print(sum(num1: "1126351526125351621621261", num2: "123212136263623127182182818218212121212") == "123212136263624253533708943569833742473")
