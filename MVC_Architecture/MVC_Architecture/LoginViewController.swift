//
//  LoginViewController.swift
//  MVC_Architecture
//
//  Created by Wojciech Spaleniak on 04/10/2022.
//

/*
 NOTES:
 - GOOD FOR SMALL PROJECTS
 
 - MVC - "MODEL VIEW CONTROLLER"
 - M - MODEL - THIS IS OUR DATA, CREATE USING STRUCT OR CLASS
 - V - VIEW - IT IS WHAT WE CAN SEE ON OUR DEVICE (BUTTONS, TEXTFIELDS, ETC.)
 - C - CONTROLLER - CONTROLLING THINGS THAT ARE HAPPENING WITHIN APP, BETWEEN THE VIEW AND MODEL
 
 - IN UIKIT VIEW AND CONTROLLER ARE COMBINED INTO A SINGLE FILE VIEWCONTROLLER
 
 STORYBOARD:
 - STORYBOARD IS VIEW
 - VIEWCONTROLLER IS CONTROLLER
 
 PROGRAMMATICALLY:
 - SEPARATED FILE FOR VIEW
 - SEPARATED FILE FOR CONTROLLER WITH LOGIC FOR VIEW
 
 */

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var invalidLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.addTarget(self, action: #selector(self.validateFields), for: UIControl.Event.editingChanged)
        passwordField.addTarget(self, action: #selector(self.validateFields), for: UIControl.Event.editingChanged)
    }
    
    @objc private func validateFields() {
        loginBtn.isEnabled = emailField.text != "" && passwordField.text != ""
        invalidLbl.text = ""
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        NetworkService.shared.login(email: emailField.text!, password: passwordField.text!) { succes in
            
            if succes {
                self.goToHomePage()
            } else {
                self.invalidLbl.text = "Invalid credentials"
            }
        }
    }
    
    private func goToHomePage() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        present(controller, animated: true, completion: nil)
    }
    
    // WHEN WE CLICK ON TEH BODY OF THE VIEW IT RESIGNS THE KEYBOARD
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
