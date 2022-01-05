//
//  SettingsViewController.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 05.01.2022.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var sequentSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Game.sequence == .sequentally {
        sequentSelector.selectedSegmentIndex = 0
        } else {
            sequentSelector.selectedSegmentIndex = 1
        }
       
    }
    
    @IBAction func selector(_ sender: Any) {
        Game.sequence = self.selectSequent
    }
    
    private var selectSequent: QuestionSequence {
        switch self.sequentSelector.selectedSegmentIndex {
        case 0:
            return .sequentally
        case 1:
            return .random
        default:
            return .sequentally
        }
    }

}
