//
//  HomeViewController.swift
//  TicTacToe
//
//  Created by Wojciech Spaleniak on 26/10/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var cardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @IBAction func startBtnClicked(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces) else { return }
        if name.isEmpty {
            print("Podaj swoje imię")
        } else {
            let controller = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            controller.playerName = name.uppercased()
            present(controller, animated: true)
        }
    }
    
    func setupUI() {
        startBtn.layer.cornerRadius = 5
        cardView.layer.cornerRadius = 15
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowRadius = 10
        cardView.layer.shadowOffset = .zero
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameField.resignFirstResponder()
    }

}
