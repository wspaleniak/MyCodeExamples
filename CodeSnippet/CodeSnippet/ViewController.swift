//
//  ViewController.swift
//  CodeSnippet
//
//  Created by Wojciech Spaleniak on 13/11/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



// CUSTOM CODE SNIPPET
// FOR ADD: select code >> right-click >> "Create Code Snippet..."
// FOR EDIT shift+cmd+L
// FOR ADD PLACEHOLDERS IN CODE SNIPPET e.g. < # ViewController # > (WITHOUT WHITESPACES!!!)

// MARK: TableView DataSource and Delegate
extension <#ViewController#>: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return <#0#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: <#TableViewCell#>.identifier) as! <#TableViewCell#>
        
        return cell
    }
}



class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"
}
