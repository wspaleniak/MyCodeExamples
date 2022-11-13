//
//  NetworkService.swift
//  MVVM_Architecture
//
//  Created by Wojciech Spaleniak on 05/10/2022.
//

// WE WANT TO SIMULATE BACKEND HERE

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    private init() { }
    
    private var user: User?
    
    func login(email: String, password: String, completion: @escaping(Bool) -> Void) {
        
        print("NetworkService -> rozpoczynam login() - sprawdzenie email i password")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            
            if email == "test@test.com" && password == "password" {
                self?.user = User(firstName: "Wojciech", lastName: "Spaleniak", email: email, age: 30)
                print("NetworkService -> email i password się zgadzają")
                completion(true)
            } else {
                self?.user = nil
                print("NetworkService -> email i password się NIE zgadzają")
                completion(false)
            }
        }
        print("NetworkService -> wykonano login() - sprawdzenie email i password")
    }
    
    func getLoggedInUser() -> User {
        print("NetworkService -> rozpoczynam getLoggedInUser()")
        return user!
    }
}
