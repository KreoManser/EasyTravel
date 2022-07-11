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

// MARK: - CheckPlanViewController
class CheckPlanViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var saveButtton: UIButton!
    @IBOutlet var viewScore: UIView!
    @IBOutlet var addButton: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var score: UILabel!
    
    static var delegate: reloadBudgetDelegate?
    
    
    // MARK: - Properties
    
    var arrayCheckPlan:[CheckPlan] = []
    let idCell = "mainCell"
    var sumArray: [Double] = []
    var sumKolArray: [Int] = []
    var mainMoney: Double = UserDefaults.standard.double(forKey: "budgetForCreateTrip")
    var flag = true
 
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsView()
    }
    
    // MARK: - IBActions
    
    @IBAction func clickSaveButton(_ sender: Any) {
        if let delegate = CheckPlanViewController.delegate {
            delegate.reloadBudget(for: mainMoney)
        }
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dismissCheckPlan(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func ClickAddButton(_ sender: Any) {
        guard let createVc = storyboard?.instantiateViewController(withIdentifier: "CreateTripViewController") as? CreateTripViewController
        else { return }
        createVc.delegate = self
        present(createVc, animated: true)
    }

    // MARK: - Methods
    
    func totalScore() -> (Void){
        if flag == true {
            var sum = 0.0
            if sumArray.count == 0 {
                score.text = "0"
            } else {
                for index in sumArray.count-1...sumArray.count-1 { //0,1
                sum = (Double(sumArray[index]) * Double(sumKolArray[index]))
                if sum > mainMoney {
                    sumArray.removeLast()
                    arrayCheckPlan.removeLast()
                    sumKolArray.removeLast()
                    sum = 0
                }
            }
                mainMoney = mainMoney - sum
                if mainMoney == 0 {
                    flag = false
                }
                score.text = String( mainMoney)
            }
        } else {
            sumArray.removeLast()
            arrayCheckPlan.removeLast()
            sumKolArray.removeLast()
        }
    }
    
    func settingsView(){
        score.text = String(mainMoney)
        tableView.dataSource = self
        tableView.delegate = self
        viewScore.layer.cornerRadius = 20
        saveButtton.layer.cornerRadius = 20
        viewScore.layer.masksToBounds = true;
        viewScore.backgroundColor = UIColor(
            red: 104.0 / 255,
            green: 109.0 / 255,
            blue: 224.0 / 255,
            alpha: 1.0)
        saveButtton.backgroundColor = UIColor(
            red: 104.0 / 255,
            green: 109.0 / 255,
            blue: 224.0 / 255,
            alpha: 1.0)
    }
    
}

// MARK: - CheckPlanViewController extension TableView
    
extension CheckPlanViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCheckPlan.count
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as? CheckPlanTableViewCell
        else { return UITableViewCell() }
        
        cell.labels.text = arrayCheckPlan[indexPath.row].object
        let ff = (arrayCheckPlan[indexPath.row].cost) * Double(arrayCheckPlan[indexPath.row].quantity)
        cell.lastname.text =  "\(ff) руб"
        cell.kolve.text = "x\(arrayCheckPlan[indexPath.row].quantity)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle : UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            mainMoney += ((sumArray[indexPath.row]) * Double(sumKolArray[indexPath.row]))
            if mainMoney >= 0 {
                flag = true
            }
            arrayCheckPlan.remove(at: indexPath.row)
            sumArray.remove(at: indexPath.row)
            sumKolArray.remove(at: indexPath.row)
            score.text = String( mainMoney)
            tableView.deleteRows(at: [indexPath] , with: .fade)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
}

// MARK: - CheckPlanViewController extension Delegate

extension CheckPlanViewController: CreatePlanDelegate {
    
    func savePlan(for plan: CheckPlan) {
        arrayCheckPlan.append(plan)
        sumArray.append(plan.cost)
        sumKolArray.append(plan.quantity)
        totalScore()
        DispatchQueue.main.async{ self.tableView.reloadData() }
    }
    
    
}


// MARK: - PlanNavigationController

class PlanNavigationController: UINavigationController {
    
}



