//
//  HomeViewModel.swift
//  MVVM_Architecture
//
//  Created by Wojciech Spaleniak on 05/10/2022.
//

import Foundation

final class HomeViewModel {
    
    lazy var welcomeMessage: ObservableObject<String?> = ObservableObject(nil)
    
    func getLoggedInUser() {
        print("HomeViewModel -> rozpoczynam getLoggedInUser()")
        let user = NetworkService.shared.getLoggedInUser()
        self.welcomeMessage.value = "Hello, \(user.firstName) \(user.lastName)"
        print("HomeViewModel -> wykonano getLoggedInUser()")
    }
}
