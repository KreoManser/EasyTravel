//
//  RomanViewController.swift
//  EasyTravel
//
//  Created by Роман Гиниятов on 06.07.2022.
//

import UIKit

struct Ter{
    var name:String
    let lastname:Double
    let kolve:Int
}

class RomanViewController: UIViewController {
    
  
    var ters:[Ter] = []
    let idCell = "mainCell"
    @IBOutlet var saveButtton: UIButton!
    @IBOutlet var viewScore: UIView!
    var sumArray:[Double] = []
    var sumKolArray:[Int] = []
    var MainMoney:Double = 46300
    @IBOutlet var addButton: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var score: UILabel!
    var flag = true
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsView()
    }
    
    
    
    @IBAction func clickSaveButton(_ sender: Any) {
        //кнопка сохранить
    }
    
    @IBAction func ClickAddButton(_ sender: Any) {
        guard let createVc = storyboard?.instantiateViewController(withIdentifier: "CreateTripViewController") as? CreateTripViewController
        else{
            return
        }
        createVc.delegate = self
        present(createVc, animated: true)
        
    }
    
    func totalScore() -> (Void){
        if flag == true {
            createAlert(
                
                title: "Ошибка",description: "Не удалось добавить товар! Проверте баланс"
                
            )
            
            var sum:Double = 0
            if sumArray.count == 0 {
                score.text = String( 0)
                
            }
            else
            {
                for index in sumArray.count-1...sumArray.count-1{ //0,1
                sum = (Double ( sumArray[index]) * Double (sumKolArray[index]))
                if sum > MainMoney {
                    sumArray.removeLast()
                    ters.removeLast()
                    sumKolArray.removeLast()
                    sum = 0
                    createAlert(title: "Ошибка!", description: "Не удалось добавить товар! Проверте баланс")
                }
            }
                MainMoney = MainMoney - sum
                if  MainMoney == 0{
                    flag = false
                    createAlert(title: "Ошибка!", description: "Не удалось добавить товар! Проверте баланс")
                }
                score.text = String( MainMoney)}
        }
        else{
            sumArray.removeLast()
            ters.removeLast()
            sumKolArray.removeLast()
            createAlert(title: "Ошибка!", description: "Не удалось добавить товар! Проверте баланс")
        }
    }
    
    func settingsView(){
        score.text = String(MainMoney)
        tableView.dataSource = self
        tableView.delegate = self
        viewScore.layer.cornerRadius = 20
        saveButtton.layer.cornerRadius = 10
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
    
extension RomanViewController: UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ters.count
    }
    
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! RomanTableViewCell
        cell.labels.text = ters[indexPath.row].name
        let ff = (ters[indexPath.row].lastname) * Double(ters[indexPath.row].kolve)
        cell.lastname.text =  "\(ff) руб"
        cell.kolve.text = "x\(ters[indexPath.row].kolve)"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle : UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            tableView.beginUpdates()
            MainMoney += ( (sumArray[indexPath.row] ) *  Double (sumKolArray[indexPath.row]))
            if MainMoney >= 0 {
                flag = true
            }
            ters.remove(at: indexPath.row)
            sumArray.remove(at: indexPath.row)
            sumKolArray.remove(at: indexPath.row)
            score.text = String( MainMoney)
            tableView.deleteRows(at: [indexPath] , with: .fade)
            tableView.endUpdates()
        }
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
}


extension RomanViewController:CreateStudentDelegate{
    func saveStudent(student: Ter) {
        ters.append(student)
        sumArray.append(student.lastname)
        sumKolArray.append(student.kolve)
        totalScore()
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
        
    }
   
}


    


