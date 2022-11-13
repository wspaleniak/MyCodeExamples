//
//  NetwrokService.swift
//  MVVM_Architecture+Combine
//
//  Created by Wojciech Spaleniak on 07/10/2022.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    private init() { }
    
    var user: User?
    
    func login(email: String, password: String, completion: @escaping(Bool) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            
            if email.lowercased() == "test@test.com" && password == "1234" {
                self?.user = User(firstName: "Wojciech", lastName: "Spaleniak", email: email, age: 30)
                completion(true)
            } else {
                self?.user = nil
                completion(false)
            }
        }
    }
    
    func getLoggedInUser() -> User? {
        return user
    }
}
