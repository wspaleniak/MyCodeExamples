import UIKit



// MARK: NetworkService

//struct NetworkService {
//    static func request(delay: Double, completion: @escaping () -> Void) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//            completion()
//        }
//    }
//}

struct NetworkService {
    static func request(delay: Double) async {
        try? await Task.sleep(nanoseconds: UInt64(delay) * 1_000_000_000)
    }
}



// MARK: Functions

//func addition(num: Int, completion: @escaping (Int) -> Void) {
//    NetworkService.request(delay: 1) {
//        completion(num + 3)
//    }
//}
//func subtract(num: Int, completion: @escaping (Int) -> Void) {
//    NetworkService.request(delay: 2) {
//        completion(num - 1)
//    }
//}
//func multiply(num: Int, completion: @escaping (Int) -> Void) {
//    NetworkService.request(delay: 3) {
//        completion(num * 10)
//    }
//}

func addition(num: Int) async -> Int {
    await NetworkService.request(delay: 1)
    return num + 3
}
func subtract(num: Int) async -> Int {
    await NetworkService.request(delay: 2)
    return num - 1
}
func multiply(num: Int) async -> Int {
    await NetworkService.request(delay: 3)
    return num * 10
}



// MARK: Encrypt function

//func encrypt(num: Int) {
//    subtract(num: num) { subtractedValue in
//        print("1. Subtracted: \(subtractedValue)")
//        multiply(num: subtractedValue) { multipliedValue in
//            print("2. Multiplied: \(multipliedValue)")
//            addition(num: multipliedValue) { cipher in
//                print("3. Cipher is: \(cipher)")
//            }
//        }
//    }
//}

func encrypt(num: Int) {
    Task {
        var cipher = await subtract(num: num)
        print("1. Subtracted: \(cipher)")
        
        cipher = await multiply(num: cipher)
        print("2. Multiplied: \(cipher)")
        
        cipher = await addition(num: cipher)
        print("3. Cipher is: \(cipher)")
    }
}



// MARK: Call Encrypt function

print("Start.")
encrypt(num: 10)
print("Done.")
