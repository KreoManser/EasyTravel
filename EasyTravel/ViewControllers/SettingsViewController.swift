//
//  ViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 04.07.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var changeSettingsButton: UIButton!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var themeLabel: UILabel!
    
    // MARK: - View life cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        saveData()
    }

    
    private func setUpUI() {
        changeSettingsButton.layer.shadowColor = UIColor.black.cgColor
        changeSettingsButton.layer.shadowOpacity = 0.6
        changeSettingsButton.layer.shadowRadius = 10
        changeSettingsButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        rateButton.layer.shadowColor = UIColor.black.cgColor
        rateButton.layer.shadowOpacity = 0.6
        rateButton.layer.shadowRadius = 10
        rateButton.layer.shadowOffset = CGSize(width: 0, height: 0)
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

