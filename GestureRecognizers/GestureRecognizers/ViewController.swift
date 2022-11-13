//
//  ViewController.swift
//  GestureRecognizers
//
//  Created by Wojciech Spaleniak on 25/10/2022.
//

import UIKit

class ViewController: UIViewController {

    var gallery = [
        UIImage(named: "Camel"),
        UIImage(named: "Elephant"),
        UIImage(named: "Fox"),
        UIImage(named: "Hippo"),
        UIImage(named: "Monkey"),
        UIImage(named: "Panda"),
        UIImage(named: "Tiger")
    ]
    
    @IBOutlet weak var trashImageView: UIImageView!
    
    var nextIndex = 0
    var currentPicture: UIImageView?
    let originalSize: CGFloat = 300
    var isActive = false
    var activeSize: CGFloat {
        return originalSize + 25
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showNextPicture()
    }
    
    func showNextPicture() {
        if let newPicture = createPicture() {
            currentPicture = newPicture
            showPicture(newPicture)
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
            newPicture.addGestureRecognizer(tap)
            
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
            swipe.direction = .up
            newPicture.addGestureRecognizer(swipe)
            
            let pan = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
            pan.delegate = self
            newPicture.addGestureRecognizer(pan)
            
        } else {
            nextIndex = 0
            showNextPicture()
        }
    }
    
    @objc func handleTap() {
        isActive.toggle()
        if isActive {
            activateCurrentPicture()
        } else {
            deactivateCurrentPicture()
        }
    }
    
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        guard !isActive else { return }
        hidePicture(currentPicture!)
        showNextPicture()
    }
    
    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        guard let view = currentPicture, isActive else { return }
        switch sender.state {
        case .began, .changed:
            processPictureMovement(sender: sender, view: view)
        case .ended:
            if view.frame.intersects(trashImageView.frame) {
                deletePicture(imageView: view)
            }
        default:
            break
        }
    }
    
    func processPictureMovement(sender: UIPanGestureRecognizer, view: UIImageView) {
        let translation = sender.translation(in: view)
        view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        sender.setTranslation(.zero, in: view)
        
        if view.frame.intersects(trashImageView.frame) {
            self.currentPicture?.layer.borderWidth = 5
            view.layer.borderColor = UIColor.systemPink.cgColor
        } else {
            self.currentPicture?.layer.borderWidth = 0
        }
    }
    
    func deletePicture(imageView: UIImageView) {
        self.gallery.remove(at: nextIndex - 1)
        isActive = false
        
        UIView.animate(withDuration: 0.4) {
            imageView.alpha = 0
        } completion: { (_) in
            imageView.removeFromSuperview()
        }
        
        if gallery.count == 0 {
            print("Array is finished")
        } else {
            showNextPicture()
        }
    }
    
    func activateCurrentPicture() {
        UIView.animate(withDuration: 0.3) {
            self.currentPicture?.frame = CGRect(x: self.view.center.x - (self.activeSize / 2), y: self.view.center.y - (self.activeSize / 2), width: self.activeSize, height: self.activeSize)
        }
    }
    
    func deactivateCurrentPicture() {
        UIView.animate(withDuration: 0.3) {
            self.currentPicture?.frame = CGRect(x: self.view.center.x - (self.originalSize / 2), y: self.view.center.y - (self.originalSize / 2), width: self.originalSize, height: self.originalSize)
            self.currentPicture?.layer.borderWidth = 0
        }
    }
    
    func createPicture() -> UIImageView? {
        guard nextIndex < gallery.count else { return nil }
        let imageView = UIImageView(image: gallery[nextIndex])
        
        imageView.frame = CGRect(x: self.view.frame.width, y: self.view.center.y - (originalSize / 2), width: originalSize, height: originalSize)
        imageView.isUserInteractionEnabled = true
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        self.currentPicture?.layer.borderWidth = 0
        
        nextIndex += 1
        return imageView
    }
    
    func showPicture(_ imageView: UIImageView) {
        self.view.addSubview(imageView)
        UIView.animate(withDuration: 0.4) {
            imageView.center = self.view.center
        }
    }
    
    func hidePicture(_ imageView: UIImageView) {
        UIView.animate(withDuration: 0.4) {
            self.currentPicture?.frame.origin.y = -self.originalSize
        } completion: { (_) in
            imageView.removeFromSuperview()
        }
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
