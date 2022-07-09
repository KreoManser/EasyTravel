//
//  AboutViewController.swift
//  EasyTravel
//
//  Created by Вадим Валеев on 07.07.2022.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var simpleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        simpleView.layer.cornerRadius = 25
        
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
