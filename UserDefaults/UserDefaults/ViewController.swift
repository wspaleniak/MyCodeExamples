//
//  ViewController.swift
//  UserDefaults
//
//  Created by Wojciech Spaleniak on 03/11/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchView: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2.READ
        // WAY 1 - STANDARD:
        // let isOn = UserDefaults.standard.bool(forKey: "switchIsOn")
        // WAY 2 - WITH EXTENSION:
        let isOn = UserDefaults.standard.switchIsOn
        
        updateBackground(isOn: isOn)
        
        //
        let user = User(firstName: "Wojciech", lastName: "Spaleniak")
        UserDefaults.standard.signedInUser = user
        print("The signed in user is: \(String(describing: UserDefaults.standard.signedInUser))")
    }

    @IBAction func switchToggled(_ sender: UISwitch) {
        updateBackground(isOn: sender.isOn)
        
        // 1.SAVE
        // WAY 1 - STANDARD:
        // UserDefaults.standard.setValue(sender.isOn, forKey: "switchIsOn")
        // WAY 2 - WITH EXTENSION:
        UserDefaults.standard.switchIsOn = sender.isOn
    }
    
    private func updateBackground(isOn: Bool) {
        view.backgroundColor = isOn ? .systemBlue : .systemGray5
        switchView.isOn = isOn
    }
}
