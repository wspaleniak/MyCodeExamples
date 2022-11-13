//
//  LoginViewController.swift
//  MVVM_Architecture
//
//  Created by Wojciech Spaleniak on 04/10/2022.
//

/*
 NOTES:
 
 - MVVM - MODEL VIEW VIEWMODEL
 - M - MODEL - THIS IS DATA
 - V - VIEW - EVERYTHING WE CAN SEE ON DEVICE (BUTTONS, LABELS, ETC.)
 - VM - VIEWMODEL - THIS IS A MODEL FOR A SPECIFIC VIEW, EVERY VIEW HAS ITS OWN VIEWMODEL
 
 - THE VIEW IS GOING TO BE AWARE AUTOMATICALLY THAT THE VIEWMODELS OBJECT HAS BEEN CHANGED
 
 - THE VIEW IS AWARE OF THE VIEWMODEL
 - THE VIEWMODEL IS NOT AWARE OF THE VIEW
 - THE VIEWMODEL IS AWARE OF THE MODEL
 
 - IN THE VIEWMODEL ONLY OBJECTS OR ONLY ATTRIBUTES THAT THE VIEW NEEDS ARE AVAILABLE
 - THE MODEL CAN NOTIFY THE VIEWMODEL IF CHANGES ARE MADE IN THE MODEL
 
 */

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    private let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("LoginViewController -> załadowano widok")
        setupBinders()
    }
    
    private func setupBinders() {
        print("LoginViewController -> rozpoczynam setupBinders()")
        viewModel.error.bind { [weak self] error in
            
            print("LoginViewController -> start closure funkcji bind()")
            if let error = error {
                if error != "" {
                    print(error)
                    print("LoginViewController -> error w domknięciu bind()")
                }
            } else {
                self?.goToHomePage()
                print("LoginViewController -> Przejście na stronę Home")
            }
            print("LoginViewController -> koniec closure funkcji bind()")
        }
        print("LoginViewController -> wykonano setupBinders()")
        print("-----")
    }
    
    private func goToHomePage() {
        print("LoginViewController -> rozpoczynam goToHomePage()")
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        present(controller, animated: true, completion: nil)
        print("LoginViewController -> wykonano goToHomePage()")
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        
        print("LoginViewController -> klik przycisk Login")
        guard let email = emailField.text, let password = passwordField.text else {
            print("Please enter email and password")
            return
        }
        viewModel.login(email: email, password: password)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

