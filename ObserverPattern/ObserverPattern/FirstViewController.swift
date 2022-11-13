//
//  FirstViewController.swift
//  ObserverPattern
//
//  Created by Wojciech Spaleniak on 26/10/2022.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //?
    }
    
    deinit {
        clearObserver()
    }
    

    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            self.view.backgroundColor = .systemTeal
            self.titleLbl.text = "Listening"
            setupObserver()
        } else {
            self.view.backgroundColor = .systemGray4
            self.titleLbl.text = "Not Listening"
            clearObserver()
        }
    }
    
    func setupObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleNotification(_:)), name: .myNotification, object: nil)
    }
    
    @objc func handleNotification(_ sender: Notification) {
        titleLbl.text = sender.userInfo?["name"] as? String
    }
    
    func clearObserver() {
        NotificationCenter.default.removeObserver(self)
    }
}
