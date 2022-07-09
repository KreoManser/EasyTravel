//
//  ChangeSettingsViewController.swift
//  EasyTravel
//
//  Created by Вадим Валеев on 06.07.2022.
//

import UIKit

<<<<<<< Updated upstream
enum GenderType: String {
    case male = "Мужчина"
    case female = "Женщина"
}

class UserModel {
    let name: String
    let gender: GenderType
    
    init(name: String, gender: GenderType) {
        self.name = name
        self.gender = gender
    }
=======

protocol ChangeUserInfo: AnyObject {
    func changeData(user: User)
>>>>>>> Stashed changes
}

class ChangeSettingsViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var pickedGender: GenderType?
<<<<<<< Updated upstream
=======
    weak var delegate: ChangeUserInfo?
>>>>>>> Stashed changes
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
<<<<<<< Updated upstream
    @IBAction func saveButtonDidTap(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            pickedGender = .male
        case 1:
            pickedGender = .female
        default:
            break
        }
        
        let nameTrimmingText = nameTextField.text!.trimmingCharacters(in: .whitespaces)
        guard let pickedGender = pickedGender else { return }
        
        UserSettings.userName = nameTrimmingText
        UserSettings.userGender = pickedGender.rawValue
                
//        guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") else {return}
    
        

//        dismiss(animated: true)
        
        
=======
    override func viewWillAppear(_ animated: Bool) {
    }
    
    @IBAction func saveButtonDidTap(_ sender: Any) {
        if nameTextField.text == "" {
            checker()
        } else {
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                pickedGender = .male
            case 1:
                pickedGender = .female
            default:
                break
            }
            
            guard let pickedGender = pickedGender else { return }
            
            UserSettings.userName = nameTextField.text
            UserSettings.userGender = pickedGender.rawValue
            
            let user = User(name: UserSettings.userName, gender: UserSettings.userGender)
            delegate?.changeData(user: user)
            dismiss(animated: true)
        }
    }

    func checker() {
        let alert = UIAlertController(title: "Ошибка", message: "Вы не ввели имя!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
>>>>>>> Stashed changes
    }
}



