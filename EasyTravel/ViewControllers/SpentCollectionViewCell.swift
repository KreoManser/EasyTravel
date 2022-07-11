//
//  SpentCollectionViewCell.swift
//  EasyTravel
//
//  Created by Рустам Шайхинуров on 08.07.2022.
//

import UIKit

class SpentCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets
    
    @IBOutlet weak var spentMoneyLabel: UILabel!
    
    // MARK: - Properties
    
    var spentMoney = 0.0
    
    // MARK: - View life Cycle
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
