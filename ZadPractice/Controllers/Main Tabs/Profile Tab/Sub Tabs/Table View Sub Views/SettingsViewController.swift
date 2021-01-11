//
//  SettingsViewController.swift
//  ZadPractice
//
//  Created by Emad Albarnawi on 09/01/2021.
//

import UIKit

class SettingsViewController: UIViewController {

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
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        cell.accessoryType = .disclosureIndicator
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "App Country & Language"
        case 1:
            cell.textLabel?.text = "Credit cards"
        case 2:
            cell.textLabel?.text = "Privacy Policy"
        case 3:
            cell.textLabel?.text = "user agreement"
        case 4:
            cell.textLabel?.text = "VAT Registration Certificate"
        case 5:
            cell.textLabel?.text = "App Version"
        default:
            break
        }
        
        return cell
    }
    
    
}

