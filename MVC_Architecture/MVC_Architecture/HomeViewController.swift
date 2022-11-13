//
//  HomeViewController.swift
//  MVC_Architecture
//
//  Created by Wojciech Spaleniak on 04/10/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var userLbl: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = NetworkService.shared.getLoggedInUser()
        welcomeUser()
    }
    
    private func welcomeUser() {
        userLbl.text = "Hello, \(user.firstName) \(user.lastName)"
    }
}
