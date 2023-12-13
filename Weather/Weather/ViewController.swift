//  ViewController.swift
//  Created on 2023/12/13

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var weatherData: [WeatherData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        fetchData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let weather = weatherData[indexPath.row]
        var configuration = UIListContentConfiguration.cell()
        configuration.text = "\(weather.city): \(weather.temperature)°C"
        configuration.secondaryText = "\(weather.conditions)"
        cell.contentConfiguration = configuration
        return cell
    }
    
    private func fetchData() {
        guard let url = URL(string: "https://us-central1-fir-api-s-8d31b.cloudfunctions.net/app") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode([WeatherData].self, from: data)
                self.weatherData = decodedData
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}

