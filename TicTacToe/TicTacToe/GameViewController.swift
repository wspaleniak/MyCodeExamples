//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Wojciech Spaleniak on 26/10/2022.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {

    @IBOutlet weak var playerNameLbl: UILabel!
    @IBOutlet weak var playerScoreLbl: UILabel!
    @IBOutlet weak var computerScoreLbl: UILabel!
    
    @IBOutlet weak var endGameViewCard: UIView!
    @IBOutlet weak var endGameLbl: UILabel!
    @IBOutlet weak var nextGameBtn: UIButton!
    
    @IBOutlet weak var box1: UIImageView!
    @IBOutlet weak var box2: UIImageView!
    @IBOutlet weak var box3: UIImageView!
    @IBOutlet weak var box4: UIImageView!
    @IBOutlet weak var box5: UIImageView!
    @IBOutlet weak var box6: UIImageView!
    @IBOutlet weak var box7: UIImageView!
    @IBOutlet weak var box8: UIImageView!
    @IBOutlet weak var box9: UIImageView!
    
    let soundEffect: SystemSoundID = 1105
    var playerName: String!
    var lastValue = "o"
    var playGame = true
    var playerChoices: [Box] = []
    var computerChoices: [Box] = []
    let correct: [[Box]] = [
        [.one, .two, .three],
        [.four, .five, .six],
        [.seven, .eight, .nine],
        [.one, .four, .seven],
        [.two, .five, .eight],
        [.three, .six, .nine],
        [.one, .five, .nine],
        [.three, .five, .seven]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerNameLbl.text = playerName + ":"
        createTap(on: box1, type: .one)
        createTap(on: box2, type: .two)
        createTap(on: box3, type: .three)
        createTap(on: box4, type: .four)
        createTap(on: box5, type: .five)
        createTap(on: box6, type: .six)
        createTap(on: box7, type: .seven)
        createTap(on: box8, type: .eight)
        createTap(on: box9, type: .nine)
        
        endGameViewCard.isHidden = true
        endGameLbl.isHidden = true
        nextGameBtn.isHidden = true
    }

    @IBAction func nextGameBtnClicked(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.endGameViewCard.isHidden = true
            self.endGameLbl.isHidden = true
            self.nextGameBtn.isHidden = true
        }
        playGame = true
    }
    
    func createTap(on imageView: UIImageView, type box: Box) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapHandle(_:)))
        tap.name = box.rawValue
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
    }
    
    @objc func tapHandle(_ sender: UITapGestureRecognizer) {
        let selectedBox = getBox(from: sender.name ?? "")
        makeChoice(selectedBox)
        playerChoices.append(Box(rawValue: sender.name!)!)
        checkIfWon()
        
        if playGame {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.computerPlay()
            }
        }
    }
    
    func computerPlay() {
        var availableSpaces: [UIImageView] = []
        var availableBoxes: [Box] = []
        for name in Box.allCases {
            let box = getBox(from: name.rawValue)
            if box.image == nil {
                availableSpaces.append(box)
                availableBoxes.append(name)
            }
        }
        
        guard availableBoxes.count > 0 else { return }
        
        let randIndex = Int.random(in: 0..<availableSpaces.count)
        makeChoice(availableSpaces[randIndex])
        computerChoices.append(availableBoxes[randIndex])
        checkIfWon()
    }
    
    func makeChoice(_ selectedBox: UIImageView) {
        guard selectedBox.image == nil else { return }
        if lastValue == "x" {
            selectedBox.image = UIImage(named: "circle.jpg")
            lastValue = "o"
            AudioServicesPlaySystemSound(soundEffect)
        } else {
            selectedBox.image = UIImage(named: "cross.jpg")
            lastValue = "x"
            AudioServicesPlaySystemSound(soundEffect)
        }
    }
    
    func checkIfWon() {
        for valid in correct {
            let playerMatch = playerChoices.filter { valid.contains($0) }.count
            let computerMatch = computerChoices.filter { valid.contains($0) }.count
            
            if playerMatch == valid.count {
                playGame = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.playerScoreLbl.text = String((Int(self.playerScoreLbl.text ?? "0") ?? 0) + 1)
                    self.endGameView(winner: "player")
                    self.resetGame()
                }
                return
            } else if computerMatch == valid.count {
                playGame = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.computerScoreLbl.text = String((Int(self.computerScoreLbl.text ?? "0") ?? 0) + 1)
                    self.endGameView(winner: "computer")
                    self.resetGame()
                }
                return
            }
        }
        if (playerChoices.count + computerChoices.count) == 9 {
            playGame = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.endGameView(winner: "draw")
                self.resetGame()
            }
            return
        }

    }
    
    func endGameView(winner: String) {
        endGameViewCard.isHidden = false
        endGameLbl.isHidden = false
        nextGameBtn.isHidden = false
        
        if winner == "player" {
            endGameLbl.text = playerName.uppercased() + "\nis winner!"
        } else if winner == "computer" {
            endGameLbl.text = "\(winner.uppercased())\nis winner!"
        } else {
            endGameLbl.text = "The Game ended in a draw..."
        }
    }
    
    func resetGame() {
        for name in Box.allCases {
            let box = getBox(from: name.rawValue)
            box.image = nil
        }
        lastValue = "o"
        playerChoices = []
        computerChoices = []
    }
    
    func getBox(from name: String) -> UIImageView {
        let box = Box(rawValue: name) ?? .one
        
        switch box {
        case .one:
            return box1
        case .two:
            return box2
        case .three:
            return box3
        case .four:
            return box4
        case .five:
            return box5
        case .six:
            return box6
        case .seven:
            return box7
        case .eight:
            return box8
        case .nine:
            return box9
        }
    }
    
    @IBAction func closeBtnClicked(_ sender: UIButton) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        controller.nameField?.text = ""
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true)
    }
}

enum Box: String, CaseIterable {
    case one, two, three, four, five, six, seven, eight, nine
}
