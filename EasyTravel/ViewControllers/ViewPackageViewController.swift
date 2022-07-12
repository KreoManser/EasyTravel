//
//  ViewController.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 04.07.2022.
//

import UIKit

var typeOfTrip: String = packageList[0]

class ViewPackageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Outlets
    
    @IBOutlet weak var mainView: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tripImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configueMainView()
        
        tableView.delegate = self
        tableView.dataSource = self
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
    
    // MARK: - IBActions
    
    @IBAction func dismissCheckPlan(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch typeOfTrip {
        case packageList[0]:
            return tripProducts.count
        case packageList[1]:
            return visitProducts.count
        case packageList[2]:
            return hikkingProducts.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath)
        switch typeOfTrip {
        case packageList[0]:
            tripImage.image = UIImage(named: "Trip")
            cell.textLabel?.text = tripProducts[indexPath.row].object
            descriptionLabel.text = "Путешествие – это нечто большее. Это постоянное движение вперед."
        case packageList[1]:
            tripImage.image = UIImage(named: "Visit")
            cell.textLabel?.text = visitProducts[indexPath.row].object
            descriptionLabel.text = "Поездка – это сравнительно короткое путешествие, с целью посещения кого-либо или чего-либо."
        case packageList[2]:
            tripImage.image = UIImage(named: "Hikking")
            cell.textLabel?.text = hikkingProducts[indexPath.row].object
            descriptionLabel.text = "Поход – это совместное путешествие группы людей по определенному маршруту и верный путь к обретению здоровья."
        default:
            return UITableViewCell()
        }
        return cell
    }
}

class CheckPlanNavigationController: UINavigationController {
}
