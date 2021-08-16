import UIKit

struct MyOwnSuperDictionary <Element: Hashable> {
    fileprivate var contents: [Element: Int] = [:]

    var uniqueCount: Int {
      return contents.count
    }
    
    func totalCount() -> Int {
        return contents.values.reduce(0) { $0 + $1 }
    }
    
    func count(for element: Element) -> Int {
        if let count = contents[element] {
            return count
        }
        return 0
    }

    mutating func add(_ member: Element, occurrences: Int = 1) {
      precondition(occurrences > 0, "Только положительные числа")
      if let currentCount = contents[member] {
        contents[member] = currentCount + occurrences
      } else {
        contents[member] = occurrences
      }
    }
    
    mutating func remove(_ member: Element, occurrences: Int = 1) {
      guard
        let currentCount = contents[member],
        currentCount >= occurrences
        else {
          return
      }

      precondition(occurrences > 0, "Нельзя удалить")
      if currentCount > occurrences {
        contents[member] = currentCount - occurrences
      } else {
        contents.removeValue(forKey: member)
      }
    }
}


var money = MyOwnSuperDictionary<String>()
money.add("ruble")
money.add("dollar", occurrences: 2)
money.remove("dollar")
money.remove("dollar")
money.add("euro", occurrences: 5)
money.totalCount()
money.count(for: "dollar")
print(money)
print("ovations!")
