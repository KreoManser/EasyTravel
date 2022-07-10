//
//  RomanViewController.swift
//  EasyTravel
//
//  Created by Роман Гиниятов on 06.07.2022.
//

import UIKit

struct Ter {
    var name:String
    let lastname:Double
    let kolve:Int
}

// MARK: - CheckPlanViewController
class CheckPlanViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var saveButtton: UIButton!
    @IBOutlet var viewScore: UIView!
    @IBOutlet var addButton: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var score: UILabel!
    
    // MARK: - Properties
    
    var ters:[Ter] = []
    let idCell = "mainCell"
    var sumArray:[Double] = []
    var sumKolArray:[Int] = []
    
    var mainMoney: Double = UserDefaults.standard.double(forKey: "budgetForCreateTrip")
    var flag = true
 
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsView()
    }
    
    // MARK: - IBActions
    
    @IBAction func clickSaveButton(_ sender: Any) {
        UserDefaults.standard.set(mainMoney, forKey: "budgetForCreateTrip")
                
        let storyboardStories = UIStoryboard(name: "Main", bundle: nil)
        guard let backMainMenuVC = storyboardStories.instantiateViewController(withIdentifier: "MainMenuViewController") as? MainMenuViewController else { return }
        
        navigationController?.pushViewController(backMainMenuVC, animated: true)
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
            createAlert(
                title: "Ошибка", description: "Не удалось добавить товар! Проверте баланс"
            )
            var sum:Double = 0
            if sumArray.count == 0 {
                score.text = String( 0)
            } else {
                for index in sumArray.count-1...sumArray.count-1{ //0,1
                sum = (Double ( sumArray[index]) * Double (sumKolArray[index]))
                if sum > mainMoney {
                    sumArray.removeLast()
                    ters.removeLast()
                    sumKolArray.removeLast()
                    sum = 0
                    createAlert(title: "Ошибка!", description: "Не удалось добавить товар! Проверьте баланс")
                }
            }
                mainMoney = mainMoney - sum
                if  mainMoney == 0 {
                    flag = false
                    createAlert(title: "Ошибка!", description: "Не удалось добавить товар! Проверьте баланс")
                }
                score.text = String( mainMoney)}
        } else {
            sumArray.removeLast()
            ters.removeLast()
            sumKolArray.removeLast()
            createAlert(title: "Ошибка!", description: "Не удалось добавить товар! Проверьте свой баланс")
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
    
    @IBAction func dismissCheckPlan(_ sender: Any) {
        dismiss(animated: true)
    }
}

// MARK: - CheckPlanViewController extension TableView
    
extension CheckPlanViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ters.count
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as? CheckPlanTableViewCell
        else { return UITableViewCell() }
        
        cell.labels.text = ters[indexPath.row].name
        let ff = (ters[indexPath.row].lastname) * Double(ters[indexPath.row].kolve)
        cell.lastname.text =  "\(ff) руб"
        cell.kolve.text = "x\(ters[indexPath.row].kolve)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle : UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            mainMoney += ((sumArray[indexPath.row]) * Double(sumKolArray[indexPath.row]))
            if mainMoney >= 0 {
                flag = true
            }
            ters.remove(at: indexPath.row)
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
    func savePlan(for plan: Ter) {
        ters.append(plan)
        sumArray.append(plan.lastname)
        sumKolArray.append(plan.kolve)
        totalScore()
        DispatchQueue.main.async{ self.tableView.reloadData() }
    }
}

// MARK: - PlanNavigationController

class PlanNavigationController: UINavigationController {
    
}



