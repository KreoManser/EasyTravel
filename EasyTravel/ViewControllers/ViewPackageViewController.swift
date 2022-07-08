//
//  ViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 04.07.2022.
//

import UIKit

class ViewPackageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mainView: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var products: [ProductModel] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath)
        
        cell.textLabel?.text = products[indexPath.row].label
        cell.detailTextLabel?.text = products[indexPath.row].discription
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configueMainView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        appendProducts()
    }
    
    private func configueMainView() {
        mainView?.layer.shadowColor = UIColor.black.cgColor
        mainView?.layer.shadowOpacity = 0.6
        mainView?.layer.shadowRadius = 10
        mainView?.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
                        
    private func appendProducts() {
        products.append(ProductModel(label: "Бургер", discription: "Пиздатый бургер"))
        products.append(ProductModel(label: "Хлеб", discription: "Пиздатый хлеб"))
        products.append(ProductModel(label: "Жопа", discription: "Пиздатый жопа"))
    }
}

