//
//  GreetingsViewController.swift
//  EasyTravel
//
//  Created by Рустам Шайхинуров on 07.07.2022.
//

import UIKit

class GreetingsViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var selectMaleButton: UIButton!
    @IBOutlet weak var selectFemaleButton: UIButton!
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        establishUserDefaultsHaveBeenVerifed()
//        isAppAlreadyLaunchedOnce()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonShadow()
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
    
    // Check app launch
//    private func isAppAlreadyLaunchedOnce() {
//        let storyboardMain = UIStoryboard(name: "Main", bundle: nil)
//
//        guard let mainVC = storyboardMain.instantiateViewController(withIdentifier: "MainMenuViewController") as? MainMenuViewController else { return }
//
//        let defaults = UserDefaults.standard
//        if let _ = defaults.string(forKey: "isAppAlreadyLaunchedOnce") {
//            navigationController?.pushViewController(mainVC, animated: true)
//        } else {
//            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
//            print("App launched first time")
//        }
//    }
    
    private func setButtonShadow() {
        
        selectMaleButton.layer.shadowColor = UIColor.black.cgColor
        selectMaleButton.layer.shadowOpacity = 0.6
        selectMaleButton.layer.shadowRadius = 10
        selectMaleButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        selectFemaleButton.layer.shadowColor = UIColor.black.cgColor
        selectFemaleButton.layer.shadowOpacity = 0.6
        selectFemaleButton.layer.shadowRadius = 10
        selectFemaleButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
    }
    
    // MARK: - IBActions
    
    @IBAction func selectMaleButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let mainVC = storyboard.instantiateViewController(withIdentifier: "MainMenuViewController") as? MainMenuViewController else { return }
        
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
    @IBAction func selectFemaleButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let mainVC = storyboard.instantiateViewController(withIdentifier: "MainMenuViewController") as? MainMenuViewController else { return }
        
        navigationController?.pushViewController(mainVC, animated: true)
    }

}
