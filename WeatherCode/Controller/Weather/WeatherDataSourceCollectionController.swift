//
//  WeatherDataSourceCollectionController.swift
//  WeatherCode
//
//  Created by Михаил Чертов on 17.05.2023.
//

import UIKit



extension WeatherViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.reuseId, for: indexPath) as! WeatherCollectionViewCell
        cell.time.text = "8/06/23"
        cell.weather.text = "+19℃"
        return cell
    }
    
    
    
    
}
