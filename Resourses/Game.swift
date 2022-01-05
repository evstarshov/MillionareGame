//
//  Game.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 28.12.2021.
//

import Foundation

final class Game: Codable {
    
    static let shared = Game()
    
    private(set) var records: [Record] = []
    
    private init() { }
    
    func addRecord(_ record: Record) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
}


