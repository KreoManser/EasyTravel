//
//  RomanViewController.swift
//  EasyTravel
//
//  Created by Роман Гиниятов on 06.07.2022.
//

import UIKit


class EditTripViewController: UIViewController, CreatePlanDelegate {
    @IBOutlet weak var totalBudgetInBottomLabel: UILabel!
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var listOfProductsTV: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - Properties
    
    var remainedMoney: Double = UserDefaults.standard.double(forKey: "budgetForCreateTrip")
    var delegate: reloadBudgetDelegate?
    
    private let dataStoreManager = DataStoreManager()
    var trip: TripInfo!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsView()
        listOfProductsTV.delegate = self
        listOfProductsTV.dataSource = self
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
    
    func settingsView(){
        totalBudgetInBottomLabel.text = String(remainedMoney)
        backgroundView.layer.cornerRadius = 20
        saveButton.layer.cornerRadius = 20
        backgroundView.layer.masksToBounds = true;
        backgroundView.backgroundColor = UIColor(
            red: 104.0 / 255,
            green: 109.0 / 255,
            blue: 224.0 / 255,
            alpha: 1.0
        )
        saveButton.backgroundColor = UIColor(
            red: 104.0 / 255,
            green: 109.0 / 255,
            blue: 224.0 / 255,
            alpha: 1.0
        )
    }
    
    func savePlan(for plan: CheckPlan) {
        trip.items.append(plan)
        listOfProductsTV.reloadData()
    }
    
    @IBAction func saveButtonDidTap(_ sender: Any) {
        activeTrips[trip.id] = trip
        dataStoreManager.changeActiveTrips(activeTrips: activeTrips)
        
        if let delegate = delegate {
            delegate.reloadBudget(for: remainedMoney, value: spentMoniesReloader())
        }

        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    func spentMoniesReloader() -> Double {
        var sum = 0.0
        trip.items.forEach{
            x in sum += Double(x.quantity) * x.cost
        }
        return sum
    }
}


extension EditTripViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productsCell") as? CheckPlanTableViewCell else { return UITableViewCell() }
        
        cell.nameOfItem.text = trip.items[indexPath.row].object
        if trip.items[indexPath.row].cost != 0.0 {
            let totalAmount = (trip.items[indexPath.row].cost) * Double(trip.items[indexPath.row].quantity)
            cell.priceLabel.text =  "\(totalAmount) руб"
        } else {
            cell.priceLabel.text = ""
        }
        cell.countOfItemLabel.text = "x\(trip.items[indexPath.row].quantity)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = trip?.items.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle : UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            remainedMoney += trip.items[indexPath.row].cost * Double(trip.items[indexPath.row].quantity)
            UserDefaults.standard.set(UserDefaults.standard.double(forKey: "spentMoneyKey") - trip.items[indexPath.row].cost * Double(trip.items[indexPath.row].quantity), forKey: "spentMoneyKey")
            totalBudgetInBottomLabel.text = String(remainedMoney)
            trip.items.remove(at: indexPath.row)
            listOfProductsTV.deleteRows(at: [indexPath] , with: .fade)
            listOfProductsTV.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
}


class EditNavigationViewController: UINavigationController {
    
}
