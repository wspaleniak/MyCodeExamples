//
//  HomeViewController.swift
//  MVVM_Architecture+Combine
//
//  Created by Wojciech Spaleniak on 07/10/2022.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    // >> >> PROGRAMMATIC UI << << //
    
    lazy var homeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    private func setupHomeView() {
        view.addSubview(homeLbl)
        
        NSLayoutConstraint.activate([
            homeLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homeLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
    
    // >> >> COMBINE << << //
    
    private let viewModel = HomeViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHomeView()
        setupBinders()
        viewModel.getLoggedInUser()
    }
    
    private func setupBinders() {
        viewModel.$welcomeMessage.sink { [weak self] message in
            self?.homeLbl.text = message
        }.store(in: &cancellables)
    }

}
