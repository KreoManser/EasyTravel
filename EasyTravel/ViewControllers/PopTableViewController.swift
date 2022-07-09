//
//  PopTableViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 09.07.2022.
//

import UIKit

class PopTableViewController: UITableViewController {
    
    let tripsArray = [
                "Test 1",
                "Test 1",
                "Test 3"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isScrollEnabled = false
//        tableView.register(PopTableViewCell.self, forCellReuseIdentifier: "PopTableViewCell")
    }
    
    override func viewWillLayoutSubviews() {
        preferredContentSize = CGSize(width: 250, height: tableView.contentSize.height)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tripsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopTableViewCell", for: indexPath) as? PopTableViewCell else { return UITableViewCell() }
        
        let textData = tripsArray[indexPath.row]
        cell.nameLabelPop.text = textData
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "ViewPackage", bundle: nil)
        guard let checkPlanVC = storyboard.instantiateViewController(withIdentifier: "CheckPlanNavigationController") as? CheckPlanNavigationController else { return }
        
        switch indexPath.row {
        case 0:
            checkPlanVC.modalPresentationStyle = .fullScreen
            present(checkPlanVC, animated: true)
        case 1:
            checkPlanVC.modalPresentationStyle = .fullScreen
            present(checkPlanVC, animated: true)
        case 2:
            checkPlanVC.modalPresentationStyle = .fullScreen
            present(checkPlanVC, animated: true)
        default:
            break
        }
    }
}
