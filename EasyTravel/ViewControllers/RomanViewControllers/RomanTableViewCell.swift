//
//  RomanTableViewCell.swift
//  EasyTravel
//
//  Created by Роман Гиниятов on 06.07.2022.
//

import UIKit

class RomanTableViewCell: UITableViewCell {
    @IBOutlet var labels: UILabel!
    @IBOutlet var lastname: UILabel!
    
    @IBOutlet var imageF : UIImageView!
    @IBOutlet var imageG : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageF.image = UIImage(systemName: "checkmark.seal")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
