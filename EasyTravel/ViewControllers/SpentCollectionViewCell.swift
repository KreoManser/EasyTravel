//
//  SpentCollectionViewCell.swift
//  EasyTravel
//
//  Created by Рустам Шайхинуров on 08.07.2022.
//

import UIKit

class SpentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var spentMoneyLabel: UILabel!
    
    private var spentMoney = 0
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
