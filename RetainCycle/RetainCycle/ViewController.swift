//
//  ViewController.swift
//  RetainCycle
//
//  Created by Wojciech Spaleniak on 30/10/2022.
//

/*
 NOTE:
 
 weak - CAN BE OPTIONAL - USING weak IS SAFER
 unowned - CAN'T BE OPTIONAL
 
 IN CLOSURE:
 { [weak self] (_) in ... }
 { [unowned self] (_) in ... }
 
 */

import UIKit

class ViewController: UIViewController {

    var peter: User?
    var anna: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peter = User(firstName: "Peter", lastName: "Griffin")
        anna = User(firstName: "Anna", lastName: "Griffin")
        
        peter?.spouse = anna
        anna?.spouse = peter
        
        peter = nil
        anna = nil
    }
}

class User {
    let firstName: String
    let lastName: String
    weak var spouse: User?      // UŻYCIE SŁOWA KLUCZOWEGO 'WEAK'
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        print("\(firstName) has been created in memory.")
    }
    
    deinit {
        print("\(firstName) has been removed from memory.")
    }
}
