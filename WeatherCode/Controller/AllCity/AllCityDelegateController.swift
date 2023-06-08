//
//  AllCityDelegateController.swift
//  WeatherCode
//
//  Created by Михаил Чертов on 17.05.2023.
//

import UIKit


extension AllCityViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let city = cities[indexPath.row]
            handleUpdatedDataDelegate?.onCityAdd(city: city)
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}
