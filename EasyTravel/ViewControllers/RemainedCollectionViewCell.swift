//
//  RemainedCollectionViewCell.swift
//  EasyTravel
//
//  Created by Рустам Шайхинуров on 08.07.2022.
//

import UIKit
// MARK: - RemainedCollectionViewCell
class RemainedCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var remainedMoneyLabel: UILabel!
    
    // MARK: - Private Properties
    
    var remainedMoney: Double = 0
}
