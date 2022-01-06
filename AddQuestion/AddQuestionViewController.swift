//
//  AddQuestionViewController.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 06.01.2022.
//

import UIKit

class AddQuestionViewController: UIViewController {

    @IBOutlet weak var questionTextBox: UITextField!
    @IBOutlet weak var answer1TextBox: UITextField!
    @IBOutlet weak var answer2TextBox: UITextField!
    @IBOutlet weak var answer3TextBox: UITextField!
    @IBOutlet weak var answer4TextBox: UITextField!
    @IBOutlet weak var correctAnswerTextBox: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    private let questionTaker = QuestionCaretaker()
    private var questionArray = [Question]()
    var question: String = ""
    var answer1: String = ""
    var answer2: String = ""
    var answer3: String = ""
    var answer4: String = ""
    var correctAnswer: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    private func takeQuestion() {
        question = questionTextBox.text!
        answer1 = answer1TextBox.text!
        answer2 = answer2TextBox.text!
        answer3 = answer3TextBox.text!
        answer4 = answer4TextBox.text!
        correctAnswer = correctAnswerTextBox.text!
        var answers = [String]()
        answers.append(answer1)
        answers.append(answer2)
        answers.append(answer3)
        answers.append(answer4)
        let questionToadd = [Question(question: question, answers: answers, correctAnswer: Int(correctAnswer))]
        questionTaker.save(questions: questionToadd)
    }

    

}
