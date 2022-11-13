//
//  ViewController.swift
//  TableView
//
//  Created by Wojciech Spaleniak on 27/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let sections = ["Animals", "Fruits", "Cars", "Countries"]
    let rows: [[String]] = [
        ["Lion", "Tiger", "Dog", "Wolf"],
        ["Apple", "Orange"],
        ["Audi", "Ferrari", "Ford"],
        ["USA", "Poland", "Germany", "Spain", "RPA", "Japan", "Brazil"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self     // CONFORM TO UITABLEVIEWDATASOURCE
        tableView.delegate = self       // CONFORM TO UITABLEVIEWDELEGATE
    }
}

extension ViewController: UITableViewDataSource {
    
    // ILOŚĆ SEKCJI (SECTION)
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    // NAZWY SEKCJI (SECTION)
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    // ILOŚĆ WIERSZY W SEKCJI (ROW IN SECTION)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows[section].count
    }
    
    // WYPEŁNIENIE KAŻDEGO WIERSZA (ROW)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.cellImageView.image = UIImage(named: "tiger.jpg")
        cell.cellLbl.text = rows[indexPath.section][indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    // CO SIĘ DZIEJE PO KLIKNIĘCIU W WIERSZ/KOMÓRKĘ (ROW/CELL)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected: \(rows[indexPath.section][indexPath.row])")
    }
}

// KLASA DLA CUSTOMOWEJ KOMÓRKI (CELL)
class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLbl: UILabel!
}
