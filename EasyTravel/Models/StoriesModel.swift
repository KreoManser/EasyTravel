//
//  StoriesModel.swift
//  EasyTravel
//
//  Created by Рустам Шайхинуров on 10.07.2022.
//

import Foundation
import UIKit

struct Stories {
    let image: UIImage?
    let storiesScreen: UIViewController?
    
    static func getStories() -> [Stories] {
        [
            Stories(
                image: UIImage(named: "storiesImage"),
                storiesScreen: UIStoryboard(
                    name: "ShowStory",
                    bundle: nil
                ).instantiateViewController(withIdentifier: "ShowStoryViewController")
            ),
            Stories(
                image: UIImage(named: "storiesImage"),
                storiesScreen: UIStoryboard(
                    name: "ShowStory",
                    bundle: nil
                ).instantiateViewController(withIdentifier: "ShowStoryViewController")
            ),
            Stories(
                image: UIImage(named: "storiesImage"),
                storiesScreen: UIStoryboard(
                    name: "ShowStory",
                    bundle: nil
                ).instantiateViewController(withIdentifier: "ShowStoryViewController")
            ),
            Stories(
                image: UIImage(named: "storiesImage"),
                storiesScreen: UIStoryboard(
                    name: "ShowStory",
                    bundle: nil
                ).instantiateViewController(withIdentifier: "ShowStoryViewController")
            ),
        ]
    }
}

