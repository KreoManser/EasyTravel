//
//  UserSettings.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 08.07.2022.
//

import Foundation

enum SexType: String {
    case male
    case female
}

final class UserSettings: UserDefaults {
    
//    let firstRun = true
    
    private enum SettingsKeys: String {
        case user
    }
    
    static var user: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.user.rawValue)
        } set {
            
            let defaults = UserDefaults.standard
            let key = SettingsKeys.user.rawValue
            if let sex = newValue {
                defaults.set(sex, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
//    static var firstRun: Bool {
//        
//    }
}
