//
//  ViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 04.07.2022.
//

import UIKit

// MARK: - ViewPackageViewController

var typeOfTrip: Package = .trip

class ViewPackageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var mainView: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tripImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configueMainView()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
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
    
    // MARK: - IBActions
    
    @IBAction func dismissCheckPlan(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch typeOfTrip {
        case .trip:
            return tripProducts.count
        case .visit:
            return visitProducts.count
        case .hikking:
            return hikkingProducts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath)
        switch typeOfTrip {
        case .trip:
            tripImage.image = UIImage(named: "Trip")
            cell.textLabel?.text = tripProducts[indexPath.row].label
            descriptionLabel.text = "Путешествие – это нечто большее. Это постоянное движение вперед."
        case .visit:
            tripImage.image = UIImage(named: "Visit")
            cell.textLabel?.text = visitProducts[indexPath.row].label
            descriptionLabel.text = "Поездка – это сравнительно короткое путешествие, с целью посещения кого-либо или чего-либо."
        case .hikking:
            tripImage.image = UIImage(named: "Hikking")
            cell.textLabel?.text = hikkingProducts[indexPath.row].label
            descriptionLabel.text = "Поход – это совместное путешествие группы людей по определенному маршруту и верный путь к обретению здоровья."
        }
        
        return cell
    }
}

// MARK: - CheckPlanNavigationController empty class

class CheckPlanNavigationController: UINavigationController {
    
}
