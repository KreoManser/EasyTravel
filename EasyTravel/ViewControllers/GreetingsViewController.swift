//
//  GreetingsViewController.swift
//  EasyTravel
//
//  Created by Рустам Шайхинуров on 07.07.2022.
//

import UIKit

// MARK: - GreetingsViewController

class GreetingsViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var selectMaleButton: UIButton!
    @IBOutlet weak var selectFemaleButton: UIButton!
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        establishUserDefaultsHaveBeenVerifed()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private methods
    
    // Check user defaults verified
    private func establishUserDefaultsHaveBeenVerifed() {
        let defaults = UserDefaults.standard
        let storyboardMain = UIStoryboard(name: "Main", bundle: nil)
        
        guard let mainVC = storyboardMain.instantiateViewController(withIdentifier: "MainMenuViewController") as? MainMenuViewController else { return }
        
        if let _ = defaults.string(forKey: "userDefaultsHaveBeenVerified"){
            print("user defaults were already verified")
            navigationController?.pushViewController(mainVC, animated: true)
        }else{
            defaults.set(true, forKey: "userDefaultsHaveBeenVerified")
            print("verified user defaults for first time since app was installed")
        }
    }
    
    private func setupUI() {
        selectMaleButton.showShadow()
        selectFemaleButton.showShadow()
    }
    
    // MARK: - IBActions
    
    @IBAction func selectMaleButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let mainVC = storyboard.instantiateViewController(withIdentifier: "MainMenuViewController") as? MainMenuViewController else { return }
        
        UserSettings.userGender = "Мужской"
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
    @IBAction func selectFemaleButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let mainVC = storyboard.instantiateViewController(withIdentifier: "MainMenuViewController") as? MainMenuViewController else { return }
        
        UserSettings.userGender = "Женский"
        navigationController?.pushViewController(mainVC, animated: true)
    }

}
