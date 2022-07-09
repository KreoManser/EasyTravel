//
//  ChangeBudgetViewController.swift
//  EasyTravel
//
//  Created by Тимур Миргалиев on 08.07.2022.
//

import UIKit

// MARK: - Protocols

protocol changeBudget: AnyObject {
    func change(budget: BudgetStruct)
}

protocol changeBudgetDelegate: AnyObject {
    func saveBudget(budget: Int)
}

// MARK: - ChangeBudgetViewController

class ChangeBudgetViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var budgetTextField: UITextField!
    
    var change: String! = "0"
    
    // MARK: - Properties
    
//    weak var delegate: changeBudgetDelegate?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        budgetTextField.text = String(change)
    }
    
    // MARK: - Private Properties
    
    private func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Введите верное значение бюджета", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    private func saveInUserDefaults() {
        Budget.budgetValue = budgetTextField.text
    }

    // MARK: - IBActions
    
    @IBAction func buttonDidTap(_ sender: Any) {
        saveInUserDefaults()
        // ИСПРАВИТЬ
        let stringBudget = budgetTextField.text!
        if let age = Int(stringBudget) {
//            delegate?.saveBudget(budget: Int(age))
            dismiss(animated: true)
        } else {
            showAlert()
        }
    }
}
