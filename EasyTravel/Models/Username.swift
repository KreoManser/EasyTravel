//
//  Username.swift
//  EasyTravel
//
//  Created by Вадим Валеев on 08.07.2022.
//

import Foundation

final class UserSettings {
    private enum SettingsKeys: String {
        case userName
        case userGender
    }
    
    private enum SettingsKeysForFirstRun: String {
        case newUser
    }
    
    static var user: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeysForFirstRun.newUser.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeysForFirstRun.newUser.rawValue
            if let sex = newValue {
                defaults.set(sex, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var userName: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.userName.rawValue)
        } set {
            
            let nameDefaults = UserDefaults.standard
            let nameKey = SettingsKeys.userName.rawValue
            if let name = newValue {
                nameDefaults.set(name, forKey: nameKey)
            } else {
                nameDefaults.removeObject(forKey: nameKey)
            }
        }
    }
    
    static var userGender: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.userGender.rawValue)
        } set {
            
            let genderDefaults = UserDefaults.standard
            let genderKey = SettingsKeys.userGender.rawValue
            if let gender = newValue {
                genderDefaults.set(gender, forKey: genderKey)
            } else {
                genderDefaults.removeObject(forKey: genderKey)
            }
        }
    }
}

enum GenderType: String {
    case male = "Мужской"
    case female = "Женский"
}

struct User {
    var name: String = "Username"
    var gender: String
}
