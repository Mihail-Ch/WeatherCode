//
//  CityDataSourceController.swift
//  WeatherCode
//
//  Created by Михаил Чертов on 17.05.2023.
//

import UIKit

extension MyCityViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CitiesTableViewCell.reuseId, for: indexPath) as! CitiesTableViewCell
        let city = myCities[indexPath.row]
        cell.cityName.text = city
        return cell
    }
    
}

