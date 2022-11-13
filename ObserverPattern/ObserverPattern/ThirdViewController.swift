//
//  ThirdViewController.swift
//  ObserverPattern
//
//  Created by Wojciech Spaleniak on 26/10/2022.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //?
    }
    
    @IBAction func saveBtnClicked(_ sender: UIButton) {
        NotificationCenter.default.post(name: .myNotification, object: nil, userInfo: ["name":nameField.text ?? ""])
    }
}

extension NSNotification.Name {
    static let myNotification = NSNotification.Name("panicz")
}
