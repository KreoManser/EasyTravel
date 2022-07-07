//
//  OneTableViewCell.swift
//  EasyTravel
//
//  Created by Вадим Валеев on 07.07.2022.
//

import UIKit

class OneTableViewCell: UITableViewCell {
    

    @IBOutlet weak var labelViewCell: UILabel!
    @IBOutlet weak var iconViewCell: UIImageView!
    
    func configue(with setting: settingModel) {
        labelViewCell.text = setting.label
        iconViewCell.image = setting.icon
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
