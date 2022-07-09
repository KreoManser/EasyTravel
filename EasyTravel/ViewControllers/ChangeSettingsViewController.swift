//
//  ChangeSettingsViewController.swift
//  EasyTravel
//
//  Created by Вадим Валеев on 06.07.2022.
//

import UIKit

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
}

class ChangeSettingsViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var pickedGender: GenderType?
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
        
        
    }
}



