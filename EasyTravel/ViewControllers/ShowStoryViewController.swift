//
//  ShowStoryViewController.swift
//  EasyTravel
//
//  Created by Тимур Миргалиев on 08.07.2022.
//

import UIKit

class ShowStoryViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var imageBackgroundView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var backgroundImage: UIImage?
    var titleText: String?
    var descriptionText: String?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = backgroundImage {
            imageBackgroundView.image = backgroundImage
        }
        if let titleText = titleText {
            titleLabel.text = titleText
        }
        if let descriptionText = descriptionText {
            descriptionLabel.text = descriptionText
        }
    }
}
