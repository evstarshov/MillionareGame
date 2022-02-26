//
//  Question.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 25.12.2021.
//

import Foundation

struct Question: Codable {
    var question: String!
    var answers: [String]!
    var correctAnswer: Int!
}

