//
//  PackagePlan.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 05.07.2022.
//

import Foundation
import UIKit

enum Package {
    case trip
    case visit
    case hikking
}

struct Plan {
    let image: UIImage?
    let title: String
    let package: Package
    let description: String

    
    static func getPlan() -> [Plan] {
        [
            Plan(
                image: UIImage(named: "Hikking"),
                title: "Поход",
                package: .hikking,
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
            ),
            Plan(
                image: UIImage(named: "Trip"),
                title: "Путешествие",
                package: .trip,
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
            ),
            Plan(
                image: UIImage(named: "Visit"),
                title: "Визит",
                package: .visit,
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
            ),
        ]
    }
}
