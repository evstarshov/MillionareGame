//
//  GameResultsTableViewController.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 28.12.2021.
//

import UIKit

class GameResultsTableViewController: UITableViewController {
    
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var tableFooter: TableFooter!
    @IBOutlet var tableViewHeader: TableHeader!
    
    let recordTaker = RecordsCaretaker()
    
    private var records: [Record] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        makeCells()
        configureExitButton()
        configureClearButton()
        records = recordTaker.retrieveRecords()
    }

    // MARK: - Table view data source
    
    private func makeCells() {
        tableView.backgroundColor = .black
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "headerCell")
        tableViewHeader.backgroundColor = .black
        tableViewHeader.imageView.image = UIImage(named: "headerImage")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "recordCell")
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "footerCell")
        tableFooter.backgroundColor = .black
    }
    
    private func configureExitButton() {
        exitButton.backgroundColor = .systemOrange
        exitButton.setTitle("Выход", for: .normal)
        exitButton.setTitleColor(.white, for: .normal)
        exitButton.adjustsImageSizeForAccessibilityContentSizeCategory = true
    }
    
    private func configureClearButton() {
        clearButton.backgroundColor = .darkGray
        clearButton.setTitle("Очистить таблицу", for: .normal)
        clearButton.setTitleColor(.white, for: .normal)
        clearButton.adjustsImageSizeForAccessibilityContentSizeCategory = true
    }
    
    @IBAction func exitToLaunchScreen () {
        print("Going back to launch screen")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LaunchScreen") as! LaunchScreenViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func clearTable() {
        Game.shared.clearRecords()
        records.removeAll()
        tableView.reloadData()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath)
                let record = records[indexPath.row]
        cell.backgroundColor = .black
        cell.textLabel?.text = "Игрок: " + record.playerName + "   " + "набрал " + "\(record.playerScore)"
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .systemOrange
        return cell
    }

}
