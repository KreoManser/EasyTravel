//
//  ViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 04.07.2022.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var TripImageView: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var changeSettingsButton: UIButton!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    
    var settings: [settingModel] = []
    
    func appendSettings() {
        settings.append(settingModel(icon: UIImage(named: "iconfinder_notifications_outline_9035522")!, label: "Уведомления"))
        settings.append(settingModel(icon: UIImage(named: "iconfinder_users_group_people_309041")!, label: "Связь с разработчиками"))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeSettingsButton.layer.shadowColor = UIColor.black.cgColor
        changeSettingsButton.layer.shadowOpacity = 0.6
        changeSettingsButton.layer.shadowRadius = 10
        changeSettingsButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        rateButton.layer.shadowColor = UIColor.black.cgColor
        rateButton.layer.shadowOpacity = 0.6
        rateButton.layer.shadowRadius = 10
        rateButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        appendSettings()
        
        tableView.register(OneTableViewCell.self, forCellReuseIdentifier: "OneTableViewCell")
        
//        usernameLabel.text = UserSettings.userName
//        genderLabel.text = UserSettings.userGender
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        appendSettings()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath) as! OneTableViewCell
        
        let model = settings[indexPath.row]
        
        cell.configue(with: model)
        
        return cell
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        UserSettings.userGender = "-"
        usernameLabel.text = UserSettings.userName
        genderLabel.text = "Пол: " + UserSettings.userGender
    }

    @IBAction func changeSettingsButtonDidTap(_ sender: Any) {
        guard let changeSettings = storyboard?.instantiateViewController(withIdentifier: "ChangeSettingsViewController") else { return }
//        present(changeSettings, animated: true)
        navigationController?.pushViewController(changeSettings, animated: true)

    }
    
    @IBAction func aboutButtonDidTap(_ sender: Any) {
        guard let aboutVC = storyboard?.instantiateViewController(withIdentifier: "AboutViewController") else { return }
        present(aboutVC, animated: true)
    }
    
}



