/*
 NOTE:
 
 - CLOSURES AND FUNCTIONS ARE THE SAME THING - DIFFERENCE IS THE SYNTAX
 - WE CAN CREATE ARRAYS WITH CLOSURES, BUT THEY SHOULD BE THE SAME TYPE
 - WE CAN CREATE DICTIONARIES WITH CLOSURES, BUT THEY SHOULD BE THE SAME TYPE
 - WE CAN USE CLOSURE AS PARAMETER IN FUNCTION
 - WE CAN USE CLOSURE FOR RETURN VALUE OF FUNCTION
 - WE CAN USE CLOSURE FOR SEND INFORMATION FROM ONE VIEW CONTROLLER TO ANOTHER
 
 */

import UIKit

// FUNCTION 'ADD'
func add(num1: Int, num2: Int) -> Int {
    return num1 + num2
}
print(add(num1: 5, num2: 10))



// CLOSURE 'ADD'
// WAY 1:
let add1 = { (num1: Int, num2: Int) -> Int in
    return num1 + num2
}
print(add1(5, 15))

// WAY 2:
let add2: (Int, Int) -> Int = { (num1, num2) in
    return num1 + num2
}
print(add2(10, 20))

// WAY 3:
let add3: (Int, Int) -> Int = {
    return $0 + $1
}
print(add3(7, 7))



// OTHER CLOSURE
let sub1: (Int, Int) -> Int = {
    return $0 - $1
}



// CLOSURES IN ARRAY
let arrayWithClosures = [
    add1,
    add2,
    add3,
    sub1
]
let clos1 = arrayWithClosures[3]
print(clos1(3, 2))



// CLOSURES IN DICTIONARY
let dictionaryWithClosures = [
    "add1" : add1,
    "add2" : add2,
    "add3" : add3,
    "sub1" : sub1
]
let clos2 = dictionaryWithClosures["add2"]!
print(clos2(5, 2))



// CLOSURE AS PARAMETER IN FUNCTION
func opera(num1: Int, num2: Int, result: (Int, Int) -> Void) {
    let add = num1 + num2
    let sub = num1 - num2
    result(add, sub)
}

opera(num1: 10, num2: 5) { addition, subtraction in
    print("The addition is: \(addition)")
    print("The subtraction is: \(subtraction)")
}



// FUNCTION THAT RETURNS CLOSURE
func game() -> () -> Int {
    var multiplier = 0
    let increase = { () -> Int in
        multiplier += 1
        return multiplier
    }
    return increase
}

let game1 = game()
print(game1())          // 1
print(game1())          // 2
print(game1())          // 3

let game2 = game()
print(game2())          // 1
