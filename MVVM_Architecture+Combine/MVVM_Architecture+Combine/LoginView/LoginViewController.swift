//
//  LoginViewController.swift
//  MVVM_Architecture+Combine
//
//  Created by Wojciech Spaleniak on 07/10/2022.
//

import UIKit
import Combine

class LoginViewController: UIViewController {

    
    // >> >> PROGRAMMATIC UI << << //
    
    lazy var homeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome back"
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.font = UIFont(name: "HelveticaNeue-Regular", size: 15)
        textField.textColor = .black
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray6.cgColor
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        return textField
    }()
    
    lazy var passwordField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.font = UIFont(name: "HelveticaNeue-Regular", size: 15)
        textField.textColor = .black
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray6.cgColor
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        return textField
    }()
    
    lazy var loginBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = true
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.systemGray, for: .highlighted)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    private func setupLoginView() {
        let elements = [homeLbl, emailField, passwordField, loginBtn]
        elements.forEach{ view.addSubview( $0 ) }
        
        NSLayoutConstraint.activate([
            homeLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            homeLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailField.topAnchor.constraint(equalTo: homeLbl.bottomAnchor, constant: 50),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.widthAnchor.constraint(equalToConstant: 280),
            emailField.heightAnchor.constraint(equalToConstant: 35),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 10),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: 280),
            passwordField.heightAnchor.constraint(equalToConstant: 35),
            
            loginBtn.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginBtn.widthAnchor.constraint(equalToConstant: 280),
            loginBtn.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        loginBtn.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    
    
    // >> >> COMBINE << << //
    
    private let viewModel = LoginViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginView()
        setupBinders()
    }
    
    private func setupBinders() {
        viewModel.$error.sink { [weak self] error in
            if let error = error {
                print(error)
            } else {
                self?.goToHomePage()
            }
        }.store(in: &cancellables)
    }
    
    private func goToHomePage() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        present(controller, animated: true, completion: nil)
    }
    
    @objc private func tapButton() {
        guard let email = emailField.text, let password = passwordField.text else {
            print("Please enter email and password")
            return
        }
        viewModel.login(email: email, password: password)
    }
}
