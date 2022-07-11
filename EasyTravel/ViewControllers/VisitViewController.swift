//
//  VisitViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 09.07.2022.
//

import UIKit

class VisitViewController: UIViewController {

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    // MARK: - IBActions
    
    @IBAction func goToPlan(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CheckPlan", bundle: nil)
        guard let planVC = storyboard.instantiateViewController(withIdentifier: "PlanNavigationController") as? PlanNavigationController else { return }
        
        planTrip = Plan(image: "Visit", title: "Поездка", package: packageList[1], descriptionPlan: "Поездка – это сравнительно короткое путешествие, с целью посещения кого-либо или чего-либо.")
        
        planVC.modalPresentationStyle = .fullScreen
        
        present(planVC, animated: true)
    }
}
