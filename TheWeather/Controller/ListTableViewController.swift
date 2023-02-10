//
//  ViewController.swift
//  TheWeather
//
//  Created by Айдар Оспанов on 07.02.2023.
//

import UIKit
import CoreLocation

final class ListTableViewController: UITableViewController {
    
    let emptyCity = TheWeatherModel()
    
    var cities = [TheWeatherModel]()
    let nameCities = ["Астана", "Алматы", "Тараз", "Кызылорда", "Кокшетау", "Караганда"]
    
    let idListCell = "idListCell"
    
    let networkWeatherManager = NetworkWeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Cities"
        
        tableView.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: idListCell)
        
        
        if cities.isEmpty {
            cities = Array(repeating: emptyCity, count: nameCities.count)
        }
        addCities()
        
    }
    
    func addCities() {
        
        getCityWeather(nameCities: nameCities) { index, weather in
            
            self.cities[index] = weather
            self.cities[index].name = self.nameCities[index]
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idListCell, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        var modelWeather = TheWeatherModel()
        
        modelWeather = cities[indexPath.row]
        
        cell.configure(modelWeather)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DescriptionViewController()
        navigationController?.pushViewController(vc, animated: true)
        enter()
    }
    
}


extension ListTableViewController {
    func enter() {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let cityWeather = cities[indexPath.row]
        
        let description = self.navigationController?.viewControllers[1] as? DescriptionViewController
        description?.weatherModel = cityWeather
    }
}
