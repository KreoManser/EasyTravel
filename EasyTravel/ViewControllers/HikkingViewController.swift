//
//  HikkingViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 09.07.2022.
//

import UIKit

// MARK: - HikkingViewController

class HikkingViewController: UIViewController {
    // MARK: - IBActions

    @IBAction func goToPlan(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CheckPlan", bundle: nil)
        guard let planVC = storyboard.instantiateViewController(withIdentifier: "PlanNavigationController") as? PlanNavigationController else { return }
        
        planTrip = Plan(image: "Hikking", title: "Поход", package: packageList[2], descriptionPlan: "Поход – это совместное путешествие группы людей по определенному маршруту и верный путь к обретению здоровья.")
        
        planVC.modalPresentationStyle = .fullScreen
        
        present(planVC, animated: true)
    }
}
