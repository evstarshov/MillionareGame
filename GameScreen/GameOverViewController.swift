//
//  GameOverViewController.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 28.12.2021.
//

import UIKit

class GameOverViewController: UIViewController {
    
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var returnToBeginBTN: NSLayoutConstraint!
    @IBOutlet weak var scoreLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setScore()
    }
    
    @IBAction func toLaunchScreen() {
        print("Returning to launch screen")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LaunchScreen") as! LaunchScreenViewController
        self.present(vc, animated: true)
    }
    
    private func setScore() {
        print("Setting score for player \(String(describing: Player.shared.name ?? "error"))")
        scoreLabel.text = String(Player.shared.score ?? 0)
        gameOverLabel.text = "ИГРА ОКОНЧЕНА, \(String(describing: Player.shared.name ?? ""))"
    }


}
