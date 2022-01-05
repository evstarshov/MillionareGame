//
//  QuestionSequenseStrategy.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 05.01.2022.
//

import Foundation


protocol QuestionSequenceStrategy {
    func makeQuestions() -> [Question]
}


final class RandomQuestionSequenceStrategy: QuestionSequenceStrategy {
    
    private var questions = [
        Question(question: "Из какого фильма Прекрасный принц?", answers: ["Золушка","Русалочка","Спящая Красавица","Мулан"], correctAnswer: 1),
        Question(question: "Из какой страны родом Джастин Бибер?", answers: ["Канада","США","Франция","Англия"], correctAnswer: 1),
        Question(question: "В сиквеле какого праздничного фильма снялся Дональд Трамп?", answers: ["Один Дома","Один дома 2","Ричи Рич","Маленькие негодяи"], correctAnswer: 2),
        Question(question: "Какой герой мультфильма живет в ананасе под водой?", answers: ["Камбала","Немо","Рик и Морти","Губка Боб"], correctAnswer: 4),
        Question(question: "Что является национальным животным Шотландии?", answers: ["Лошадь","Единорог","Волк","Корова"], correctAnswer: 2),
        Question(question: "В каком известном романе фигурировали Джо, Мег, Бет и Эми Марч?", answers: ["Убить пересмешника","Том Сойер","Маленькие женщины","Моби Дик"], correctAnswer: 3)
    ]
    
    func makeQuestions() -> [Question] {
        var questionArr = [Question]()
        for i in questions {
        let indexR = questions.indices.randomElement()
        let pickQuestion = Question(question: questions[indexR ?? 0].question, answers: questions[indexR ?? 0].answers, correctAnswer: questions[indexR ?? 0].correctAnswer)
            questionArr.append(pickQuestion)
            questions.remove(at: indexR ?? 0)
        }
        return questionArr
    }
    
    
}

final class SequentQuestionSequenceStrategy: QuestionSequenceStrategy {
    
    private let questions = [
        Question(question: "Из какого фильма Прекрасный принц?", answers: ["Золушка","Русалочка","Спящая Красавица","Мулан"], correctAnswer: 1),
        Question(question: "Из какой страны родом Джастин Бибер?", answers: ["Канада","США","Франция","Англия"], correctAnswer: 1),
        Question(question: "В сиквеле какого праздничного фильма снялся Дональд Трамп?", answers: ["Один Дома","Один дома 2","Ричи Рич","Маленькие негодяи"], correctAnswer: 2),
        Question(question: "Какой герой мультфильма живет в ананасе под водой?", answers: ["Камбала","Немо","Рик и Морти","Губка Боб"], correctAnswer: 4),
        Question(question: "Что является национальным животным Шотландии?", answers: ["Лошадь","Единорог","Волк","Корова"], correctAnswer: 2),
        Question(question: "В каком известном романе фигурировали Джо, Мег, Бет и Эми Марч?", answers: ["Убить пересмешника","Том Сойер","Маленькие женщины","Моби Дик"], correctAnswer: 3)
    ]
    
    
    func makeQuestions() -> [Question] {
        let questionArr = questions
        return questionArr
    }
    
    
}
