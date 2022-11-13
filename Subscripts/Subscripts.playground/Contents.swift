import UIKit

struct Classroom {
    var students = [
        ["Eric", "Peter", "Quagmire", "Randy"],
        ["Messi", "Ronaldo", "Ronaldinho", "Xavi"],
        ["Trey", "Usher", "Nicki", "Alicia"],
        ["Mark", "Bill", "Elon", "Jeff"]
    ]
    
//    ONLY GET:
//    ARRAY CAN BE 'LET'
//    subscript(row: Int, col: Int) -> String {
//        return students[row][col]
//    }
    
//    GET & SET:
//    ARRAY SHOULD BE 'VAR'
    subscript(row: Int, col: Int) -> String {
        get {
            return students[row][col]
        }
        set {
            students[row][col] = newValue
        }
    }
}



let myClass = Classroom()

// KLASYCZNY DOSTĘP DO ELEMENTU "Ronaldinho"
myClass.students[1][2]

// DOSTĘP DO ELEMENTU "Ronaldinho" POPRZEZ SUBSCRIPT
myClass[1, 2]
