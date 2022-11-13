//
//  ViewController.swift
//  SnaphotTesting
//
//  Created by Wojciech Spaleniak on 23/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLbl: UILabel!
    
    var isDarkMood = false {
        didSet {
            view.backgroundColor = isDarkMood ? .black: .white
            helloLbl.textColor = isDarkMood ? .white : .black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

