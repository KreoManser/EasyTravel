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
    
    
    let currentDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentDatePicker.datePickerMode = UIDatePicker.Mode.date
        currentDatePicker.minimumDate = currentDate
        currentDatePicker.date = currentDate
        
        lastDateDatePicker.datePickerMode = UIDatePicker.Mode.date
        lastDateDatePicker.minimumDate = currentDate
        lastDateDatePicker.date = currentDate
        
    }

}
