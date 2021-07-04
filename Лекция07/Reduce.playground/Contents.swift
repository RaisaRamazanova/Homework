import UIKit

var array = [2, 3, 6, 5, 4]

// filter

var array2 = array.reduce([], { a, b in
    var c = a
    if b > 5 { c.append(b) }
    return c
})

print(array2)

// map

var array3 = array.reduce([], { a, b in
    var c = a
    c.append(b*b)
    return c
})

print(array3)
