//
//  CreateTripViewController.swift
//  EasyTravel
//
//  Created by Роман Гиниятов on 06.07.2022.
//

import UIKit

protocol CreateStudentDelegate:AnyObject{
    func saveStudent(student:Ter)
}


class CreateTripViewController: UIViewController {
    @IBOutlet weak var name:UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var valuee: UITextField!
    @IBOutlet var kolvo: UITextField!
    @IBOutlet var buttonClick: UIButton!
    weak var delegate:CreateStudentDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonClick.layer.cornerRadius = 10
        buttonClick.clipsToBounds = true
       // buttonClick.backgroundColor = .blue
        buttonClick.backgroundColor = UIColor(red: 104.0 / 255, green: 109.0 / 255, blue: 224.0 / 255, alpha: 1.0)
       // view1.layer.cornerRadius = 10
       
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func clickButton(_ sender: Any) {
        
        
        guard let name = name.text else {return}
        guard   let lastname =  lastname.text else {return}
        guard let kolvo = kolvo.text else {return}
        
        let score = Double(lastname)
        let kolvoo = Int(kolvo)
      
    
        if name != "" && lastname != "" && kolvo != ""{
            if score != nil && kolvoo != nil{
            let terr = Ter(name: name, lastname: score!, kolve: kolvoo!)
           
            delegate?.saveStudent(student: terr)
             dismiss(animated: true)
            }else{
                createAlert(title: "Ошибка!", description: "Заполните корректно поле для цены")
            }
        }else{
            createAlert(title: "Ошибка!", description: "Заполните все поля")
            
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIViewController {

    func createAlert(title: String?, description: String?) {

        let alertController = UIAlertController(

            title: title, message: description, preferredStyle: .alert

        )

        alertController.addAction(

            UIAlertAction(title: "OK", style: .default, handler: nil)

        )

        present(alertController, animated: true, completion: nil)

    }

}
