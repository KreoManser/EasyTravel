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
    @IBOutlet var kolve: UILabel!
    @IBOutlet var imageF : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
