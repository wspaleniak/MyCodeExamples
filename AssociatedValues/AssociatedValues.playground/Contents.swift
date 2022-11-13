// ASSOCIATED VALUES

import UIKit

enum Greeting {
    case spanish(period: SpanishGreeting)
    case german(period: GermanGreeting)
    case hello
    
    var value: String {
        switch self {
        case .spanish(let period):
            return period.rawValue
        case .german(let period):
            return period.rawValue
        case .hello:
            return "Hello!"
        }
    }
}

enum SpanishGreeting: String {
    case morning = "Buenos Dias"
    case afternoon = "Buenas Tardes"
    case night = "Buenas Noches"
}

enum GermanGreeting: String {
    case morning = "Guten Morgen"
    case afternoon = "Guten Tag"
    case night = "Guten Nacht"
}



// HOW TO USE
Greeting.spanish(period: .afternoon).value
Greeting.german(period: .morning).value
Greeting.hello.value
