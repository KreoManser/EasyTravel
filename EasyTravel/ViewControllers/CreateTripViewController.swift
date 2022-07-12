//
//  CreateTripViewController.swift
//  EasyTravel
//
//  Created by Роман Гиниятов on 06.07.2022.
//

import UIKit

protocol CreatePlanDelegate: AnyObject{
    func savePlan(for plan: CheckPlan)
}

class CreateTripViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var cost: UITextField!
    @IBOutlet weak var value: UITextField!
    @IBOutlet var countOfItem: UITextField!
    @IBOutlet var addItemButton: UIButton!
    
    // MARK: - Properties
    
    weak var delegate: CreatePlanDelegate?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddItemButton()
    }
    
    // MARK: - Private methods
    
    private func setupAddItemButton() {
        addItemButton.layer.cornerRadius = 10
        addItemButton.clipsToBounds = true
        addItemButton.backgroundColor = UIColor(
            red: 104.0 / 255,
            green: 109.0 / 255,
            blue: 224.0 / 255,
            alpha: 1.0
        )
    }
    
    // MARK: - Methods
    
    func createAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    
    @IBAction func clickButton(_ sender: Any) {
        guard let name = name.text, !name.isEmpty else { return createAlert(message: "Введите наименование") }
        guard let cost = cost.text, !cost.isEmpty else { return createAlert(message: "Введите цену") }
        guard Double(cost) != nil, Double(cost)! >= 0 else { return createAlert(message: "Введите корректную цену") }
        guard let kolvo = countOfItem.text, !kolvo.isEmpty else { return createAlert(message: "Введите количество") }
        guard Double(kolvo) != nil, Double(kolvo)! >= 0 else { return createAlert(message: "Введите корректное количество") }
    
        let check = CheckPlan(object: name, cost: Double(cost)!, quantity: Int(kolvo)!)
        delegate?.savePlan(for: check)
            
        dismiss(animated: true)
    }
}

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
