//
//  GreetingsViewController.swift
//  EasyTravel
//
//  Created by Рустам Шайхинуров on 07.07.2022.
//

import UIKit

class GreetingsViewController: UIViewController {

    @IBOutlet weak var selectMaleButton: UIButton!
    @IBOutlet weak var selectFemaleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonShadow()
    }
    
    private func setButtonShadow() {
        
        selectMaleButton.layer.shadowColor = UIColor.black.cgColor
        selectMaleButton.layer.shadowOpacity = 0.6
        selectMaleButton.layer.shadowRadius = 10
        selectMaleButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        selectFemaleButton.layer.shadowColor = UIColor.black.cgColor
        selectFemaleButton.layer.shadowOpacity = 0.6
        selectFemaleButton.layer.shadowRadius = 10
        selectFemaleButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
    }
    
    @IBAction func selectMaleButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let plansVC = storyboard.instantiateViewController(withIdentifier: "MainMenuViewController") as? MainMenuViewController else { return }
        
        navigationController?.pushViewController(plansVC, animated: true)
    }
    
    @IBAction func selectFemaleButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let plansVC = storyboard.instantiateViewController(withIdentifier: "MainMenuViewController") as? MainMenuViewController else { return }
        
        navigationController?.pushViewController(plansVC, animated: true)
    }

}
