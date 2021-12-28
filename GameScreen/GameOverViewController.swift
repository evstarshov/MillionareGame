//
//  GameOverViewController.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 28.12.2021.
//

import UIKit

class GameOverViewController: UIViewController {
    
    @IBOutlet weak var returnToBeginBTN: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func toLaunchScreen() {
        print("Returning to launch screen")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LaunchScreen") as! LaunchScreenViewController
        self.present(vc, animated: true)
    }


}
