//
//  HelpViewController.swift
//  ZadPractice
//
//  Created by Emad Albarnawi on 09/01/2021.
//

import UIKit

class HelpViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

}

// MARK:- UITableViewDelegate, UITableViewDataSource
extension HelpViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        cell.accessoryType = .disclosureIndicator
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "FAQs"
        case 1:
            cell.textLabel?.text = "My Tichets"
        case 2:
            cell.textLabel?.text = "Email us"
        default:
            break
        }
        
        return cell
    }
    
    
}

