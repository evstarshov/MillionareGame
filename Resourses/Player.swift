//
//  Player.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 25.12.2021.
//

import Foundation

final class Player {
    
    private enum Keys: String {
        case playerName
    }
    
    static var playerName: String! {
        get{
            return UserDefaults.standard.string(forKey: Keys.playerName.rawValue)
        }
        
        set {
            let defaults = UserDefaults.standard
            let key = Keys.playerName.rawValue
            if let name = newValue {
                print("Name was set to \(name) with key \(key)")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
}
