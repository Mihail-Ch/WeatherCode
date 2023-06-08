//
//  AllCityDataSourceController.swift
//  WeatherCode
//
//  Created by Михаил Чертов on 17.05.2023.
//

import UIKit


extension AllCityViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CitiesTableViewCell.reuseId, for: indexPath) as? CitiesTableViewCell else {
            fatalError("The TableView could not dequeue a CustomCell in ViewController.")
        }
        let city = cities[indexPath.row]
        cell.cityName.text = city
        return cell
    }
    
    
    
    
}
