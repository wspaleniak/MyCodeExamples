//
//  User.swift
//  MVC_Architecture
//
//  Created by Wojciech Spaleniak on 04/10/2022.
//

// THIS IS MODEL

import Foundation

struct User {
    let firstName, lastName, email: String
    let age: Int
    let location: Location
}

struct Location {
    let lat: Double
    let lng: Double
}
