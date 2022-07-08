//
//  PackagePlan.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 05.07.2022.
//

import Foundation
import UIKit

enum Package {
    case hiking
    case trip
    case visit
}

struct Plan {
//    let image: UIImage
    let title: String
    let package: Package
    let description: String
    
    static func getPlan() -> [Plan] {
        [
            Plan(
                title: "Поход",
                package: .hiking,
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
            ),
            Plan(
                title: "Путешествие",
                package: .trip,
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
            ),
            Plan(
                title: "Визит",
                package: .visit,
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
            ),
        ]
    }
}
