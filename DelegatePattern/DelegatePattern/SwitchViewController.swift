//
//  SwitchViewController.swift
//  DelegatePattern
//
//  Created by Wojciech Spaleniak on 27/10/2022.
//

import UIKit

protocol BulbDelegate {
    func toggleBulb(_ state: Bool)
}

class SwitchViewController: UIViewController {

    @IBOutlet weak var switchView: UISwitch!
    var switchIsOn: Bool!
    var delegate: BulbDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switchView.setOn(switchIsOn, animated: true)
    }

    @IBAction func switchToggled(_ sender: UISwitch) {
        
        delegate.toggleBulb(sender.isOn)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.dismiss(animated: true)
        }
    }
}
