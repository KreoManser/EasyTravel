//
//  CreateTripViewController.swift
//  EasyTravel
//
//  Created by Роман Гиниятов on 06.07.2022.
//

import UIKit

// MARK: - Protocols

protocol CreatePlanDelegate: AnyObject{
    func savePlan(for plan: CheckPlan)
}

// MARK: - CreateTripViewController

class CreateTripViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var cost: UITextField!
    @IBOutlet weak var valuee: UITextField!
    @IBOutlet var kolvo: UITextField!
    @IBOutlet var buttonClick: UIButton!
    
    // MARK: - Properties
    
    weak var delegate: CreatePlanDelegate?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonClick.layer.cornerRadius = 10
        buttonClick.clipsToBounds = true
        buttonClick.backgroundColor = UIColor(
            red: 104.0 / 255,
            green: 109.0 / 255,
            blue: 224.0 / 255,
            alpha: 1.0)
    }
    
    // MARK: - Methods
    
    func checker(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - IBActions
    
    @IBAction func clickButton(_ sender: Any) {
        guard let name = name.text, !name.isEmpty else { return checker(message: "Введите наименование") }
        guard let cost = cost.text, !cost.isEmpty else { return checker(message: "Введите цену") }
        guard let kolvo = kolvo.text, !kolvo.isEmpty else { return checker(message: "Введите количество") }
        
        let check = CheckPlan(object: name, cost: Double(cost)!, quantity: Int(kolvo)!)
            
        delegate?.savePlan(for: check)
            
        dismiss(animated: true)
    }
}

// MARK: - UIViewController extension

extension UIViewController {
    func createAlert(title: String?, description: String?) {
        let alertController = UIAlertController(
            title: title,
            message: description,
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
