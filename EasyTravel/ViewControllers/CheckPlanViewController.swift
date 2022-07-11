//
//  RomanViewController.swift
//  EasyTravel
//
//  Created by Роман Гиниятов on 06.07.2022.
//

import UIKit

protocol reloadBudgetDelegate: AnyObject {
    func reloadBudget(for mainMoney: Double)
}

class CheckPlanViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet var saveButtton: UIButton!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var addButton: UIBarButtonItem!
    @IBOutlet var listOfProductsTV: UITableView!
    @IBOutlet var totalBudgetInBottomLabel: UILabel!
    
    // MARK: - Properties
    
    static var delegate: reloadBudgetDelegate?
    let idCell = "mainCell"
    var arrayCheckPlan:[CheckPlan] = []
    var sumArray: [Double] = []
    var sumCountArray: [Int] = []
    var remainedMoney: Double = UserDefaults.standard.double(forKey: "budgetForCreateTrip")
    var checkBudget = true
    
    // MARK: - Private properties
    
    private let dataStoreManager = DataStoreManager()
 
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfProductsTV.dataSource = self
        listOfProductsTV.delegate = self
        settingsView()
    }
    
    // MARK: - Actions
    
    @IBAction func saveButtonDidTap(_ sender: Any) {
        dataStoreManager.saveTrip(TripInfo(name: nameTrip ?? "", plan: planTrip!, items: itemsTrip))
        
        if let delegate = CheckPlanViewController.delegate {
            delegate.reloadBudget(for: remainedMoney)
        }

        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func itemBarButtonDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func addButtonDidTap(_ sender: Any) {
        guard let createVc = storyboard?.instantiateViewController(withIdentifier: "CreateTripViewController") as? CreateTripViewController
        else { return }
        createVc.delegate = self
        present(createVc, animated: true)
    }

    // MARK: - Methods
    
    func checkSum() {
        if checkBudget == true {
            var sum = 0.0
            if sumArray.count == 0 {
                totalBudgetInBottomLabel.text = "0"
            } else {
                for index in sumArray.count-1...sumArray.count-1 { //0,1
                sum = (Double(sumArray[index]) * Double(sumCountArray[index]))
                if sum > remainedMoney {
                    sumArray.removeLast()
                    arrayCheckPlan.removeLast()
                    sumCountArray.removeLast()
                    sum = 0
                }
            }
                remainedMoney = remainedMoney - sum
                if remainedMoney == 0 {
                    checkBudget = false
                }
                totalBudgetInBottomLabel.text = String(remainedMoney)
            }
        } else {
            sumArray.removeLast()
            arrayCheckPlan.removeLast()
            sumCountArray.removeLast()
        }
    }
    
    func settingsView(){
        totalBudgetInBottomLabel.text = String(remainedMoney)
        backgroundView.layer.cornerRadius = 20
        saveButtton.layer.cornerRadius = 20
        backgroundView.layer.masksToBounds = true;
        backgroundView.backgroundColor = UIColor(
            red: 104.0 / 255,
            green: 109.0 / 255,
            blue: 224.0 / 255,
            alpha: 1.0
        )
        saveButtton.backgroundColor = UIColor(
            red: 104.0 / 255,
            green: 109.0 / 255,
            blue: 224.0 / 255,
            alpha: 1.0
        )
    }
    
}
    
extension CheckPlanViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCheckPlan.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as? CheckPlanTableViewCell else { return UITableViewCell() }
        
        cell.nameOfItem.text = arrayCheckPlan[indexPath.row].object
        let ff = (arrayCheckPlan[indexPath.row].cost) * Double(arrayCheckPlan[indexPath.row].quantity)
        cell.priceLabel.text =  "\(ff) руб"
        cell.countOfItemLabel.text = "x\(arrayCheckPlan[indexPath.row].quantity)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle : UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            remainedMoney += ((sumArray[indexPath.row]) * Double(sumCountArray[indexPath.row]))
            if remainedMoney >= 0 {
                checkBudget = true
            }
            arrayCheckPlan.remove(at: indexPath.row)
            sumArray.remove(at: indexPath.row)
            sumCountArray.remove(at: indexPath.row)
            totalBudgetInBottomLabel.text = String( remainedMoney)
            tableView.deleteRows(at: [indexPath] , with: .fade)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
}

extension CheckPlanViewController: CreatePlanDelegate {
    func savePlan(for plan: CheckPlan) {
        itemsTrip.append(Item(itemName: plan.object, price: plan.cost))
        arrayCheckPlan.append(plan)
        sumArray.append(plan.cost)
        sumCountArray.append(plan.quantity)
        
        checkSum()
        
        DispatchQueue.main.async { self.listOfProductsTV.reloadData() }
    }
}

class PlanNavigationController: UINavigationController {
}



