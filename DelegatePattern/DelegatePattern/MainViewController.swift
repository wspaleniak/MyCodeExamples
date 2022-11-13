//
//  MainViewController.swift
//  DelegatePattern
//
//  Created by Wojciech Spaleniak on 27/10/2022.
//

/*
 NOTE:
 
 - Observer Pattern - one to many communication
 - Delegate Pattern - one to one communication
 
 */

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var bulbImageView: UIImageView!
    var lightOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.goToSwitchView))
        bulbImageView.addGestureRecognizer(tap)
        bulbImageView.isUserInteractionEnabled = true
    }
    
    @objc func goToSwitchView() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "SwitchViewController") as! SwitchViewController
        controller.modalPresentationStyle = .fullScreen
        controller.switchIsOn = lightOn
        controller.delegate = self
        present(controller, animated: true)
    }
}

extension MainViewController: BulbDelegate {
    func toggleBulb(_ state: Bool) {
        lightOn = state
        if state {
            self.view.backgroundColor = .orange
            bulbImageView.image = UIImage(named: "bulbOn.jpg")
        } else {
            self.view.backgroundColor = .systemGray
            bulbImageView.image = UIImage(named: "bulbOff.jpg")
        }
    }
}
