//
//  test1ViewController.swift
//  EasyTravel
//
//  Created by Вадим Валеев on 07.07.2022.
//

import UIKit

protocol test1ViewControllerDelegate: class {
    func update(text: String)
}

class test1ViewController: UIViewController, test1ViewControllerDelegate {

    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? test2ViewController else { return }
        destination.delegate = self
    }
    func update(text: String) {
            textLabel.text = text
        }
    
    @IBAction func pres(_ sender: Any) {
        guard let twoVC = storyboard?.instantiateViewController(withIdentifier: "test2ViewController") else {return}
        present(twoVC, animated: true)
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
