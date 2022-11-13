//
//  UIViewController+Extension.swift
//  SnaphotTestingTests
//
//  Created by Wojciech Spaleniak on 24/10/2022.
//

import UIKit

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
