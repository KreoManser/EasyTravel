//
//  ViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 04.07.2022.
//

import UIKit

<<<<<<< Updated upstream
class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var TripImageView: UIImageView!
=======
class SettingsViewController: UIViewController {
    
    
>>>>>>> Stashed changes
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var changeSettingsButton: UIButton!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
<<<<<<< Updated upstream
    
    var settings: [settingModel] = []
    
    func appendSettings() {
        settings.append(settingModel(icon: UIImage(named: "iconfinder_notifications_outline_9035522")!, label: "Уведомления"))
        settings.append(settingModel(icon: UIImage(named: "iconfinder_users_group_people_309041")!, label: "Связь с разработчиками"))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
=======
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var themeLabel: UILabel!
    
    // MARK: - View life cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        saveData()
    }

    
    private func setUpUI() {
>>>>>>> Stashed changes
        changeSettingsButton.layer.shadowColor = UIColor.black.cgColor
        changeSettingsButton.layer.shadowOpacity = 0.6
        changeSettingsButton.layer.shadowRadius = 10
        changeSettingsButton.layer.shadowOffset = CGSize(width: 0, height: 0)
<<<<<<< Updated upstream
        
=======
>>>>>>> Stashed changes
        rateButton.layer.shadowColor = UIColor.black.cgColor
        rateButton.layer.shadowOpacity = 0.6
        rateButton.layer.shadowRadius = 10
        rateButton.layer.shadowOffset = CGSize(width: 0, height: 0)
<<<<<<< Updated upstream
        
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



=======
        themeSwitch.isOn = false
        themeSwitch.onTintColor = UIColor(named: "accentColor-1")
    }
    
    func saveData() {
        if UserSettings.userName == nil {
            UserSettings.userName = "Username"
        }
        if UserSettings.userGender == nil {
            UserSettings.userGender = "Пол: -"
        } else {
            genderLabel.text = "Пол: \(UserSettings.userGender!)"
        }
        usernameLabel.text = UserSettings.userName
    }
    
    // MARK: - Actions
    
    @IBAction func notificationButtonDidTap(_ sender: Any) {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
        UIApplication.shared.open(settingsUrl)
    }
    
    @IBAction func contactDevelopers(_ sender: Any) {
        if let url = URL(string: "https://github.com/KreoManser/EasyTravel") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
    @IBAction func changeSettingsButtonDidTap(_ sender: Any) {
        guard let changeSettingsVC = storyboard?.instantiateViewController(withIdentifier: "ChangeSettingsViewController") as? ChangeSettingsViewController else { return }
        changeSettingsVC.delegate = self
        present(changeSettingsVC, animated: true)
    }
    
    @IBAction func aboutButtonDidTap(_ sender: Any) {
        guard let aboutVC = storyboard?.instantiateViewController(withIdentifier: "AboutViewController") as? AboutViewController else { return }
        present(aboutVC, animated: true)
    }
}

// MARK: - ChangeUserInfo
extension SettingsViewController: ChangeUserInfo {
    func changeData(user: User) {
        usernameLabel.text = user.name
        genderLabel.text = "Пол: \(user.gender)"
    }
}
>>>>>>> Stashed changes
