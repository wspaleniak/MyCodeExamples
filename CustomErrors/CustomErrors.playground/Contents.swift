/*
 NOTE:
 
 throws - W DEFINICJI FUNKCJI - FUNKCJA RZUCA BŁĄD - FUNKCJA POSIADA W SWOIM CIELE COŚ CO WYMAGA PRZECHWYCENIA BŁEDU, ALE W TYM MIEJSCU JESZCZE TEGO NIE CHCEMY PRZECHWYTYWAĆ, DLATEGO OZNACZAMY FUNKCJĘ JAKO RZUCAJĄCĄ BŁĄD
 throw - W CIELE FUNKCJI - KONKRETNA RZECZ, KTÓRA RZUCA BŁĄD - GDY CHCEMY, ABY W DANEJ SYTUACJI FUNKCJA RZUCAŁA BŁĄD, TO TWORZYMY TĄ SYTUACJĘ W JEJ CIELE, A NASTĘPNIE KAŻEMY JEJ RZUCIĆ OKREŚLONY BŁĄD, GDY POJAWI SIĘ TAKA SYTUACJA
 
 */

import UIKit


// CUSTOM ERROR
enum AppError: LocalizedError {
    case invalidEmail(String)
    case invalidPhone
    case invalidName
    
    var errorDescription: String? {
        switch self {
        case .invalidEmail(let email):
            return "Email \(email) is invalid."
        case .invalidPhone:
            return "Please enter a valid phone number."
        case .invalidName:
            return "Please enter at least two names."
        }
    }
}


// FUNKCJE RZUCAJĄCE BŁĄD
func isValidEmail(_ email: String) throws {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    
    if !emailPred.evaluate(with: email) {
        throw AppError.invalidEmail(email)
    }
}

func isValidPhone(_ phone: String) throws {
    if !(phone.count == 9) {
        throw AppError.invalidPhone
    }
}

func isValidName(_ name: String) throws {
    let words = name.components(separatedBy: .whitespaces)
    if words.count < 2 {
        throw AppError.invalidName
    }
}


// FUNKCJA WYWOŁUJĄCA FUNKCJE RZUCAJĄCE BŁĄD I PRZECHWYTUJĄCA ICH BŁĘDY
func isValidForm(email: String, phone: String, name: String) {
    do {
        try isValidEmail(email)
        try isValidPhone(phone)
        try isValidName(name)
        print("Everything is correct")
    } catch AppError.invalidName {
        print("Come on!!!! Don't you know your name????")
    } catch {
        print(error.localizedDescription)
    }
}


// WYWOŁANIE
isValidForm(email: "test@test.com", phone: "733378838", name: "Wojciech Spaleniak")
