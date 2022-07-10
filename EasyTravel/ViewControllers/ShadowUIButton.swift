//
//  ShadowUIButton.swift
//  EasyTravel
//
//  Created by Тимур Миргалиев on 10.07.2022.
//

import UIKit

extension UIButton {
    
    // MARK: - Additional method for the shadow

    func showShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }

}
