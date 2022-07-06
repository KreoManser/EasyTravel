//
//  PackagePlanViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 06.07.2022.
//

import UIKit

// MARK: -UIPageViewController
class PackagePlanViewController: UIPageViewController {
    // Initialize the list of storyboards
    var viewControllersList: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Plans", bundle: nil)
        
        let TripVC = storyboard.instantiateViewController(
            withIdentifier: "TripVC"
        )
        let VisitVC = storyboard.instantiateViewController(
            withIdentifier: "VisitVC"
        )
        let HikkingVC = storyboard.instantiateViewController(
            withIdentifier: "HikkingVC"
        )
        
        return [TripVC, VisitVC, HikkingVC]
    }()

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

}

// MARK: -UIPageViewControllerDataSource
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
