import UIKit

protocol Actions {
    func printName() -> ()
}

struct Person {
    var name: String
    
    func printName() {
        print(self.name)
    }
}


var man = Person(name: "Peter")
man.printName() // Direct dispatch

var woman: Actions = Person(name: "Ann") as! Actions
woman.printName() // Witness dispatch


class Animal {
    var name: String
    var weight: Int
    
    init(name:String, weight: Int) {
        self.name = name
        self.weight = weight
    }
    
    func giveWeight() {
        print(self.weight)
    }
}

var cat = Animal(name: "Tom", weight: 5)
cat.giveWeight() // Virtual table


@objcMembers
class Man: NSObject {
    dynamic func sayHello() {
        print("Hello")
    }
}

class Boy: Man {
    dynamic func sayHi() {
        print("Hi")
    }
}

var peter = Boy()
peter.sayHi()
peter.perform(#selector(Man.sayHello)) // message dispatch

