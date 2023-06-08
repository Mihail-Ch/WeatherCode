//
//  WeatherCollectionViewCell.swift
//  WeatherCode
//
//  Created by Михаил Чертов on 07.06.2023.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "collectionViewCell"
    
    lazy var weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "sun.max")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var weather: UILabel = {
        let label = UILabel()
        label.text = "+20℃"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var time: UILabel = {
        let label = UILabel()
        label.text = "07.06.2023"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        contentView.addSubview(time)
        contentView.addSubview(weatherImage)
        contentView.addSubview(weather)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            time.centerXAnchor.constraint(equalTo: centerXAnchor),
            time.topAnchor.constraint(equalTo: topAnchor),
           
            weatherImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherImage.topAnchor.constraint(equalTo: time.bottomAnchor, constant: -5),
            weatherImage.widthAnchor.constraint(equalToConstant: bounds.width/2),
            weatherImage.heightAnchor.constraint(equalToConstant: bounds.height/2),
            
            weather.centerXAnchor.constraint(equalTo: centerXAnchor),
            weather.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 5),
            weather.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //данные = nil
    }
    
}
