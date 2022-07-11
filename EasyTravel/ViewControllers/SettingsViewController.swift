//
//  ViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 04.07.2022.
//

import UIKit

// MARK: - SettingsViewController

class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet var image4: UIImageView!
    @IBOutlet var image5: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var changeSettingsButton: UIButton!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var themeLabel: UILabel!
    
    let starIsNotHidden = "iconfinder_checked_favorite_star_favourite_rating_1564507 (1)"
    let starIsHidden = "iconfinder_checked_favorite_star_favourite_rating_1564507-1"
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        saveData()
        setupTheme()
        checkStar()
        reloudStar()
        
        print(UserDefaults.standard.integer(forKey: "star"))
    
        
       
    }

    // MARK: - Private Methods
    
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
    private func reloudStar(){
        switch UserDefaults.standard.integer(forKey: "star"){
        case 1:
           fillingInTheFirstStar()
        case 2:
            fillingInTheSecondStar()
        case 3:
            fillingInTheThirdStar()
        case 4:
            fillingInTheFourStar()
        case 5:
            fillingInTheFiveStar()
            
        default:
            print("хуй")
        }
    }
    private func checkStar() {
        image1.isUserInteractionEnabled = true
           image1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped1)))
        image2.isUserInteractionEnabled = true
           image2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped2)))
        image3.isUserInteractionEnabled = true
           image3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped3)))
        image4.isUserInteractionEnabled = true
           image4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped4)))
        image5.isUserInteractionEnabled = true
           image5.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped5)))
    }
    
    private func setupTheme() {
        switch traitCollection.userInterfaceStyle {
               case .dark: break
               case .light, .unspecified: break
               @unknown default:
                   fatalError()
        }
    }
    
    // MARK: - Methods
    
    @objc private func imageTapped1(_ recognizer: UITapGestureRecognizer) {
        fillingInTheFirstStar()
        UserDefaults.standard.set(1, forKey: "star")
    }
    @objc private func imageTapped2(_ recognizer: UITapGestureRecognizer) {
        fillingInTheSecondStar()
        UserDefaults.standard.set(2, forKey: "star")
    }
    @objc private func imageTapped3(_ recognizer: UITapGestureRecognizer) {
        fillingInTheThirdStar()
        UserDefaults.standard.set(3, forKey: "star")
    }
    @objc private func imageTapped4(_ recognizer: UITapGestureRecognizer) {
        fillingInTheFourStar()
        UserDefaults.standard.set(4, forKey: "star")
    }
    @objc private func imageTapped5(_ recognizer: UITapGestureRecognizer) {
       fillingInTheFiveStar()
        UserDefaults.standard.set(5, forKey: "star")
    }
    
    
    func saveData() {
        if UserSettings.userName == nil {
            UserSettings.userName = "Username"
        }
        genderLabel.text = "Пол: \(UserSettings.userGender!)"
        usernameLabel.text = UserSettings.userName
    }
    
    func fillingInTheFirstStar(){
        image5.image = UIImage(named: starIsNotHidden)
        image2.image = UIImage(named: starIsNotHidden)
        image3.image = UIImage(named: starIsNotHidden)
        image4.image = UIImage(named: starIsNotHidden)
        image1.image = UIImage(named: starIsHidden)
    }
    func fillingInTheSecondStar(){
        image5.image = UIImage(named: starIsNotHidden)
        image2.image = UIImage(named: starIsHidden)
        image3.image = UIImage(named: starIsNotHidden)
        image4.image = UIImage(named: starIsNotHidden)
        image1.image = UIImage(named: starIsHidden)
    }
    func fillingInTheThirdStar(){
        image5.image = UIImage(named: starIsNotHidden)
        image2.image = UIImage(named: starIsHidden)
        image3.image = UIImage(named: starIsHidden)
        image4.image = UIImage(named: starIsNotHidden)
        image1.image = UIImage(named: starIsHidden)
    }
    func fillingInTheFourStar(){
        image5.image = UIImage(named: starIsNotHidden)
        image2.image = UIImage(named: starIsHidden)
        image3.image = UIImage(named: starIsHidden)
        image4.image = UIImage(named: starIsHidden)
        image1.image = UIImage(named: starIsHidden)
    }
    func fillingInTheFiveStar(){
        image5.image = UIImage(named: starIsHidden)
        image2.image = UIImage(named: starIsHidden)
        image3.image = UIImage(named: starIsHidden)
        image4.image = UIImage(named: starIsHidden)
        image1.image = UIImage(named: starIsHidden)
    }
    
    
    // MARK: - IBActions
    
    @IBAction func dismiss() {
        dismiss(animated: true)
    }
    
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

// MARK: - SettingsViewController extension by ChangeUserInfo
extension SettingsViewController: ChangeUserInfo {
    func changeData(user: User) {
        usernameLabel.text = user.name
        genderLabel.text = "Пол: \(user.gender)"
    }
}

// MARK: - SettingsNavigationController empty class

class SettingsNavigationController: UINavigationController {
    
}
