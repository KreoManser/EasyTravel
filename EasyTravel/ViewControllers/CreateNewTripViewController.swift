//
//  CreateNewTripViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 06.07.2022.
//

import UIKit

class CreateNewTripViewController: UIViewController {
    
    @IBOutlet weak var currentDatePicker: UIDatePicker!
    @IBOutlet weak var lastDateDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDatePickers()
    }
    
    private func setupDatePickers() {
        let currentDate = Date()
        
        currentDatePicker.datePickerMode = UIDatePicker.Mode.date
        currentDatePicker.minimumDate = currentDate
        currentDatePicker.date = currentDate
        
        lastDateDatePicker.datePickerMode = UIDatePicker.Mode.date
        lastDateDatePicker.minimumDate = currentDate
        lastDateDatePicker.date = currentDate
    }

    @IBAction func currentDatePickerAction(_ sender: Any) {
        lastDateDatePicker.minimumDate = currentDatePicker.date
    }
    
}
