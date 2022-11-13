//
//  ViewController.swift
//  Concurrency
//
//  Created by Wojciech Spaleniak on 30/10/2022.
//
/*
 NOTE:
 
 QoS - Quality of Service - prioritize certain queues
 Options:
 .userInteractive - highest priority
 .userInitiated
 .utility
 .background - when we don't know how long the task takes
 
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // INICJALIZACJA GRUPY
        let group = DispatchGroup()
        
        // PIERWSZY BLOK KODU DO WYKONANIA W GRUPIE
        let queue1 = DispatchQueue(label: "first")
        queue1.async(group: group) {
            sleep(5)
            print("This is the first queue")
        }
        
        // DRUGI BLOK KODU DO WYKONANIA W GRUPIE
        let queue2 = DispatchQueue(label: "second")
        queue2.async(group: group) {
            sleep(3)
            print("This is the second queue")
        }
        
        // AKCJE, KTÓRE ZOSTANĄ WYKONANE PO WYKONANIU SIĘ BLOKÓW KODU Z GRUPY
        group.notify(queue: DispatchQueue.main) {
            print("All have been executed")
            self.view.backgroundColor = .systemGray5
        }
        
        // QOS USTAWIONE NA .BACKGROUND
        let backgroundQueue = DispatchQueue(label: "backgroundqueue", qos: .background)
        backgroundQueue.async {
            sleep(10)
            print("This is the background")
        }
    }

    @IBAction func greenPressed(_ sender: UIButton) {
        let queue = DispatchQueue(label: "downloadimage")
        queue.async {
            sleep(5)
            DispatchQueue.main.async {
                self.view.backgroundColor = .green
            }
        }
    }
    
    @IBAction func redPressed(_ sender: UIButton) {
        view.backgroundColor = .red
    }
}
