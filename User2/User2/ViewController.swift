//  ViewController.swift
//  Created on 2023/12/13

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var userLists: [UserInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Lists"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? AddUserViewController {
            destinationViewController.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let user = userLists[indexPath.row]
        var configuration = UIListContentConfiguration.cell()
        configuration.text = "Name: \(user.name)"
        configuration.secondaryText = "Phone number: \(user.phoneNumber)"
        cell.contentConfiguration = configuration
        return cell
    }

}

extension ViewController: AddUserDelegate {
    func didAddUser(name: String, phoneNumber: String) {
        self.userLists.append(UserInfo(name: name, phoneNumber: phoneNumber))
        self.tableView.reloadData()
    }
}
