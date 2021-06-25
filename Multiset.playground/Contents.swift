import UIKit

extension Dictionary where Value == Int {
    
    mutating func add(key:Key){
        if self.keys.contains(key) {
            self[key] = self[key]! + 1
        } else {
            self[key] = 1
        }
    }
    
    mutating func count(for element: Key){
        if self.keys.contains(element) {
            print("Count of element \(element) = \(self[element]!)")
        } else {
            print("Count of element \(element) = 0")
        }
    }
    
    mutating func totalCount(){
        var sum = 0
        for key in self.keys {
            sum = sum + self[key]!
        }
        print("Total count of elements = \(sum)")
    }
    
    mutating func remove(element: Key){
        self[element] = nil
    }
}



var a:[String:Int] = [:]
a.add(key: "c")
a.add(key: "c")
a.add(key: "d")
a.totalCount()
a.count(for: "e")
print(a)
a.remove(element: "c")
print(a)

