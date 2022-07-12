//
//  RemainedCollectionViewCell.swift
//  EasyTravel
//
//  Created by Рустам Шайхинуров on 08.07.2022.
//

import UIKit

class RemainedCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets
    
    @IBOutlet weak var remainedMoneyLabel: UILabel!
    
    // MARK: - Properties
    
    var remainedMoney: Double = 0
}
