//
//  Player.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 25.12.2021.
//

import Foundation


class Player {
    static let shared = Player()
    var name: String?
    var score: Int?
    private init() {
    }
}


