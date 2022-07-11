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
    func saveBudget(budget: Double)
}



// MARK: - ChangeBudgetViewController

class ChangeBudgetViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var budgetTextField: UITextField!

    // MARK: - Properties
    
    var change: String! = "0"
    
    weak var delegate: changeBudgetDelegate?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        budgetTextField.text = UserDefaults.standard.string(forKey: "budgetForCreateTripFirstEl")
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
        guard let stringBudget = budgetTextField.text, !stringBudget.isEmpty else { return }
        if let currentBudget = Int(stringBudget) {
            if currentBudget > 0 {
            delegate?.saveBudget(budget: Double(currentBudget))
            dismiss(animated: true)
            } else {
                showAlert()
            }
        } else {
            showAlert()
        }
    }
}
