//
//  CreateNewTripViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 06.07.2022.
//

import UIKit

// MARK: - CreateNewTripViewController

class CreateNewTripViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameTripTF: UITextField!
    @IBOutlet weak var currentDatePicker: UIDatePicker!
    @IBOutlet weak var lastDateDatePicker: UIDatePicker!
    @IBOutlet weak var goToPlans: UIButton!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDatePickers()
    }
    
    // MARK: - Private methods
    
    private func setupDatePickers() {
        let currentDate = Date()
        
        currentDatePicker.datePickerMode = UIDatePicker.Mode.date
        currentDatePicker.minimumDate = currentDate
        currentDatePicker.date = currentDate
        
        lastDateDatePicker.datePickerMode = UIDatePicker.Mode.date
        lastDateDatePicker.minimumDate = currentDate
        lastDateDatePicker.date = currentDate
    }
    
    func checker() {
        let alert = UIAlertController(title: "Ошибка", message: "Вы не ввели название поездки!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - IBActions
    
    @IBAction func currentDatePickerAction(_ sender: Any) {
        lastDateDatePicker.minimumDate = currentDatePicker.date
    }
    
    
    @IBAction func dismissCreateNewTrip(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func goToPlansButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Plans", bundle: nil)
        guard let plansVC = storyboard.instantiateViewController(withIdentifier: "PackagePlanNavigationContoller") as? PackagePlanNavigationContoller else { return }
        plansVC.modalPresentationStyle = .fullScreen
        
        guard let text = nameTripTF.text, !text.isEmpty else { return checker() }
        present(plansVC, animated: true)
    }
}

// MARK: - CreateNewTripNavigationController - empty class for storyboard

class CreateNewTripNavigationController: UINavigationController {

}
