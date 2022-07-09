//
//  test2ViewController.swift
//  EasyTravel
//
//  Created by Вадим Валеев on 07.07.2022.
//

import UIKit

class test2ViewController: UIViewController {

    weak var delegate: test1ViewControllerDelegate?
    
    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func changeData(_ sender: Any) {
        delegate?.update(text: "Text was changed")
        dismiss(animated: true)
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
