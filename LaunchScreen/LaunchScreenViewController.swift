//
//  LaunchScreenViewController.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 25.12.2021.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var resultsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       
       AppUtility.lockOrientation(.portrait)
       
       
   }

   override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       
       // Don't forget to reset when view is being removed
       AppUtility.lockOrientation(.all)
   }
    
    @IBAction func newGame(_ sender: Any) {
        if isValid() == false {
            print("game started")
        } else {
            showAlertNameEmpty()
        }
    }
    
    private func showAlertNameEmpty() {
            let alertController = UIAlertController(
                title: "Ошибка",
                message: "Имя не может быть пустым",
                preferredStyle: .alert)
            let alertItem = UIAlertAction(
                title: "Ok:(",
                style: .cancel)
            { _ in
                self.nameTextField.text = ""
            }
            alertController.addAction(alertItem)
            present(alertController,
                    animated: true,
                    completion: nil)
        }
    
    private func showAlertNameTooLarge() {
            let alertController = UIAlertController(
                title: "Ошибка",
                message: "Имя слишком длинное",
                preferredStyle: .alert)
            let alertItem = UIAlertAction(
                title: "Ok:(",
                style: .cancel)
            { _ in
                self.nameTextField.text = ""
            }
            alertController.addAction(alertItem)
            present(alertController,
                    animated: true,
                    completion: nil)
        }
    
    private func isValid() -> Bool {
        if nameTextField.text == ""
             {
            return true
        } else if nameTextField.text?.count ?? 0 > 10 {
            showAlertNameTooLarge()
            return true
        } else {
            return false
        }
    }

}
