import UIKit

// GENERIC FUNCTION
func sum<T: AdditiveArithmetic>(num1: T, num2: T) -> T {
    return num1 + num2
}

sum(num1: 10, num2: 5)          // Int
sum(num1: 10.7, num2: 5.2)      // Double



// GENERIC STRUCT
struct Cart<T> {
    let items: [T]
}

let cartString = Cart<String>(items: ["Bags", "Shoes", "Shorts"])
let cartInt = Cart<Int>(items: [10, 50, 90, 33, 77])

cartString.items[0]
cartInt.items[0]
