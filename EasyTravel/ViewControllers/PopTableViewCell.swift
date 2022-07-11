//
//  PopTableViewCell.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 09.07.2022.
//

import UIKit

struct Page {
    let name: String
}

class PopTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet var nameLabelPop: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
