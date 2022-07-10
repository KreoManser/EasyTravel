//
//  ChangeSettingsViewController.swift
//  EasyTravel
//
//  Created by Вадим Валеев on 06.07.2022.
//

import UIKit


protocol ChangeUserInfo: AnyObject {
    func changeData(user: User)
}

// MARK: - ChangeSettingsViewController

class ChangeSettingsViewController: UIViewController {
    
    // MARK: -IBOutlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // MARK: - Properties
    
    var pickedGender: GenderType?
    weak var delegate: ChangeUserInfo?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    @IBAction func saveButtonDidTap(_ sender: Any) {
        if nameTextField.text == "" {
            checker(message: "Вы не ввели имя!")
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
            
            guard nameTextField.text?.count ?? 0 <= 12 else { return checker(message: "Слишком длинное имя") }
            UserSettings.userName = nameTextField.text
            UserSettings.userGender = pickedGender.rawValue
            
            let user = User(name: UserSettings.userName, gender: UserSettings.userGender)
            delegate?.changeData(user: user)
            dismiss(animated: true)
        }
    }
    
    // MARK: - Methods

    func checker(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}



