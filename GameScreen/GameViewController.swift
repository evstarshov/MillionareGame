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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let question = Question()
        makeQuestion1(model: question)
    }
    
    func makeQuestion1(model: Question) {
        let answers = model.questionDict.values.first
        questionLabel.text = model.questionDict.keys.first
        questionLabel.lineBreakMode = .byCharWrapping
        let answer1 = answers![0]
        let answer2 = answers![1]
        let answer3 = answers![2]
        let answer4 = answers![3]
        answer1Button.setTitle(answer1, for: .normal)
        answer2Button.setTitle(answer2, for: .normal)
        answer3Button.setTitle(answer3, for: .normal)
        answer4Button.setTitle(answer4, for: .normal)
    }

}
