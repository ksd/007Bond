//
//  BondListViewController.swift
//  007Bond
//
//  Created by ksd on 01/12/2022.
//

import UIKit


class BondListViewController: UIViewController {
    
    @IBOutlet weak var bondListTableView: UITableView! {
        didSet {
            bondListTableView.dataSource = self
        }
    }
    
    weak var bondService: BondService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}


extension BondListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bondService?.listOfBonds.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bondCell", for: indexPath) as? BondTableViewCell
        cell?.bondLabel.text = bondService?.listOfBonds[indexPath.row].name ?? "no bond"
        return cell!
    }
    
}
