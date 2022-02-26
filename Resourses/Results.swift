//
//  Results.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 28.12.2021.
//

import Foundation


struct Record: Codable {
    let playerName: String
    let playerScore: Int
    let playerPercentage: Float
}

typealias Memento = Data

final class RecordsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "records"
    
    func save(records: [Record]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Record].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}


class GameCaretaker {
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let key = "game"

    func saveGame(_ game: Game) throws {
        let data: Memento = try encoder.encode(game)
        UserDefaults.standard.set(data, forKey: key)
    }

    func loadGame() throws -> Game {
        guard let data = UserDefaults.standard.value(forKey: key) as? Memento
            , let game = try? decoder.decode(Game.self, from: data) else {
                throw Error.gameNotFound
        }
        return game
    }

    public enum Error: Swift.Error {
        case gameNotFound
    }
}
