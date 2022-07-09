//
//  GenderPicker.swift
//  EasyTravel
//
//  Created by Вадим Валеев on 06.07.2022.
//

import Foundation



final class UserSettings {
    
    private enum SettingsKeys: String {
        case userName
        case userGender
    }
    
    static var userName: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.userName.rawValue)
        } set {
            
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userName.rawValue
            if let name = newValue {
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var userGender: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.userGender.rawValue)
        } set {
            
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userGender.rawValue
            if let gender = newValue {
                defaults.set(gender, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
}


