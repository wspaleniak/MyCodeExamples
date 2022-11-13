//
//  ViewController.swift
//  DispatchSemaphore
//
//  Created by Wojciech Spaleniak on 31/10/2022.
//

import UIKit

class ViewController: UIViewController {

    var movies: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        DISPATCH SEMAPHORE
        
        let semaphore = DispatchSemaphore(value: 1)             // value: 1
        let queue = DispatchQueue.global()
        
        queue.async {
            print("This is the first block before wait")
            semaphore.wait()                                    // value: 0
            print("This is the first block after wait")
            let movieName = self.downloadMovie("Avengers")
            self.movies.append(movieName)
            semaphore.signal()                                  // value: 1
        }
        
        queue.async {
            print("This is the second block before wait")
            semaphore.wait()                                    // value: 0
            print("This is the second block after wait")
            self.saveMovies()
            self.movies.remove(at: 0)
            semaphore.signal()                                  // value: 1
        }
        
        print("I ain't waiting for no computer")
        
        
//        DISPATCH GROUP
//        WE HAD A PROBLEM HERE, BECAUSE FUNCTION WANTED REMOVE ELEMENT AT INDEX 0 BEFORE OTHER FUNCTION ADDED ELEMENT TO THE ARRAY
        
//        let group = DispatchGroup()
//        let queue = DispatchQueue.global()
//
//        queue.async(group: group) {
//            let movieName = self.downloadMovie("Avengers")
//            self.movies.append(movieName)
//        }
//
//        queue.async(group: group) {
//            self.saveMovies()
//            self.movies.remove(at: 0)
//        }
//
//        group.notify(queue: .main) {
//            print("All downloads have been completed")
//        }
        
    }

    func downloadMovie(_ name: String) -> String {
        sleep(4)
        print("\(name) has been downloaded")
        return name
    }
    
    func saveMovies() {
        sleep(2)
        print("Movies have been saved")
    }
}

