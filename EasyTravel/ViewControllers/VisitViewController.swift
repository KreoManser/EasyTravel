//
//  VisitViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 09.07.2022.
//

import UIKit

class VisitViewController: UIViewController {
    // MARK: - IBActions
    
    @IBAction func goToPlan(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CheckPlan", bundle: nil)
        guard let planVC = storyboard.instantiateViewController(withIdentifier: "CheckPlanViewController") as? CheckPlanViewController else { return }
        let planNavVC = UINavigationController(rootViewController: planVC)
        
        planTrip = Plan(image: "Visit", title: "Поездка", package: packageList[0], descriptionPlan: "Поездка – это сравнительно короткое путешествие, с целью посещения кого-либо или чего-либо.")
        
        planVC.arrayCheckPlan = visitProducts
        
        planNavVC.modalPresentationStyle = .fullScreen
        
        present(planNavVC, animated: true)
    }
}
