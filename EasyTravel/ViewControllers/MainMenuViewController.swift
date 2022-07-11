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
    @IBOutlet weak var buttonTapBar: UIButton!
    @IBOutlet weak var buttonFinance: UIButton!
    @IBOutlet weak var buttonStories: UIButton!
    @IBOutlet weak var buttonRecomendation: UIButton!
    
    // MARK: - Properties
    
    var totalBudgetText = "0"
    var totalBudgetText2 = "0"
    var totalBudgetText3 = "0"
    var storiesItems = Stories.getStories()
    
    var totalBudgetMoney: Double = 0
    var totalBudgetMoney2: Double = 0
    var totalBudgetMoney3: Double = 0
    
    // MARK: - Private Properties
    
    private var packageItems: [Plan] = Plan.getPlan()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        navigationItem.hidesBackButton = true
        setupGesture()
        
        totalBudgetText3 = UserDefaults.standard.string(forKey: "budgetForCreateTrip") ?? "0"
        totalBudgetText = UserDefaults.standard.string(forKey: "budgetForCreateTripFirstEl") ?? "0"
        totalBudgetText2 = String((UserDefaults.standard.double(forKey: "budgetForCreateTripFirstEl")) - (UserDefaults.standard.double(forKey: "budgetForCreateTrip")))
    }
    
    // MARK: - Private Methods
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.numberOfTapsRequired = 1
        packageButton.addGestureRecognizer(tapGesture)
    }
    
    private func setUpUI(Button button: UIButton) {
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    // MARK: - Methods
    
    @objc
    func tapped() {
        guard let popVC = storyboard?.instantiateViewController(withIdentifier: "popVC")
        else { return }

        popVC.modalPresentationStyle = .popover
        let popOverVC = popVC.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.sourceView = self.packageButton
        popOverVC?.sourceRect = CGRect(
            x: self.packageButton.bounds.midX,
            y: self.packageButton.bounds.minY,
            width: 0,
            height: 0
        )
        popVC.preferredContentSize = CGSize(width: 250, height: 250)

        self.present(popVC, animated: true)
    }
    
    func setupUI() {
//        buttonTapBar.showShadow()
//        buttonFinance.showShadow()
//        buttonStories.showShadow()
//        buttonRecomendation.showShadow()
    }
    
    // MARK: - IBActions
    
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
            cell.layer.cornerRadius = 25
            
            return cell
            
        case storiesCollectionView:
            guard let cell = storiesCollectionView.dequeueReusableCell(withReuseIdentifier: "storiesCell", for: indexPath) as? StoriesCollectionViewCell else { return UICollectionViewCell() }
            
            cell.storiesImage.image = storiesItems[indexPath.row].image
            cell.layer.cornerRadius = 25
        
            return cell
            
        case financeCollectionView:
            switch indexPath.row {
            case 0:
                guard let cell = financeCollectionView.dequeueReusableCell(withReuseIdentifier: "rubleIconCell", for: indexPath) as? RubleIconCollectionViewCell else { return UICollectionViewCell() }
                
                cell.layer.cornerRadius = 25
                
                return cell
            case 1:
                guard let cell = financeCollectionView.dequeueReusableCell(withReuseIdentifier: "totalBudgetCell", for: indexPath) as? TotalMoneyCollectionViewCell else { return UICollectionViewCell() }
                
                cell.totalBudgetLabel.text = totalBudgetText
                cell.totalBudgetMoney = totalBudgetMoney
                cell.layer.cornerRadius = 25
                
                return cell
            case 2:
                guard let cell = financeCollectionView.dequeueReusableCell(withReuseIdentifier: "spentMoneyCell", for: indexPath) as? SpentCollectionViewCell else { return UICollectionViewCell() }
                
                cell.layer.cornerRadius = 25
                cell.spentMoneyLabel.text = totalBudgetText2
                cell.spentMoney = totalBudgetMoney2
                
                return cell
            case 3:
                guard let cell = financeCollectionView.dequeueReusableCell(withReuseIdentifier: "remainedMoneyCell", for: indexPath) as? RemainedCollectionViewCell else { return UICollectionViewCell() }
                
                cell.remainedMoneyLabel.text = totalBudgetText3
                cell.remainedMoney = totalBudgetMoney3
                cell.layer.cornerRadius = 25
                
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
            return CGSize(width: self.financeCollectionView.frame.height / 7 * 2.5, height: self.financeCollectionView.frame.height / 7 * 5.2)
        }
        return CGSize(width: self.storiesCollectionView.frame.height / 7 * 5.2, height: self.storiesCollectionView.frame.height / 6.5 * 5.2)
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

// MARK: - MainMenuViewController extension delegate

extension MainMenuViewController: changeBudgetDelegate {
    func saveBudget(budget: Double) {

        let indexPathTotal = IndexPath(item: 1, section: 0)
        let indexPathRemained = IndexPath(item: 3, section: 0)
        
        totalBudgetText = String(budget)

        
        totalBudgetText3 = String(budget)

        totalBudgetText3 = String(budget)

        
        totalBudgetMoney = budget
        totalBudgetMoney2 = 0.0
        totalBudgetMoney3 = totalBudgetMoney
        
        financeCollectionView.reloadItems(at: [indexPathTotal, indexPathRemained])

        UserDefaults.standard.set(budget,forKey: "budgetForCreateTripFirstEl")
        UserDefaults.standard.set(budget, forKey: "budgetForCreateTrip")
    }
}

