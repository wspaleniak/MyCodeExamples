//
//  SecondViewController.swift
//  ObserverPattern
//
//  Created by Wojciech Spaleniak on 26/10/2022.
//

import UIKit

var secondVCIsListening = false

class SecondViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var listeningSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if secondVCIsListening {
            listeningSwitch.setOn(true, animated: false)
            switchToggled(listeningSwitch)
        }
    }
    
    deinit {
        clearObserver()
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            self.view.backgroundColor = .systemYellow
            self.titleLbl.text = "Listening"
            secondVCIsListening = true
            setupObserver()
        } else {
            self.view.backgroundColor = .systemGray6
            self.titleLbl.text = "Not Listening"
            secondVCIsListening = false
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
