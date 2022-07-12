//
//  TripViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 09.07.2022.
//

import UIKit

class TripViewController: UIViewController {
    // MARK: - Properties
    
    var controller: UIViewController?

    // MARK: - Actions
    
    @IBAction func goToPlan(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CheckPlan", bundle: nil)
        guard let planVC = storyboard.instantiateViewController(withIdentifier: "CheckPlanViewController") as? CheckPlanViewController else { return }
        let planNavVC = UINavigationController(rootViewController: planVC)
        
        planTrip = Plan(image: "Trip", title: "Путешествие", package: packageList[0], descriptionPlan: "Путешествие – это нечто большее. Это постоянное движение вперед.")
        
        planVC.arrayCheckPlan = tripProducts
        
        planNavVC.modalPresentationStyle = .fullScreen
        
        present(planNavVC, animated: true)
    }
}
