//
//  HomeViewModel.swift
//  MVVM_Architecture+Combine
//
//  Created by Wojciech Spaleniak on 07/10/2022.
//

import Foundation

final class HomeViewModel {
    
    @Published var welcomeMessage: String?
    
    func getLoggedInUser() {
        if let user = NetworkService.shared.getLoggedInUser() {
            welcomeMessage = "Hello, \(user.firstName) \(user.lastName)"
        }
    }
}
