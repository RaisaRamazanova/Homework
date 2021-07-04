import UIKit

struct LinkedList<T> {
    var head: LinkedListNode<T>
    
    init(head: LinkedListNode<T>) {
        self.head = head
    }
}

indirect enum LinkedListNode<T> {
    case value(element: T, next: LinkedListNode<T>)
    case end
}

let element1 = LinkedListNode.value(element: "A", next: element2)
let element2 = LinkedListNode.value(element: "A", next: element3)
let element3 = LinkedListNode.value(element: "A", next: element4)
let element4 = LinkedListNode.value(element: "A", next: .end)

extension LinkedList: Sequence {
    func makeIterator() -> LikedListIterator<T> {
        return LikedListIterator(current: head)
    }
}

struct LikedListIterator<T>: IteratorProtocol {
    var current: LinkedListNode<T>
    
    mutating func next() -> T? {
        switch current {
        case let .value(element, next):
            current = next
            return element
        case .end: return nil
        }
    }
}

let list = LinkedList(head: element1)
list.contains("A")
