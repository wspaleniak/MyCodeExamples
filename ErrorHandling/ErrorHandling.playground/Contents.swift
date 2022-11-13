/*
 NOTE:
 
 try?
 -> let text = try? ...
 -> JEŚLI WYSTĄPI BŁĄD, TO WARTOŚĆ text BĘDZIE RÓWNA nil
 
 
 try!
 -> let text = try! ...
 -> JEŚLI WYSTAPI BŁĄD, TO APLIKACJA SIĘ CRASHUJE
 -> UŻYWAMY TYLKO, GDY JESTEŚMY PEWNI NA 100%, ŻE NIE BĘDZIE BŁĘDU
 
 
 do-catch
 -> let text = try ...
 -> JEŚLI WYSTĄPI BŁĄD, TO ZOSTANIE PRZECHWYCONY PRZEZ BLOCK catch
 -> UŻYWAMY, GDY CHCEMY ZNAĆ BŁĘDY WYSTĘPUJĄCE W APLIKACJI
 -> WARTOŚC Z FUNKCJI ZWRACAMY W BLOKU 'do'
 -> ŁAPANIE BŁĘDÓW Z FUNKCJI ZWRACAJĄCEJ -> String
        catch { return "Error" } -  ZWRACA CUSTOMOWY TEKST
        catch { return error.localizedDescription } - ZWRACA OPIS BŁĘDU
        catch let error { return "Error: \(error)" }
 
 
 throws
 -> func newName(_ param: String) throws -> String {...}
 -> let text = try? newName("hello")
 -> FUNKCJA RÓWNIEŻ MOŻE RZUCAĆ BŁĄD, KTÓRY PRZY JEJ WYWOŁANIU TRZEBA OBSŁUŻYĆ
 
 */



import UIKit

// PRZECHWYTYWANIE BŁĘDÓW WEWNĄTRZ FUNKCJI
func readTxtFile(_ name: String) -> String {
    guard let fileUrl = Bundle.main.url(forResource: name, withExtension: "txt") else {
        return "Guard: File does not exist."
    }
    
//    TRY?
    let text = try? String(contentsOf: fileUrl)
    return text ?? "Error"
    
    
//    TRY!
//    let text = try! String(contentsOf: fileUrl)
//    return text
    
    
//    DO-CATCH
//    do {
//        let text = try String(contentsOf: fileUrl)
//        return text
//    } catch {
//        return error.localizedDescription
//    }
}

print(readTxtFile("hello"))



// THROWS
// FUNCKCJA, KTÓRA RZUCA BŁĄD, KTÓRY MUSI ZOSTAĆ OBSŁUŻONY PRZY JEJ WYWOŁANIU
func readNextFile(_ name: String) throws -> String {
    guard var fileUrl = Bundle.main.url(forResource: name, withExtension: "txt") else {
        return "Guard: File does not exist."
    }
    let text = try String(contentsOf: fileUrl)
    return text
}

let text = try? readNextFile("hello")
print(text ?? "Error")
