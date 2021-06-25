import UIKit

struct Identifier {
    var id = 1
}

class Ref<T> {
    var value: T
    init(value: T) {
        self.value = value
    }
}

struct Container<T> {
    var ref: Ref<T>
    init(value: T) {
        self.ref = Ref(value: value)
    }
    
    var value: T {
        get {
            ref.value
        }
        set {
            guard (isKnownUniquelyReferenced(&ref)) else {
                ref = Ref(value: newValue)
                return
            }
            ref.value = newValue
        }
    }
}

