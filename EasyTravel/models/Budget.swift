//
//  budget.swift
//  EasyTravel
//
//  Created by Тимур Миргалиев on 08.07.2022.
//

import Foundation

struct BudgetStruct {
    var budgetAmount: String
}

final class Budget {
    private enum BudgetKey: String {
        case budgetValue
    }
    
    static var budgetValue: String! {
        get {
            return UserDefaults.standard.string(forKey: BudgetKey.budgetValue.rawValue)
        } set {
            let budgetDefaults = UserDefaults.standard
            let budgetKey = BudgetKey.budgetValue.rawValue
            if let budget = newValue {
                budgetDefaults.set(budget, forKey: budgetKey)
            } else {
                budgetDefaults.removeObject(forKey: budgetKey)
            }
        }
    }
}
