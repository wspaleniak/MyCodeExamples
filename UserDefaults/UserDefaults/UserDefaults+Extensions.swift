//
//  UserDefaults+Extensions.swift
//  UserDefaults
//
//  Created by Wojciech Spaleniak on 03/11/2022.
//

import Foundation

extension UserDefaults {
    
    private enum UserDefaultsKeys: String {
        case switchIsOn
        case signedInUser
    }
    
    var switchIsOn: Bool {
        get {
            // UserDefaults.standard.bool(forKey: UserDefaultsKeys.switchIsOn.rawValue)
            bool(forKey: UserDefaultsKeys.switchIsOn.rawValue)
        }
        set {
            // UserDefaults.standard.setValue(newValue, forKey: UserDefaultsKeys.switchIsOn.rawValue)
            setValue(newValue, forKey: UserDefaultsKeys.switchIsOn.rawValue)
        }
    }
    
    var signedInUser: User? {
        get {
            if let data = object(forKey: UserDefaultsKeys.signedInUser.rawValue) as? Data {
                let user = try? JSONDecoder().decode(User.self, from: data)
                return user
            }
            return nil
        }
        set {
            if newValue == nil {
                removeObject(forKey: UserDefaultsKeys.signedInUser.rawValue)
            } else {
                let data = try? JSONEncoder().encode(newValue)
                setValue(data, forKey: UserDefaultsKeys.signedInUser.rawValue)
            }
        }
    }
}
