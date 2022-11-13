import UIKit

// TYPEALIAS FOR SIMPLE TYPE
typealias Integer = Int
let num1: Integer = 1       // Int: 1
let num2: Int = 10          // Int: 10
print(num1 + num2)          // Int: 11



// TYPEALIAS FOR DICTIONARIES TYPE
typealias Parameter = [String: Any]
let user: Parameter = [
    "name" : "Panicz",
    "gender" : "Male",
    "age" : 30
]



// TYPEALIAS FOR CLOSURES TYPE
typealias NameType = (String, String) -> String
let names: NameType = { firstName, lastName in
    return "\(firstName) \(lastName)"
}
print(names("Wojciech", "Spaleniak"))



// TYPEALIAS AS COMBINE DIFFERENT TYPES
protocol ProtocolA {
    func printA()
}

protocol ProtocolB {
    func printB()
}

protocol ProtocolC {
    func printC()
}

typealias MyProtocols = ProtocolA & ProtocolB & ProtocolC       // IMPORTANT: & (and) INSTEAD , (comma)

class MyClass: MyProtocols {                                    // MyProtocols == ProtocolA, ProtocolB, ProtocolC
    func printA() { print("AAA") }
    func printB() { print("BBB") }
    func printC() { print("CCC") }
}

let newItem = MyClass()
newItem.printA()
newItem.printB()
newItem.printC()



// EXAMPLE WITH TABLE VIEW

// STANDARD WAY:
// extension HomeViewController: UITableViewDataSource, UITableViewDelegate {...}
// extension MainViewController: UITableViewDataSource, UITableViewDelegate {...}
// extension MenuViewController: UITableViewDataSource, UITableViewDelegate {...}

// TYPEALIAS WAY:
// typealias TableView = UITableViewDataSource & UITableViewDelegate
// extension HomeViewController: TableView {...}
// extension MainViewController: TableView {...}
// extension MenuViewController: TableView {...}
