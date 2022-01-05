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
    

    
    var sequence: QuestionSequence = .random
    
    private var createQuestionsStrategy: QuestionSequenceStrategy {
        switch self.sequence {
        case .random:
            return RandomQuestionSequenceStrategy()
        case .sequentally:
            return SequentQuestionSequenceStrategy()
        }
        
    }
    
    
    
    var questions = [Question]()
    var questionNumber = Int()
    var answerNumber = Int()
    var answeredQuestions: Int = 0
    var pickedQuestion = Question()
    private let recordsTaker = RecordsCaretaker()
    private var recordsArray: [Record] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeQuestions()
        makeButtons()
    }
    

    fileprivate func makeQuestions() {
        questions = self.createQuestionsStrategy.makeQuestions()
        pickQuestion()
    }
    
    private func pickQuestion() {

            
        let pickQuestion = questions.first
        let answer1 = pickQuestion?.answers[0]
            let answer2 = pickQuestion?.answers[1]
            let answer3 = pickQuestion?.answers[2]
            let answer4 = pickQuestion?.answers[3]
            questionLabel.text = pickQuestion?.question
            answer1Button.setTitle(answer1, for: .normal)
            answer2Button.setTitle(answer2, for: .normal)
            answer3Button.setTitle(answer3, for: .normal)
            answer4Button.setTitle(answer4, for: .normal)
        pickedQuestion = pickQuestion ?? Question(question: "В каком известном романе фигурировали Джо, Мег, Бет и Эми Марч?", answers: ["Убить пересмешника","Том Сойер","Маленькие женщины","Моби Дик"], correctAnswer: 3)
    }

    private func makeButtons() {
        print("Configuring Buttons")
        answer1Button.backgroundColor = .darkGray
        answer2Button.backgroundColor = .darkGray
        answer3Button.backgroundColor = .darkGray
        answer4Button.backgroundColor = .darkGray
        answer1Button.setTitleColor(.systemOrange, for: .normal)
        answer2Button.setTitleColor(.systemOrange, for: .normal)
        answer3Button.setTitleColor(.systemOrange, for: .normal)
        answer4Button.setTitleColor(.systemOrange, for: .normal)
    }
    
    @IBAction func answer1Tapped() {
        print("Answer 1 tapped")
        answer1Button.backgroundColor = .green
        answerNumber = 1
        isAnswerCorrect()
        makeButtons()
    }
    
    @IBAction func answer2Tapped() {
        print("Answer 2 tapped")
        answer2Button.backgroundColor = .green
        answerNumber = 2
        isAnswerCorrect()
        makeButtons()
    }
    
    @IBAction func answer3Tapped() {
        print("Answer 3 tapped")
        answer3Button.backgroundColor = .green
        answerNumber = 3
        isAnswerCorrect()
        makeButtons()
    }
    
    @IBAction func answer4Tapped() {
        print("Answer 4 tapped")
        answer4Button.backgroundColor = .green
        answerNumber = 4
        isAnswerCorrect()
        makeButtons()
    }
    
    private func isAnswerCorrect() -> Bool {
        if pickedQuestion.correctAnswer == answerNumber {
            print("Correct!")
            questions.remove(at: 0)
            answeredQuestions += 1
            print("Answered qustions = \(answeredQuestions)")
            gameFinal()
            pickQuestion()
            return true
        } else {
            print("Game over by player \(Player.shared.name ?? "")")
            Player.shared.score = answeredQuestions
            let record = Record(playerName: Player.shared.name ?? "name error", playerScore: Player.shared.score ?? 0)
            Game.shared.addRecord(record)
            recordsArray = Game.shared.records
            recordsTaker.save(records: recordsArray)
            print("Records in table: \(Game.shared.records.count)")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "GameOverID") as! GameOverViewController
            self.present(vc, animated: true)
            return false
        }
    }
    
    private func gameFinal() {
        guard questions.count == 0 else { return }
        Player.shared.score = answeredQuestions
        let record = Record(playerName: Player.shared.name ?? "name error", playerScore: Player.shared.score ?? 0)
        Game.shared.addRecord(record)
        recordsArray = Game.shared.records
        recordsTaker.save(records: recordsArray)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "GameFinalID") as! GameFinalViewController
        self.present(vc, animated: true)
    }
}
