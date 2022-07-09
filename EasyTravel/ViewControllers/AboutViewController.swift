//
//  AboutViewController.swift
//  EasyTravel
//
//  Created by Вадим Валеев on 07.07.2022.
//

import UIKit

struct Developer {
    var name: String
    var discription: String
    var link: String
}

class AboutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var developers: [Developer] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        cell.textLabel?.text = developers[indexPath.row].name
        cell.detailTextLabel?.text = developers[indexPath.row].discription
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        appendTable()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: developers[indexPath.row].link) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
    func appendTable() {
        developers.append(Developer(name: "Илья Гребеньков", discription: "Просмотр пакетов", link: "https://github.com/Felinooper"))
        developers.append(Developer(name: "Вадим Валеев", discription: "Настройки", link: "https://github.com/tuiiiiii"))
        developers.append(Developer(name: "Рустам Шайхинуров", discription: "Главный экран", link: "https://github.com/ShaykhinurovRustam"))
        developers.append(Developer(name: "Сергей Бабич", discription: "Экран приветствия и экраны планов", link: "https://github.com/KreoManser"))
        developers.append(Developer(name: "Роман Емильянов", discription: "План поездки", link: "https://github.com/gentylovePY"))
    }
}
