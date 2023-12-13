//  ViewController.swift
//  Created on 2023/12/13

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var imageNames: [String] = Array(0...10).map { "Seattle\($0).jpg" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let imageName = imageNames[indexPath.row]
        var configuration = UIListContentConfiguration.cell()
        configuration.image = UIImage(named: imageName)
        cell.contentConfiguration = configuration
        return cell
    }
    
}

