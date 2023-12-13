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
    
    
    @IBAction func addUser(_ sender: Any) {
        let alertController = UIAlertController(title: "Add User", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Name"
        }
        
        alertController.addTextField { textField in
            textField.placeholder = "Phone Number"
            textField.keyboardType = .phonePad
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let name = alertController.textFields?.first?.text,
                  let phoneNumber = alertController.textFields?.last?.text else {
                return
            }
            self?.userLists.append(UserInfo(name: name, phoneNumber: phoneNumber))
            self?.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
}

