//
//  StoriesModel.swift
//  EasyTravel
//
//  Created by Рустам Шайхинуров on 10.07.2022.
//

import Foundation
import UIKit

struct Stories {
    let icon: UIImage?
    let backgroundImage: UIImage?
    let titleText: String?
    let descriptionText: String?
        
    static func getStories() -> [Stories] {
        [
            Stories(
                icon: UIImage(named: "storiesImage"),
                backgroundImage: UIImage(named: "storyOne")!,
                titleText: "Куда поехать отдыхать этим летом?",
                descriptionText: "Первое и самое популярное направление — южный берег Крыма. Здесь замечательные горные пейзажи, тёплый климат, дворцы и замки, древние крепости и роскошные ботанические сады."
            ),
            
            
            
            
            Stories(
                icon: UIImage(named: "storiesImage"),
                backgroundImage: UIImage(named: "storyOne"),
                titleText: "Куда поехать отдыхать этим летом?",
                descriptionText: "Первое и самое популярное направление — южный берег Крыма. Здесь замечательные горные пейзажи, тёплый климат, дворцы и замки, древние крепости и роскошные ботанические сады."
            ),
            Stories(
                icon: UIImage(named: "storiesImage"),
                backgroundImage: UIImage(named: "storyOne"),
                titleText: "Куда поехать отдыхать этим летом?",
                descriptionText: "Первое и самое популярное направление — южный берег Крыма. Здесь замечательные горные пейзажи, тёплый климат, дворцы и замки, древние крепости и роскошные ботанические сады."
            ),
            Stories(
                icon: UIImage(named: "storiesImage"),
                backgroundImage: UIImage(named: "storyOne"),
                titleText: "Куда поехать отдыхать этим летом?",
                descriptionText: "Первое и самое популярное направление — южный берег Крыма. Здесь замечательные горные пейзажи, тёплый климат, дворцы и замки, древние крепости и роскошные ботанические сады."
            ),
        ]
    }
}

