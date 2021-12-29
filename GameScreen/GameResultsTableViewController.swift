//
//  GameResultsTableViewController.swift
//  MillionareGame
//
//  Created by Евгений Старшов on 28.12.2021.
//

import UIKit

class GameResultsTableViewController: UITableViewController {
    
    @IBOutlet var tableViewHeader: TableHeader!
    
    private let records = Game.shared.records

    override func viewDidLoad() {
        super.viewDidLoad()
        makeCells()
    }

    // MARK: - Table view data source
    
    private func makeCells() {
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "headerCell")
        tableViewHeader.imageView.image = UIImage(named: "headerImage")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "recordCell")
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return records.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath)
                let record = Game.shared.records[indexPath.row]
        cell.textLabel?.text = record.playerName
        cell.detailTextLabel?.text = "\(record.playerScore)"
        return cell
    }

}
