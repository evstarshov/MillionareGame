//
//  Player.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 25.12.2021.
//

import Foundation

final class Player {
    let name: String
    var count = 0
    
    init(name: String) {
    self.name = name
    }
}

final class PlayerSettings {
    
    private enum Keys: String {
        case playerName
        case score
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
    
    static var score: Int! {
        get{
            return UserDefaults.standard.integer(forKey: Keys.score.rawValue)
        }
        set {
        let defaults = UserDefaults.standard
        let key = Keys.playerName.rawValue
        if let score = newValue {
            print("Score was set to \(score) with key \(key)")
            defaults.set(score, forKey: key)
        } else {
            defaults.removeObject(forKey: key)
        }
    }
}
}
