//
//  ViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 04.07.2022.
//

import UIKit

// MARK: - MainMenuViewController

class MainMenuViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var recommendationsImage: UIImageView!
    @IBOutlet weak var recommendationsBackground: UIView!
    @IBOutlet weak var storiesCollectionView: UICollectionView!
    @IBOutlet weak var financeCollectionView: UICollectionView!
    @IBOutlet weak var tripCollectionView: UICollectionView!
    @IBOutlet weak var tapBarView: UIView!
    @IBOutlet weak var addNewPackageButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var packageButton: UIButton!

    
    var totalBudgetText = "0"
    var storiesItems = ["storiesImage", "storiesImage",
                        "storiesImage", "storiesImage", "storiesImage"]
    var totalBudgetMoney: Double = 0
    
    private var packageItems: [Plan] = Plan.getPlan()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        setupGesture()
    }
    
    // MARK: - Private Methods
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.numberOfTapsRequired = 1
        packageButton.addGestureRecognizer(tapGesture)
    }
    
    
    // MARK: - Methods
    
    @objc
    func tapped() {
        guard let popVC = storyboard?.instantiateViewController(withIdentifier: "popVC") else { return }

        popVC.modalPresentationStyle = .popover
        let popOverVC = popVC.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.sourceView = self.packageButton
        popOverVC?.sourceRect = CGRect(x: self.packageButton.bounds.midX, y: self.packageButton.bounds.minY, width: 0, height: 0)
        popVC.preferredContentSize = CGSize(width: 250, height: 250)

        self.present(popVC, animated: true)
    }
    
    // MARK: - IBActions
    
    @IBAction func packageButtonDidTap(_ sender: Any) {
        // реализовать при нажатии на коробку
    }
    
    @IBAction func addNewPackageButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CreateNewTrip", bundle: nil)
        guard let createPlanVC = storyboard.instantiateViewController(withIdentifier: "CreateNewTripNavigationController") as? CreateNewTripNavigationController else { return }
        
        createPlanVC.modalPresentationStyle = .fullScreen
        present(createPlanVC, animated: true)
    
    }
    
    
    @IBAction func addButtonDidTap(_ sender: Any) {
        guard let changeBudgetVC = storyboard?.instantiateViewController(withIdentifier: "ChangeBudgetViewController") as? ChangeBudgetViewController else { return }
        
        changeBudgetVC.delegate = self
        
        present(changeBudgetVC, animated: true)
    }
    
    @IBAction func settingsButtonDIdTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        guard let settingsVC = storyboard.instantiateViewController(withIdentifier: "SettingsNavigationController") as? SettingsNavigationController else { return }
        
        settingsVC.modalPresentationStyle = .fullScreen
        present(settingsVC, animated: true)
    }
}

// MARK: - MainMenuViewController extension for UICollection

extension MainMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case storiesCollectionView:
            return storiesItems.count
        case financeCollectionView:
            return 4
        case tripCollectionView:
            return packageItems.count
        default:
            break
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case tripCollectionView:
            guard let cell = tripCollectionView.dequeueReusableCell(withReuseIdentifier: "tripCell", for: indexPath) as? TripCollectionViewCell else { return UICollectionViewCell() }
            
            cell.tripImageView.image = packageItems[indexPath.row].image
            cell.typeOfTripLabel.text = packageItems[indexPath.row].title
            cell.layer.cornerRadius = 20
            
            return cell
            
        case storiesCollectionView:
            guard let cell = storiesCollectionView.dequeueReusableCell(withReuseIdentifier: "storiesCell", for: indexPath) as? StoriesCollectionViewCell else { return UICollectionViewCell() }
            
            cell.storiesImage.image = UIImage(named: storiesItems[indexPath.row])
            cell.layer.cornerRadius = 20
        
            return cell
            
        case financeCollectionView:
            switch indexPath.row {
            case 0:
                guard let cell = financeCollectionView.dequeueReusableCell(withReuseIdentifier: "rubleIconCell", for: indexPath) as? RubleIconCollectionViewCell else { return UICollectionViewCell() }
                
                
                cell.layer.cornerRadius = 20
                
                return cell
            case 1:
                guard let cell = financeCollectionView.dequeueReusableCell(withReuseIdentifier: "totalBudgetCell", for: indexPath) as? TotalMoneyCollectionViewCell else { return UICollectionViewCell() }
                
                cell.totalBudgetLabel.text = totalBudgetText
                cell.totalBudgetMoney = totalBudgetMoney
                cell.layer.cornerRadius = 20
                
                return cell
            case 2:
                guard let cell = financeCollectionView.dequeueReusableCell(withReuseIdentifier: "spentMoneyCell", for: indexPath) as? SpentCollectionViewCell else { return UICollectionViewCell() }
                cell.layer.cornerRadius = 20
                
                return cell
            case 3:
                guard let cell = financeCollectionView.dequeueReusableCell(withReuseIdentifier: "remainedMoneyCell", for: indexPath) as? RemainedCollectionViewCell else { return UICollectionViewCell() }
                
                cell.remainedMoneyLabel.text = totalBudgetText
                cell.remainedMoney = totalBudgetMoney
                cell.layer.cornerRadius = 20
                
                return cell
            default:
                break
            }
        default:
            break
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 && collectionView == financeCollectionView {
            return CGSize(width: self.financeCollectionView.frame.height / 6 * 2.5, height: self.financeCollectionView.frame.height / 6 * 2.5)
        }
        return CGSize(width: self.storiesCollectionView.frame.height / 6 * 5.2, height: self.storiesCollectionView.frame.height / 6 * 5.2)
    }
    
    // обработка нажатий на ячейки в "каруселях"
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case storiesCollectionView:
            let storyboardStories = UIStoryboard(name: "ShowStory", bundle: nil)
            guard let storiesVC = storyboardStories.instantiateViewController(withIdentifier: "ShowStoryViewController") as? ShowStoryViewController else { return }
            navigationController?.pushViewController(storiesVC, animated: true)
        //case tripCollectionView: нажатие на активную поездку
        default:
            break
        }
    }
}

// MARK: - MainMenuViewController extension popover

extension MainMenuViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

// MARK: - CheckPlanNavigationController empty class

class CheckPlanNavigationController: UINavigationController {
    
}

// MARK: - MainMenuViewController extension delegate

extension MainMenuViewController: changeBudgetDelegate {
    func saveBudget(budget: Double) {

        let indexPathTotal = IndexPath(item: 1, section: 0)
        let indexPathRemained = IndexPath(item: 3, section: 0)
        
        totalBudgetMoney = budget
        totalBudgetText = String(budget)
       
        
        
        financeCollectionView.reloadItems(at: [indexPathTotal, indexPathRemained])

    }
}

