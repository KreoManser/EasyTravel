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
    
    var totalBudgetMoney: Double = 0
}

