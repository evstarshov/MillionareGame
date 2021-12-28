//
//  GameFinalViewController.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 28.12.2021.
//

import UIKit

class GameFinalViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var toLaunchScreenBTN: UIButton!
    @IBOutlet weak var scoreTableBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScore()
    }
    
    private func configureScore() {
        print("Score for player \(PlayerSettings.playerName ?? "error")")
        scoreLabel.text = String(PlayerSettings.score)
    }
    
    @IBAction func goToLaunchScreen() {
        print("Returning to launch screen")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LaunchScreen") as! LaunchScreenViewController
        self.present(vc, animated: true)
    }
    
}
