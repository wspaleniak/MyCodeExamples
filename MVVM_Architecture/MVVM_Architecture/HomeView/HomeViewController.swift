//
//  HomeViewController.swift
//  MVVM_Architecture
//
//  Created by Wojciech Spaleniak on 05/10/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLbl: UILabel!
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("HomeViewController -> załadowano widok")
        setupBinders()
        viewModel.getLoggedInUser()
    }
    
    private func setupBinders() {
        print("HomeViewController -> rozpoczynam setupBinders()")
        viewModel.welcomeMessage.bind { [weak self] message in
            print("HomeViewController -> start domknięcie bind()")
            self?.welcomeLbl.text = message
            print("HomeViewController -> koniec domknięcie bind()")
        }
        print("HomeViewController -> wykonano setupBinders()")
    }
}
