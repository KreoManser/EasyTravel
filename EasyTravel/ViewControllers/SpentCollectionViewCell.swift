//
//  SpentCollectionViewCell.swift
//  EasyTravel
//
//  Created by Рустам Шайхинуров on 08.07.2022.
//

import UIKit

// MARK: - SpentCollectionViewCell

class SpentCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var spentMoneyLabel: UILabel!
    
    // MARK: - Private Properties
    
    var spentMoney = 0.0
    
    // MARK: - Life Cycle
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
