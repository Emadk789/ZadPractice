//
//  ProfileViewController.swift
//  ZadPractice
//
//  Created by Emad Albarnawi on 09/01/2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
    // MARK: Actions
    @IBAction func profileButtonClicked(_ sender: Any) {
        print("click")
    }
    
}

// MARK:- UITableViewDelegate, UITableViewDataSource
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.accessoryType = .disclosureIndicator
        switch indexPath.row {
        case 0:
            cell?.imageView?.image = UIImage(systemName: "rosette")
            cell?.textLabel?.text = "Rewards!"
        case 1:
            cell?.imageView?.image = UIImage(systemName: "phone")
            cell?.textLabel?.text = "Help"
        case 2:
            cell?.imageView?.image = UIImage(systemName: "wrench.and.screwdriver")
            cell?.textLabel?.text = "Settings"
        case 3:
            cell?.accessoryType = .none
            cell?.imageView?.image = UIImage(systemName: "arrowshape.turn.up.left")
            cell?.textLabel?.text = "Logout"
        default:
            break
        }
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.setSelected(false, animated: true)
        switch indexPath.row {
        case 0:
            let vc = (storyboard?.instantiateViewController(identifier: "TableViewDetails") as! RewardsViewController)

            show(vc, sender: self)
        case 1:
            let vc = (storyboard?.instantiateViewController(identifier: "HelpViewControllerTableView") as! HelpViewController)

            show(vc, sender: self)
        case 2:
            let vc = (storyboard?.instantiateViewController(identifier: "SettingsViewControllerTableView") as! SettingsViewController)

            show(vc, sender: self)
        case 3:
            break
        default:
            break
        }
    }
    
    
}
