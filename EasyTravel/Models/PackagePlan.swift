//
//  PackagePlan.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 05.07.2022.
//

import Foundation
import UIKit

let packageList = ["trip", "visit", "hikking"]

struct Plan: Codable {
    let image: String?
    let title: String
    let package: String
    let descriptionPlan: String
    
    static func getPlan() -> [Plan] {
        [
            Plan(
                image: "storiesImage",
                title: "Поход",
                package: packageList[2],
                descriptionPlan: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
            ),
            Plan(
                image: "Trip",
                title: "Путешествие",
                package: packageList[0],
                descriptionPlan: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
            ),
            Plan(
                image: "Visit",
                title: "Визит",
                package: packageList[1],
                descriptionPlan: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
            ),
        ]
    }
}
