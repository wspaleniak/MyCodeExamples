//
//  Post.swift
//  URLSession_DataTask+Codable
//
//  Created by Wojciech Spaleniak on 16/10/2022.
//

import Foundation

struct Post: Codable {
    let id: Int
    let title, body: String
}
