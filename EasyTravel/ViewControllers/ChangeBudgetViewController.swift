//
//  ChangeBudgetViewController.swift
//  EasyTravel
//
//  Created by Тимур Миргалиев on 08.07.2022.
//

import UIKit

protocol changeBudget: AnyObject {
    func change(budget: BudgetStruct)
}

protocol changeBudgetDelegate: AnyObject {
    func saveBudget(budget: Int)
}

class ChangeBudgetViewController: UIViewController {
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var budgetTextField: UITextField!
    
    weak var delegate: changeBudgetDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonDidTap(_ sender: Any) {
        saveInUserDefaults()
        let stringBudget = budgetTextField.text!
        if let age = Int(stringBudget) {
            delegate?.saveBudget(budget: Int(age))
            dismiss(animated: true)
        } else {
            showAlert()
        }
        
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Введите верное значение бюджета", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    private func saveInUserDefaults() {
        Budget.budgetValue = budgetTextField.text
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
