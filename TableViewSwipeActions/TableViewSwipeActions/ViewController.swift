//
//  ViewController.swift
//  TableViewSwipeActions
//
//  Created by Wojciech Spaleniak on 13/11/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var names = ["David", "Emmanuel", "Uzoh", "Grace"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = names[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    
    // MARK: WAY 1:
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            names.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//    }
    
    
    
    // MARK: WAY 2:
    
    // TRAILING - DLA PRAWEJ STRONY
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // DELETE ACTION
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { _, _, completion in
            self.names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        
        // MESSAGE ACTION
        let messageAction = UIContextualAction(style: .destructive, title: nil) { _, _, completion in
            print("Sending message to: \(self.names[indexPath.row])")
        }
        messageAction.image = UIImage(systemName: "envelope")
        messageAction.backgroundColor = .systemYellow
        
        // CONFIGURATION
        // PIERWSZY ELEMENT W TABLICY ZNAJDUJE SIĘ BLIŻEJ PRAWEJ KRAWĘDZI EKRANU
        let config = UISwipeActionsConfiguration(actions: [deleteAction, messageAction])
        config.performsFirstActionWithFullSwipe = false     // PO USTAWIENIU NA false NIE MOŻEMY ZROBIĆ "DŁUGIEGO SWIPE" ŻEBY WYMUSIĆ WYKONANIE KODU - TRZEBA KLIKNĄĆ W WYBRANĄ AKCJĘ
        return config
    }
    
    // LEADING - DLA LEWEJ STRONY
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let personAction = UIContextualAction(style: .destructive, title: nil) { _, _, completion in
            print("Hello \(self.names[indexPath.row])")
            completion(true)
        }
        personAction.image = UIImage(systemName: "person")
        personAction.backgroundColor = .systemBlue
        
        let config = UISwipeActionsConfiguration(actions: [personAction])
        return config
    }
}
