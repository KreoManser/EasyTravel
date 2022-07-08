//
//  FinanceCollectionViewCell.swift
//  EasyTravel
//
//  Created by Рустам Шайхинуров on 08.07.2022.
//

import UIKit

class TotalMoneyCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var totalBudgetLabel: UILabel!
    @IBOutlet weak var addMoneyButton: UIButton!
    
    private var totalBudgetMoney = 0
    
    @IBAction func addMoneyButtonDidTap(_ sender: Any) {
        totalBudgetMoney += 100
        totalBudgetLabel.text = String(totalBudgetMoney)
    }
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
