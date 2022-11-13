//
//  Movie.swift
//  CollectionView
//
//  Created by Wojciech Spaleniak on 28/10/2022.
//

import UIKit

struct Movie {
    let title: String
    let image: UIImage
}

let movies: [Movie] = [
    Movie(title: "Hightown", image: UIImage(named: "hightown.jpg")!),
    Movie(title: "Penny Dreadful", image: UIImage(named: "pennydreadful.jpg")!),
    Movie(title: "The Bold Type", image: UIImage(named: "theboldtype.jpg")!),
    Movie(title: "Blindspot", image: UIImage(named: "blindspot.jpg")!),
    Movie(title: "In the Dark", image: UIImage(named: "inthedark.jpg")!),
    Movie(title: "Doom Patrol", image: UIImage(named: "doompatrol.jpg")!),
    Movie(title: "Agents of S.H.I.E.L.D", image: UIImage(named: "agentsofshield.jpg")!),
    Movie(title: "The 100", image: UIImage(named: "the100.jpg")!),
    Movie(title: "DC Legends of Tommorow", image: UIImage(named: "dclegends.jpg")!),
    Movie(title: "Siren", image: UIImage(named: "siren.jpg")!)
]
