//
//  LoginViewModel.swift
//  MVVM_Architecture+Combine
//
//  Created by Wojciech Spaleniak on 07/10/2022.
//

import Foundation

final class LoginViewModel {
    
    @Published var error: String?
    
    func login(email: String, password: String) {
        NetworkService.shared.login(email: email, password: password) { [weak self] success in
            self?.error = success ? nil : "Invalid Credentials"
        }
    }
}
