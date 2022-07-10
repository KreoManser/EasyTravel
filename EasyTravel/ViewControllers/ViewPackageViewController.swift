//
//  ViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 04.07.2022.
//

import UIKit

// MARK: - ViewPackageViewController

class ViewPackageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var mainView: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var tripProducts: [ProductModel] = [
        ProductModel(label: "Документы"),
        ProductModel(label: "Летняя одежда"),
        ProductModel(label: "Обувь"),
        ProductModel(label: "Зонт"),
        ProductModel(label: "Деньги"),
        ProductModel(label: "Билеты"),
        ProductModel(label: "Очки"),
        ProductModel(label: "Беруши"),
        ProductModel(label: "Маска для сна"),
        ProductModel(label: "Средства личной гигиены"),
        ProductModel(label: "Косметичка"),
        ProductModel(label: "Аптечка"),
        ProductModel(label: "Средство для загара"),
        ProductModel(label: "Полотенца"),
        ProductModel(label: "Средство от ожогов"),
        ProductModel(label: "Зарядное устройство"),
        ProductModel(label: "Powerbank")
    ]
    
    
    var visitProducts: [ProductModel] = [
        ProductModel(label: "Документы"),
        ProductModel(label: "Одежда"),
        ProductModel(label: "Обувь"),
        ProductModel(label: "Зонт"),
        ProductModel(label: "Деньги"),
        ProductModel(label: "Билеты"),
        ProductModel(label: "Очки"),
        ProductModel(label: "Беруши"),
        ProductModel(label: "Маска для сна"),
        ProductModel(label: "Средства личной гигиены"),
        ProductModel(label: "Косметичка"),
        ProductModel(label: "Зарядное устройство"),
        ProductModel(label: "Powerbank")
    ]
    
    var hikkingProducts: [ProductModel] = [
        ProductModel(label: "Одежда"),
        ProductModel(label: "Документы"),
        ProductModel(label: "Спортивное снаряжение"),
        ProductModel(label: "Палатка"),
        ProductModel(label: "Перчатки"),
        ProductModel(label: "Продуктовый набор"),
        ProductModel(label: "Деньги"),
        ProductModel(label: "Лейкопластырь"),
        ProductModel(label: "Спальный мешок"),
        ProductModel(label: "Очки"),
        ProductModel(label: "Походный нож"),
        ProductModel(label: "Косметичка"),
        ProductModel(label: "Аптечка"),
        ProductModel(label: "Телефон"),
        ProductModel(label: "Зарядное устройство"),
        ProductModel(label: "Powerbank"),
        ProductModel(label: "Вода")
    ]
    
    var typeOfTrip: Package = .trip
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configueMainView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        print(typeOfTrip)
    }
    
    @IBAction func dismissCheckPlan(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    
    private func configueMainView() {
        mainView?.layer.shadowColor = UIColor.black.cgColor
        mainView?.layer.shadowOpacity = 0.6
        mainView?.layer.shadowRadius = 10
        mainView?.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
                        
    private func appendProducts() {
        // APPEND
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath)
        cell.textLabel?.text = tripProducts[indexPath.row].label
        
        return cell
    }
}

// MARK: - CheckPlanNavigationController empty class

class CheckPlanNavigationController: UINavigationController {
    
}
