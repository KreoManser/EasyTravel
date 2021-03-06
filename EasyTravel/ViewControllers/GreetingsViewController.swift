//
//  GreetingsViewController.swift
//  EasyTravel
//
//  Created by Рустам Шайхинуров on 07.07.2022.
//

import UIKit

class GreetingsViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var selectMaleButton: UIButton!
    @IBOutlet weak var selectFemaleButton: UIButton!
    
    // MARK: - View life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        checkFirstLaunchApp()
    }
    
    // MARK: - Private methods
    
    private func checkFirstLaunchApp() {
        let defaults = UserDefaults.standard
        let storyboardMain = UIStoryboard(name: "Main", bundle: nil)
        
        guard let mainVC = storyboardMain.instantiateViewController(withIdentifier: "MainMenuViewController") as? MainMenuViewController else { return }
        
        if let _ = defaults.string(forKey: "userDefaultsHaveBeenVerified"){
            if UserSettings.userGender != nil {
                navigationController?.pushViewController(mainVC, animated: true)
            }
        } else {
            defaults.set(true, forKey: "userDefaultsHaveBeenVerified")
        }
    }
    
    private func sendToNextView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let mainVC = storyboard.instantiateViewController(withIdentifier: "MainMenuViewController") as? MainMenuViewController else { return }
        
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction func selectMaleButtonDidTap(_ sender: Any) {
        UserSettings.userGender = "Мужской"
        sendToNextView()
    }
    
    @IBAction func selectFemaleButtonDidTap(_ sender: Any) {
        UserSettings.userGender = "Женский"
        sendToNextView()
    }
}
