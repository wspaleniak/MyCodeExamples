//
//  NetworkService.swift
//  MVC_Architecture
//
//  Created by Wojciech Spaleniak on 04/10/2022.
//

// WE USED HERE SINGLETON PATTERN

import Foundation

class NetworkService {
    static let shared = NetworkService()
    private init() { }
    
    private var user: User?
    
    func login(email: String, password: String, completion: @escaping(Bool) -> Void) {
        
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async {
                if email == "test@test.com" && password == "password" {
                    self.user = User(firstName: "Wojciech", lastName: "Spaleniak", email: "test@test.com", age: 30, location: Location(lat: 52.1448, lng: 16.5042))
                    completion(true)
                } else {
                    self.user = nil
                    completion(false)
                }
            }
        }
    }
    
    func getLoggedInUser() -> User {
        return user!
    }
}
