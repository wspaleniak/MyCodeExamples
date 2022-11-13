//
//  LoginViewModel.swift
//  MVVM_Architecture
//
//  Created by Wojciech Spaleniak on 05/10/2022.
//

import Foundation

final class LoginViewModel {
    
    lazy var error: ObservableObject<String?> = ObservableObject("")
    
    func login(email: String, password: String) {
        NetworkService.shared.login(email: email, password: password) { [weak self] success in
            
            print("LoginViewModel -> rozpoczynam login() - przypisanie wartości do value")
            self?.error.value = success ? nil : "Invalid Credentials"
            print("LoginViewModel -> wykonano login() - przypisanie wartości do value")
            print("-----")
        }
    }
}
