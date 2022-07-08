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
    @IBOutlet weak var addMoneyButton: UIButton!
    
    // MARK: - Private Properties
    
    private var totalBudgetMoney = 0
    
    // MARK: - IBActions
    
    @IBAction func addMoneyButtonDidTap(_ sender: Any) {
        totalBudgetMoney += 100
        totalBudgetLabel.text = String(totalBudgetMoney)
    }
}
