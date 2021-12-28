//
//  GameViewController.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 25.12.2021.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    var questions = [Question]()
    var questionNumber = Int()
    var answerNumber = Int()
    var answeredQuestions: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = [
        Question(question: "Из какого фильма Прекрасный принц?", answers: ["Золушка","Русалочка","Спящая Красавица","Мулан"], correctAnswer: 1),
        Question(question: "Из какой страны родом Джастин Бибер?", answers: ["Канада","США","Франция","Англия"], correctAnswer: 1),
        Question(question: "В сиквеле какого праздничного фильма снялся Дональд Трамп?", answers: ["Один Дома","Один дома 2","Ричи Рич","Маленькие негодяи"], correctAnswer: 2),
        Question(question: "Какой герой мультфильма живет в ананасе под водой?", answers: ["Камбала","Немо","Рик и Морти","Губка Боб"], correctAnswer: 4),
        Question(question: "Что является национальным животным Шотландии?", answers: ["Лошадь","Единорог","Волк","Корова"], correctAnswer: 2),
        Question(question: "В каком известном романе фигурировали Джо, Мег, Бет и Эми Марч?", answers: ["Убить пересмешника","Том Сойер","Маленькие женщины","Моби Дик"], correctAnswer: 3)
        ]
    }

    
    private func pickQuestion(model: Question) {
        questionLabel.text = questions.randomElement()?.question
    }
    
}
