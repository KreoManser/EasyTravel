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
    
    let storiesItems = ["Trip", "Trip", "Trip", "Trip", "Trip", "Trip", "Trip", "Trip", "Trip", "Trip", "Trip", "Trip", "Trip", "Trip"]
    
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
    
    // MARK: - IBActions
    
    @IBAction func packageButtonDidTap(_ sender: Any) {
        // реализовать при нажатии на коробку
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
    
    @IBAction func addNewPackageButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CreateNewTrip", bundle: nil)
        guard let createPlanVC = storyboard.instantiateViewController(withIdentifier: "CreateNewTripNavigationController") as? CreateNewTripNavigationController else { return }
        
        createPlanVC.modalPresentationStyle = .fullScreen
        present(createPlanVC, animated: true)
    }
    
    @IBAction func settingsButtonDIdTap(_ sender: Any) {
        // реализовать при нажатии на шестеренку
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
            return storiesItems.count
        default:
            break
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case tripCollectionView:
            guard let cell = tripCollectionView.dequeueReusableCell(withReuseIdentifier: "tripCell", for: indexPath) as? TripCollectionViewCell else { return UICollectionViewCell() }
            
            cell.tripImageView.image = UIImage(named: storiesItems[indexPath.row])
            cell.typeOfTripLabel.text = "Лес"
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
                cell.layer.cornerRadius = 20
                
                return cell
            case 2:
                guard let cell = financeCollectionView.dequeueReusableCell(withReuseIdentifier: "spentMoneyCell", for: indexPath) as? SpentCollectionViewCell else { return UICollectionViewCell() }
                cell.layer.cornerRadius = 20
                
                return cell
            case 3:
                guard let cell = financeCollectionView.dequeueReusableCell(withReuseIdentifier: "remainedMoneyCell", for: indexPath) as? RemainedCollectionViewCell else { return UICollectionViewCell() }
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
        return CGSize(width: self.storiesCollectionView.frame.height / 6 * 5.2, height: self.storiesCollectionView.frame.height / 6 * 5.2)

    }
    
    // обработка нажатий на ячейки в "каруселях"
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        default:
            break
        }
    }
}

extension MainMenuViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
