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
//        setShadow()
        
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
        
//        navigationController?.pushViewController(createPlanVC, animated: true)
    }
    
    @IBAction func settingsButtonDIdTap(_ sender: Any) {
        // реализовать при нажатии на шестеренку
    }
    
//    private func setShadow() {
//        recommendationsBackground.layer.masksToBounds = false
//        recommendationsBackground.layer.shadowColor = UIColor.black.cgColor
//        recommendationsBackground.layer.shadowOpacity = 1
//        recommendationsBackground.layer.shadowRadius = 10
//        recommendationsBackground.layer.shadowOffset = .zero
//        recommendationsBackground.layer.shadowPath = UIBezierPath(rect: recommendationsBackground.bounds).cgPath
//        recommendationsBackground.layer.shouldRasterize = true
//
//        tapBarView.layer.masksToBounds = false
//        tapBarView.layer.shadowColor = UIColor.black.cgColor
//        tapBarView.layer.shadowOpacity = 0.6
//        tapBarView.layer.shadowRadius = 10
//        tapBarView.layer.shadowOffset = .zero
//        tapBarView.layer.shadowPath = UIBezierPath(rect: tapBarView.bounds).cgPath
//        tapBarView.layer.shouldRasterize = true
//    }
    
    
}

// MARK: - MainMenuViewController extension for UICollection
extension MainMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case storiesCollectionView: return storiesItems.count
        case financeCollectionView: return 4
        case tripCollectionView: return storiesItems.count
            
        default: break
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case tripCollectionView:
            let cell = tripCollectionView.dequeueReusableCell(withReuseIdentifier: "tripCell", for: indexPath) as! TripCollectionViewCell
            
            cell.tripImageView.image = UIImage(named: storiesItems[indexPath.row])
            cell.typeOfTripLabel.text = "Лес"
            cell.layer.cornerRadius = 20
            
            cell.frame.size = CGSize(width: 107, height: 107)
//            cell.
            
            return cell
            
        case storiesCollectionView:
            let cell = storiesCollectionView.dequeueReusableCell(withReuseIdentifier: "storiesCell", for: indexPath) as! StoriesCollectionViewCell
            
            cell.storiesImage.image = UIImage(named: storiesItems[indexPath.row])
            cell.layer.cornerRadius = 20
            
        
            return cell
            
        case financeCollectionView:
            switch indexPath.row {
            case 0:
                let cell = financeCollectionView.dequeueReusableCell(withReuseIdentifier: "rubleIconCell", for: indexPath) as! RubleIconCollectionViewCell
//                cell.frame.size = CGSize(width: 30, height: 30)
                return cell
            case 1:
                let cell = financeCollectionView.dequeueReusableCell(withReuseIdentifier: "totalBudgetCell", for: indexPath) as! TotalMoneyCollectionViewCell
                cell.layer.cornerRadius = 20
                
                return cell
            case 2:
                let cell = financeCollectionView.dequeueReusableCell(withReuseIdentifier: "spentMoneyCell", for: indexPath) as! SpentCollectionViewCell
                cell.layer.cornerRadius = 20
                
                return cell
            case 3:
                let cell = financeCollectionView.dequeueReusableCell(withReuseIdentifier: "remainedMoneyCell", for: indexPath) as! RemainedCollectionViewCell
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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.row == 0 && collectionView == financeCollectionView {
//            return CGSize(width: 30, height: 30)
//        } else if collectionView == tripCollectionView { return CGSize(width: 130, height: 130) }
//        else { return CGSize(width: 72, height: 72) }
//    }
    
    // обработка нажатий на ячейки в "каруселях"
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        default:
            break
        }
    }
}

