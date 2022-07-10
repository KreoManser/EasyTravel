//
//  PackagePlanViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 06.07.2022.
//

import UIKit

// MARK: - UIPageViewController

class PackagePlanViewController: UIPageViewController {

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        
        if let firstVC = viewControllersList.first {
            self.setViewControllers(
                [firstVC],
                direction: .forward,
                animated: true,
                completion: nil
            )
        }
    }
    
    // MARK: - Properties
    
    // Initialize the list of storyboards
    var viewControllersList: [UIViewController] = {
        var views: [UIViewController] = []
        let storyboard = UIStoryboard(name: "Plans", bundle: nil)
        
        guard let TripVC = storyboard.instantiateViewController(
            withIdentifier: "TripVC"
        ) as? TripViewController else { return [] }
        views.append(TripVC)
        guard let VisitVC = storyboard.instantiateViewController(
            withIdentifier: "VisitVC"
        ) as? VisitViewController else { return [TripVC] }
        views.append(VisitVC)
        guard let HikkingVC = storyboard.instantiateViewController(
            withIdentifier: "HikkingVC"
        ) as? HikkingViewController else { return [TripVC, VisitVC] }
        views.append(HikkingVC)
        
        return views
    }()
    
    // MARK: - IBActions
    
    @IBAction func backToMainPressed() {
        dismiss(animated: true)
    }
}

// MARK: - UIPageViewControllerDataSource

extension PackagePlanViewController: UIPageViewControllerDataSource {
    // Before pageViewController
    func pageViewController(
                            _ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard let vcIndex = viewControllersList.firstIndex(of: viewController)
        else { return nil }

        let previousIndex = vcIndex - 1

        guard previousIndex >= 0 else { return nil }
        guard viewControllersList.count > previousIndex else { return nil }

        return viewControllersList[previousIndex]
    }
    
    // After pageViewController
    func pageViewController(
                            _ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard let vcIndex = viewControllersList.firstIndex(of: viewController)
        else { return nil }
        
        let nextIndex = vcIndex + 1
        
        guard viewControllersList.count != nextIndex else { return nil }
        guard viewControllersList.count > nextIndex else { return nil }
        
        return viewControllersList[nextIndex]
    }
}

// MARK: - PackagePlanNavigationContoller - empty class for storyboard

class PackagePlanNavigationContoller: UINavigationController {

}
