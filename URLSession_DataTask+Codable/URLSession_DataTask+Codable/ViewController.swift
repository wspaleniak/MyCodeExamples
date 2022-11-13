//
//  ViewController.swift
//  URLSession_DataTask+Codable
//
//  Created by Wojciech Spaleniak on 16/10/2022.
//

import UIKit

class ViewController: UIViewController {

    let urlString = "https://jsonplaceholder.typicode.com/posts"
    let newPost = Post(id: 101, title: "New Title", body: "New Body")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        postData()
    }

    // DECODE
    func getData() {
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let _ = error {
                print("We have a problem")
            } else {
                guard let data = data else { return }
                guard let posts = try? JSONDecoder().decode([Post].self, from: data) else { return }
                
                for item in posts {
                    print("Title: \(item.title)")
                    print("Body: \(item.body)")
                    print("Id: \(item.id)\n")
                }
            }
        }
        session.resume()
    }
    
    // DECODE, ENCODE
    func postData() {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(newPost)
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let _ = error {
                print("We have a problem")
            } else {
                guard let data = data else { return }
                guard let post = try? JSONDecoder().decode(Post.self, from: data) else { return }
                
                print("Title: \(post.title)")
                print("Body: \(post.body)")
                print("Id: \(post.id)")
            }
        }
        session.resume()
    }
}
