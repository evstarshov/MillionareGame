//
//  GameFinalViewController.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 28.12.2021.
//

import UIKit

class GameFinalViewController: UIViewController {
    @IBOutlet weak var congratsNameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var toLaunchScreenBTN: UIButton!
    @IBOutlet weak var scoreTableBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScore()
    }
    
    private func configureScore() {
        print("Score for player \(Player.shared.name ?? "error")")
        scoreLabel.text = String(Player.shared.score ?? 0)
        congratsNameLabel.text = "Поздравляем, \(String(describing: Player.shared.name ?? "Вас"))!"
    }
    
    @IBAction func goToLaunchScreen() {
        print("Returning to launch screen")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LaunchScreen") as! LaunchScreenViewController
        self.present(vc, animated: true)
    }
    
}
