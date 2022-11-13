//
//  ViewController.swift
//  URLSession_DataTask
//
//  Created by Wojciech Spaleniak on 15/10/2022.
//

/*
 NOTE:
 
 Communication with server:
 - CRUD - Create Read Update Delete
 
 - Create - POST
 - Read - GET
 - Update - PUT (replace data) / PATCH (update,modify particular field of data)
 - Delete - DELETE
 
 DATA TASK
 - allows us to be able to send and receive data as a data object and it is stored in memory
 - we use whenever we are making quick requests (not heavy/large) - example: login or registration, fetch a list of users or books, delete article
 
 URLSessionConfiguration
 .default - similar to URLSession.shared object, but we can change configuration
 .ephemeral - caches, cookies or credentials are not stored on your disk
 .background(withIdentifer:) - make requests upload and download data while an app is in background
 
 URLSession.shared - there we have singleton design pattern
 
 WARNING:
 When we want to update our UI, we should do it in Main Thread -> DispatchQueue.main.async {...}
 
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        postData()
    }
    
    
    
    // Read
    // GET
    func getData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let session = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let _ = error {
                print("We have a problem")
            } else {
                guard let data = data else { return }
                let jsonResponse = try? JSONSerialization.jsonObject(with: data)
                print("Response: \(jsonResponse ?? "Error")")
            }
        }
        session.resume()
    }
    
    
    
    // Create
    // POST
    func postData() {
        let params = [
            "title" : "Panicz is the best",
            "body"  : "This is the body of the post. Nice right?"
        ]
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params)
        
        let session = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            if let _ = error {
                print("We have a problem")
            } else {
                guard let data = data else { return }
                let jsonResponse = try? JSONSerialization.jsonObject(with: data)
                print("Response: \(jsonResponse ?? "Error")")
            }
        }
        session.resume()
    }
}
