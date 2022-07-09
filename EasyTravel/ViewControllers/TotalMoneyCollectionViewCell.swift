//
//  FinanceCollectionViewCell.swift
//  EasyTravel
//
//  Created by Рустам Шайхинуров on 08.07.2022.
//

import UIKit

// MARK: - TotalMoneyCollectionViewCell

class TotalMoneyCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var totalBudgetLabel: UILabel!
    
    // MARK: - Private Properties
    
    var totalBudgetMoney: Double = 0
    
    // MARK: - IBActions
    
    // MARK: - Methods
    
    
//
//    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("hello")
//        guard let changeBudgetVC = segue.destination as? ChangeBudgetViewController else { return }
//        changeBudgetVC.change = totalBudgetLabel.text
//        changeBudgetVC.delegate = self
//
//    }

    
}

